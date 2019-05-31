package com.my.exception;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-18:29
 */
public class SysExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        SysException e;
        ModelAndView model = new ModelAndView();
        if(ex instanceof SysException){
            e = (SysException)ex;
        }
        else {
            e = new SysException("system busy...");
        }

        model.addObject("errMsg", e.getMessage());
        model.setViewName("error");

        return model;
    }
}
