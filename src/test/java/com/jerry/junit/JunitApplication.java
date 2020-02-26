package com.jerry.junit;

import com.jerry.context.common.BaseEntity;
import com.jerry.context.common.Pagination;
import com.jerry.context.utils.JacksonUtil;
import com.jerry.junit.autoconfigure.JunitImportSelector;
import com.jerry.junit.service.ExampleEntity;
import com.jerry.junit.service.ExampleMapper;
import com.jerry.junit.service.ExampleRepository;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = JunitApplication.class, properties = "spring.profiles.active=dev ")

@SpringBootApplication(scanBasePackages = "com.jerry.junit")
@MapperScan(basePackages = "com.jerry.junit", annotationClass = Mapper.class)
@Import(JunitImportSelector.class)
public class JunitApplication extends SpringBootServletInitializer {

  @Autowired
  private ExampleMapper exampleMapper;
  @Autowired
  private ExampleRepository exampleRepository;

  @Test
  public void mybatisCount() {
    exampleMapper.countExample(1);
  }

  @Test
  public void mybatisQuery() {
    long mybatisStart = System.currentTimeMillis();
    List<ExampleEntity> list1 = exampleMapper.queryAll();
    System.out.println(System.currentTimeMillis() - mybatisStart);

    long jdbcStart = System.currentTimeMillis();
    List<ExampleEntity> list2 = exampleRepository.queryAll();
    System.out.println(System.currentTimeMillis() - jdbcStart);

//    ExampleEntity entity = exampleMapper.queryOne(3L);
//    System.out.println(entity);
  }

  @Test
  public void mybatisPagination() {
    Pagination pagination = new Pagination();
    pagination.setPageNumber(1);
    pagination.setPageSize(5);
    pagination.addParams("username", "张三");
    Pagination p = exampleMapper.queryForPagination(null);
    System.out.println(JacksonUtil.encodeJson(p));
  }

  @Test
  public void mybatisUpdate() {
    ExampleEntity entity = new ExampleEntity();
    entity.setUsername("张三");
    entity.setPassword("123456");
    entity.setAddress("大连市");
    entity.setMemo("11111111");

    ExampleEntity entity1 = new ExampleEntity();
    entity1.setId(4L);
    entity1.setUsername("张三222");
    entity1.setPassword("123456789");
    entity1.setAddress("大连市");
    entity1.setMemo("11111111");
    entity1.setEnabled(true);
//    exampleMapper.insertExample(entity);
    exampleMapper.updateExample(entity1);
//    exampleMapper.updateExampleNoParams();
    long result = exampleMapper.insertExampleEmpty(entity);
    System.out.println(entity.getId());
  }


  public static void main(String[] args) {
    SpringApplication.run(JunitApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    return builder.sources(JunitApplication.class);
  }

}
