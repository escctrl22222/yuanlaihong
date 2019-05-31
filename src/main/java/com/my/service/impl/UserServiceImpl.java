package com.my.service.impl;

import com.my.dao.Dao;
import com.my.domain.User;
import com.my.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-19:30
 */
@Service
public class UserServiceImpl implements UserService {

    // 用户Dao
    @Autowired
    private Dao dao;

    @Override
    public void insertUser(User user) {
        dao.insert("UserMapper.insertUser", user);
    }

    @Override
    public void deleteUser(String userName) {
        dao.delete("UserMapper.deleteUser", userName);
    }

    @Override
    public void updatePassword(User user) {
        dao.update("UserMapper.updatePassword", user);
    }

    /**
     * 查找用户
     * @param user
     * @return
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<User> selectUser(User user) {
        return (List<User>)dao.selectForList("UserMapper.selectUser", user);
    }

    /**
     * 验证密码
     * @param user
     * @return
     */
    @Override
    public User selectUserPassword(User user) {
        return (User) dao.selectForObject("UserMapper.selectUserPassword", user);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> selectEmail(User user) {
        return (List<User>)dao.selectForList("UserMapper.selectEmail", user);
    }
}
