package com.my.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.my.controller.base.BaseController;
import com.my.domain.User;
import com.my.domain.UserInfo;
import com.my.exception.SysException;
import com.my.service.UserInfoService;
import com.my.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.soap.SOAPBinding;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-19:54
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    // 用户Service
    @Autowired
    private UserService userService;

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("/insert")
    @ResponseBody
    public Map<String, String> registCheck(User user) throws SysException {
        Map<String, String> map = new HashMap<>();
        try {
            List<User> list = userService.selectEmail(user);
            if (!list.isEmpty()){
                map.put("result", "emailError");
            }
            else{
                list = userService.selectUser(user);
                if (!list.isEmpty()){
                    map.put("result", "userError");
                }
                else {
                    user.setRegDate(SimpleDateFormat.getDateInstance().format(new Date()));
                    user.setDelDate("");
                    user.setDelFlg("0");
                    userService.insertUser(user);
                    map.put("result", "success");
                }
            }

        } catch (Exception e) {
            throw new SysException("regist faild");
        }

        return map;
    }

    @RequestMapping("/regist")
    public ModelAndView registeUser(User user) {
        ModelAndView model = getModelAndView();

        model.setViewName("user/regist");

        return model;
    }

    @RequestMapping("/success")
    public ModelAndView success() {
        ModelAndView model = getModelAndView();

        model.setViewName("user/success");

        return model;
    }

    @RequestMapping("/loginSurface")
    public ModelAndView loginSurface() {
        ModelAndView model = getModelAndView();

        model.setViewName("user/login");

        return model;
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, String> loginUser(User user) {
        Map<String, String> map = new HashMap<String, String>();
        String resInfo = "";
        String userId = "";

        List<User> users =  userService.selectUser(user);
        if (users.isEmpty()) {
            resInfo = "userError";
        }
        else {
            User userLogin = userService.selectUserPassword(user);
            if (userLogin.getPassword().equals(user.getPassword())) {
                resInfo = "success";
                userId = userLogin.getUserId();
                UserInfo userInfo = new UserInfo();
                userInfo.setUserId(userLogin.getUserId());
                userInfo.setLoginStatus("1");
                userInfoService.updateUserLoginStatus(userInfo);
            }
            else {
                resInfo = "userError";
            }
        }
        map.put("userId", userId);
        map.put("result", resInfo);
        return map;
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public Map<String, String> userStatus(UserInfo userInfo) {
        Map<String, String> map = new HashMap<String, String>();

        userInfoService.updateUserLoginStatus(userInfo);

        map.put("userId", userInfo.getUserId());
        map.put("loginStatus", userInfo.getLoginStatus());
        return map;
    }

    @RequestMapping("/findInfo")
    @ResponseBody
    public Map<String, Object> findUserInfo(UserInfo userInfo) {
        Map<String, Object> map = new HashMap<>();

        UserInfo info = userInfoService.selectUserInfo(userInfo.getUserId());

        map.put("userInfo", info);
        return map;
    }

    @RequestMapping("/info")
    public ModelAndView userInfo(String userId) {
        ModelAndView model = getModelAndView();

        model.addObject("userId", userId);
        model.setViewName("user/info");

        return model;
    }

    @RequestMapping("/updateInfo")
    public ModelAndView updateInfo(String userId) {
        ModelAndView model = getModelAndView();

        model.addObject("userId", userId);
        model.setViewName("user/updateInfo");

        return model;
    }

    @RequestMapping("/submitUserInfo")
    @ResponseBody
    public Map<String, Object> submitUserInfo(UserInfo userInfo) {
        Map<String, Object> map = new HashMap<>();

        userInfoService.updateUserInfo(userInfo);

        return map;
    }
}
