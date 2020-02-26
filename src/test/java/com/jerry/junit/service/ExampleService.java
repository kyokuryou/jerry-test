package com.jerry.junit.service;

import com.jerry.context.common.Constants;
import com.jerry.context.common.InputModel;
import com.jerry.context.common.Pagination;
import com.jerry.context.exception.ServiceException;
import com.jerry.context.utils.DateUtil;
import com.jerry.context.utils.ObjectUtil;
import com.jerry.web.annotation.SupportedRequest;
import com.jerry.web.common.WebConstants;
import com.jerry.web.common.WebModelResult;
import com.jerry.web.common.WebResult;
import com.jerry.web.common.WebStatusResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

@Service
public class ExampleService {

  @Autowired
  private ExampleRepository exampleRepository;

  @SupportedRequest(contentTypes = {MediaType.APPLICATION_XML_VALUE})
  public WebResult list(InputModel model) {
    Pagination pager = model.get(Pagination.class, new Pagination());
    try {
      return WebModelResult.of(exampleRepository.queryForPagination(pager));
    } catch (NullPointerException e) {
      throw new ServiceException(2001);
    }
  }

  public WebResult delete(InputModel model) {
    Long id = model.get(WebConstants.INPUT_ID, Long.class);
    exampleRepository.delete(id);
    return WebStatusResult.success();
  }

  public WebResult detail(InputModel model) {
    Long id = model.get(WebConstants.INPUT_ID, Long.class);
    return WebModelResult.of(exampleRepository.queryForBean(id));
  }

  public WebResult update(InputModel model) {
    ExampleEntity entity = model.get(ExampleEntity.class);
    if (ObjectUtil.isEmpty(entity.getId())) {
      return WebStatusResult.of(Constants.DATA_NOT_FOUND);
    }
    entity.setModifyTime(DateUtil.getNow());
    exampleRepository.saveOrUpdate(entity);
    return WebStatusResult.success();
  }

  public WebResult insert(InputModel model) {
    ExampleEntity entity = model.get(ExampleEntity.class);
    entity.setCreateTime(DateUtil.getNow());
    exampleRepository.saveOrUpdate(entity);
    return WebStatusResult.success();
  }
}
