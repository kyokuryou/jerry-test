package com.jerry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = "com.jerry.test")
public class TestWebApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication app = new SpringApplication(TestWebApplication.class);
    app.setWebApplicationType(WebApplicationType.SERVLET);
    app.run(args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    return builder.sources(TestWebApplication.class);
  }
}
