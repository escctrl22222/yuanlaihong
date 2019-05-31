package com.my.controller.base;

import com.my.util.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.UUID;

/**
 * 类名称：控制类基础类
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-06-19:04
 */
@Controller
public class BaseController {

    /**
     * 取得ModelAndView
     * @return ModelAndView
     */
    public ModelAndView getModelAndView(){
        return new ModelAndView();
    }

    public String getUUID(){
        return UuidUtil.get32UUID();
    }
}
