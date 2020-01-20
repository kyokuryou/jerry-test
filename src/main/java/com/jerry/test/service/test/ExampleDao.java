package com.jerry.test.service.test;

import com.jerry.context.common.Pagination;
import com.jerry.context.jdbc.JdbcBeanRepository;
import com.jerry.context.jdbc.sql.JdbcSQL;
import org.springframework.stereotype.Repository;

@Repository
public class ExampleDao extends JdbcBeanRepository<ExampleEntity> {

  public Pagination queryForPagination(Pagination pager) {
    JdbcSQL sql = new JdbcSQL();
    sql.SELECT(ExampleEntity.class);
    return super.queryForPagination(pager, sql);
  }
}
