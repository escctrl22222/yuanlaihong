package com.my.controller.system;

import com.my.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * 类名称：主页控制类
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-06-19:33
 */
@Controller
public class MainpageController extends BaseController {

    @RequestMapping("/mainpage")
    @ResponseBody
    public ModelAndView mainpageLogin(@RequestParam Map<String, Object> map){
        ModelAndView model = getModelAndView();
        String userStatus = (String)map.get("userStatus");
        String userId = (String)map.get("userId");

        // 用户登录状态判断
        // TODO 根据用户状态选择隐身，在线等
        if(null == userStatus || "".equals(userStatus)) {
            model.addObject("userStatus", "offline");
        }
        else if("online".equals(userStatus)){
            model.addObject("userStatus", "online");
        }
        else {

        }
        model.addObject("userId", userId);

        model.setViewName("mainpage");
        return model;
    }
}
