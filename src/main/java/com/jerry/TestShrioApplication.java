package com.jerry;

import com.jerry.shiro.autoconfigure.ShiroImportSelector;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;

@SpringBootApplication(scanBasePackages = "com.jerry.test")
@Import(ShiroImportSelector.class)
public class TestShrioApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(TestShrioApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    return builder.sources(TestShrioApplication.class);
  }
}
