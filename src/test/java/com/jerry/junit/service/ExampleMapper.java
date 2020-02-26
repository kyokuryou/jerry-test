package com.jerry.junit.service;

import com.jerry.context.common.BaseEntity;
import com.jerry.context.common.Pagination;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExampleMapper {

  Pagination queryForPagination(Pagination pagination);

  ExampleEntity queryOne(long id);
  List<ExampleEntity> queryAll();

  int countExample(long userId);

  long insertExample(ExampleEntity entity);

  long insertExampleEmpty(ExampleEntity entity);

  int updateExample(ExampleEntity entity);

  int updateExampleNoParams();

}
