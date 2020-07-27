package com.jerry.test.controller;

import com.jerry.context.common.InputModel;
import com.jerry.context.common.PlatformType;
import com.jerry.shiro.servlet.ShiroDelegatingServiceServlet;
import javax.servlet.ServletException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class TestController extends ShiroDelegatingServiceServlet {

  public TestController() {
    super(PlatformType.CONSOLE);
  }

  @Override
  protected MethodMetadata methodMetadata(String target, String method, InputModel model) {
    return super.methodMetadata(target + "Service", method, model);
  }

  @Override
  public ModelAndView login() throws ServletException {
    return modelResolver.getIndexView("main");
  }
}
