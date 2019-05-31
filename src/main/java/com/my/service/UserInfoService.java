package com.my.service;

import com.my.domain.UserInfo;

import java.util.List;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-14-15:26
 */
public interface UserInfoService {

    /**
     * 更新用户登录状态
     * @param userInfo
     */
    void updateUserLoginStatus(UserInfo userInfo);

    /**
     * 查询用户详细信息
     * @param userId
     * @return
     */
    UserInfo selectUserInfo(String userId);

    /**
     * 更新用户详细信息
     * @param userInfo
     */
    void updateUserInfo(UserInfo userInfo);
}
