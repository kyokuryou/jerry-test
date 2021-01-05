package com.jerry.test.service.example;

import com.jerry.context.common.InputModel;
import com.jerry.context.common.PlatformType;
import com.jerry.context.service.finder.FinderService;
import com.jerry.web.common.WebResult;
import com.jerry.web.common.WebStatusResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestFinderService {

  @Autowired(required = false)
  private FinderService finderService;

  public WebResult modify(PlatformType platform, InputModel input) {
    String uuid = input.get("uuid", String.class);

    finderService.saveTemp(uuid,"testGroup");
    return WebStatusResult.success();
  }
}
