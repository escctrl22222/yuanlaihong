package com.my.exception;

/**
 * @author Dong xiaohanlin
 * @create 2019-05-05-18:25
 */
public class SysException extends Exception{
    private String message;

    public SysException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
