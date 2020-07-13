package com.jerry.test.autoconfigure;

import com.jerry.web.common.WebStatusResult;
import com.jerry.web.common.WebTemplateResult;

public class WebSmsTemplateResult extends WebTemplateResult {

  public WebSmsTemplateResult() {
    super("/test");
  }

  @Override
  public Object getBody() {
    String html = render();
    return WebStatusResult.success();
  }
}
