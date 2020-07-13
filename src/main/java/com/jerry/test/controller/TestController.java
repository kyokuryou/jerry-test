package com.jerry.test.controller;

import com.jerry.context.common.InputModel;
import com.jerry.context.common.PlatformType;
import com.jerry.shiro.servlet.ShiroDelegatingServiceServlet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
