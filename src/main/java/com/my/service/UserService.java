package com.my.service;

import com.my.domain.User;

import java.util.List;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-19:19
 */
public interface UserService {
    void insertUser(User user);

    void deleteUser(String userName);

    void updatePassword(User user);

    /**
     * 查找用户
     * @param user
     * @return 用户List
     */
    List<User> selectUser(User user);

    /**
     *  验证密码
     * @param user
     * @return
     */
    User selectUserPassword(User user);

    /**
     * 根据邮箱查找用户
     * @param user
     * @return 用户List
     */
    List<User> selectEmail(User user);
}
