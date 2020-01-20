package com.jerry;

import com.jerry.web.autoconfigure.WebImportSelector;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;

@SpringBootApplication(scanBasePackages = "com.jerry.test")
@Import(WebImportSelector.class)
public class TestWebApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(TestWebApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    return builder.sources(TestWebApplication.class);
  }
}
