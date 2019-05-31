package com.my.dao;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-19:31
 */
public interface Dao {
    void insert(String sql, Object obj);

    void delete(String sql, Object obj);

    void update(String sql, Object obj);

    Object selectForList(String sql, Object obj);

    Object selectForObject(String sql, Object obj);
}
