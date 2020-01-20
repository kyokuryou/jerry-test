package com.jerry;

import com.jerry.context.autoconfigure.ContextImportSelector;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@SpringBootApplication(scanBasePackages = "com.jerry.test")
@ComponentScan(excludeFilters = {
    @Filter(type = FilterType.ANNOTATION, value = {
        Controller.class, Component.class}
    )
})
@Import(ContextImportSelector.class)
public class TestContextApplication {

  public static void main(String[] args) {
    SpringApplication application = new SpringApplication(TestContextApplication.class);
    application.setWebEnvironment(false);
    application.run(args);
  }
}
