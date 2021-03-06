package com.jerry.test.controller;

import com.jerry.context.common.InputModel;
import com.jerry.context.common.OutputModel;
import com.jerry.context.common.PlatformType;
import com.jerry.shiro.component.AccountResourceComponent;
import com.jerry.shiro.component.AccountResourceComponent.ResourceType;
import com.jerry.shiro.servlet.ShiroDelegatingServiceServlet;
import com.jerry.web.common.WebConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TestController extends ShiroDelegatingServiceServlet {

  @Autowired(required = false)
  private AccountResourceComponent accountResource;

  public TestController() {
    super(PlatformType.CONSOLE);
  }

  @Override
  protected OutputModel getTemplateModel(String viewName) {
    OutputModel output = super.getTemplateModel(viewName);
    if ("/component/navMenu".equals(viewName)) {
      output.put(WebConstants.OUTPUT_ITEMS,
          accountResource.build(PlatformType.CONSOLE, ResourceType.ROLE, false)
      );
    }
    return output;
  }

  @Override
  protected MethodMetadata methodMetadata(String target, String method, InputModel model) {
    return super.methodMetadata(target + "Service", method, model);
  }
}
