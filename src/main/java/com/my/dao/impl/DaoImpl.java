package com.my.dao.impl;

import com.my.dao.Dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-19:32
 */
@Repository
public class DaoImpl implements Dao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insert(String sql, Object obj) {
        sqlSessionTemplate.insert(sql, obj);
    }

    @Override
    public void delete(String sql, Object obj) {
        sqlSessionTemplate.delete(sql, obj);
    }

    @Override
    public void update(String sql, Object obj) {
        sqlSessionTemplate.update(sql, obj);
    }

    @Override
    public Object selectForList(String sql, Object obj) {
        return sqlSessionTemplate.selectList(sql, obj);
    }

    @Override
    public Object selectForObject(String sql, Object obj) {
        return sqlSessionTemplate.selectOne(sql, obj);
    }

}
