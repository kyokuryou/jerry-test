package com.jerry.test.example;

import com.jerry.context.common.Pagination;
import com.jerry.context.jdbc.JdbcBeanRepository;
import com.jerry.context.jdbc.sql.JdbcSQL;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class ExampleRepository extends JdbcBeanRepository<ExampleEntity> {

  public Pagination queryForPagination(Pagination pager) {
    JdbcSQL sql = new JdbcSQL();
    sql.SELECT(ExampleEntity.class);
    return super.queryForPagination(pager, sql);
  }

  public List<ExampleEntity> queryAll() {
    JdbcSQL sql = new JdbcSQL();
    sql.SELECT(ExampleEntity.class);
    return super.queryForList(sql);
  }
}
