package com.my.service.impl;

import com.my.dao.Dao;
import com.my.domain.UserInfo;
import com.my.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-14-15:28
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private Dao dao;

    /**
     * 更新用户登录状态
     * @param userInfo
     */
    @Override
    public void updateUserLoginStatus(UserInfo userInfo) {
        dao.update("UserInfoMapper.updateUserLoginStatus", userInfo);
    }

    /**
     * 查询用户详细信息
     * @param userId
     * @return
     */
    @Override
    public UserInfo selectUserInfo(String userId) {
       return (UserInfo)dao.selectForObject("UserInfoMapper.selectUserInfo", userId);
    }

    /**
     * 更新用户详细信息
     * @param userInfo
     */
    @Override
    public void updateUserInfo(UserInfo userInfo) {
        dao.update("UserInfoMapper.updateUserInfo", userInfo);
    }


}
