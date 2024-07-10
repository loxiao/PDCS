package com.example.pdcs.dao;

import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class ParticipantDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
}
