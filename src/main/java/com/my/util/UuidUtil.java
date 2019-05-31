package com.my.util;

import java.util.UUID;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-06-19:09
 */
public class UuidUtil {

    /**
     * 得到32位的UUID
     * @return 32位UUID
     */
    public static String get32UUID(){
        return UUID.randomUUID().toString().trim().replace("-", "");
    }
}
