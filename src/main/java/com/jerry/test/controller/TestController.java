package com.jerry.test.controller;

import com.jerry.context.common.InputModel;
import com.jerry.context.common.OutputModel;
import com.jerry.context.common.PlatformType;
import com.jerry.context.component.CacheComponent;
import com.jerry.context.component.CacheComponent.TimerCache;
import com.jerry.context.exception.ServiceException;
import com.jerry.context.utils.ObjectUtil;
import com.jerry.shiro.AuthenticationTokenDelegator;
import com.jerry.shiro.component.AccountResourceComponent;
import com.jerry.shiro.component.AccountResourceComponent.ResourceType;
import com.jerry.shiro.utils.ShiroUtil;
import com.jerry.test.common.TestConstants;
import com.jerry.web.common.WebConstants;
import com.jerry.web.common.WebStatusResult;
import com.jerry.web.filter.CaptchaFilter;
import com.jerry.web.servlet.DelegatingServiceServlet;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class TestController extends DelegatingServiceServlet {

  @Autowired(required = false)
  private CacheComponent cacheComponent;
  @Autowired(required = false)
  private AccountResourceComponent accountResource;

  public TestController() {
    super(PlatformType.CONSOLE);
  }

  @Override
  protected OutputModel getFreeMarkerModel(String target) {
    OutputModel model = new OutputModel();
    if ("navMenu".equals(target)) {
      model.put(WebConstants.OUTPUT_ITEMS,
          accountResource.build(PlatformType.CONSOLE, ResourceType.ROLE, false))
      ;
    }
    return model;
  }

  /**
   * 登陆接口
   *
   * @param entity 参数
   * @return 结果
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST,
      headers = {"Content-Type=application/json", "Content-Type=application/xml"}
  )
  public ResponseEntity<?> login(RequestEntity<InputModel> entity) {
    InputModel model = entity.getBody();
    String username = model.get("username", String.class);
    String password = model.get("password", String.class);
    String captcha = model.get("captcha", String.class);
    if (!checkCaptcha(captcha)) {
      return failResponse(new ServiceException(TestConstants.BAD_CAPTCHA));
    }
    AuthenticationTokenDelegator token = new AuthenticationTokenDelegator(
        username, password, request.getRemoteHost(), PlatformType.CONSOLE
    );
    try {
      Subject subject = SecurityUtils.getSubject();
      subject.login(token);
      return okResponse(
          getFirstAccept(),
          WebStatusResult.success()
      );
    } catch (AuthenticationException e) {
      e.printStackTrace();
      return failResponse(ShiroUtil.exception(e));
    }
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public void logout() {
    Subject subject = SecurityUtils.getSubject();
    subject.logout();
    redirect("/");
  }

  @Override
  protected MethodMetadata methodMetadata(String target, String method, InputModel model) {
    return super.methodMetadata(target + "Service", method, model);
  }

  private boolean checkCaptcha(String captcha) {
    if (ObjectUtil.isEmpty(captcha)) {
      return false;
    }
    HttpSession session = request.getSession(false);
    TimerCache cache = cacheComponent.getTimerCache(CaptchaFilter.CAPTCHA_KEY);
    String cacheCaptcha = cache.poll(session.getId(), String.class);
    if (ObjectUtil.isEmpty(cacheCaptcha)) {
      return false;
    }
    return cacheCaptcha.equalsIgnoreCase(captcha);
  }
}
