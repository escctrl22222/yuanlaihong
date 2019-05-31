import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-07-9:38
 */
public class Demo1 {

    @Test
    public void test1(){
        String dong = "123";
        String xiao = "234";
        double num = 3.44;
        String han = String.valueOf(num);
        System.out.println(han);
        List<String> list = new ArrayList<>();
        Boolean bFalse = new Boolean(Boolean.FALSE);
        Boolean bTrue =new Boolean(Boolean.TRUE);
        String sTrue = "true";
        //Class
        System.out.println(bTrue.booleanValue());
        System.out.println(Boolean.getBoolean("bFalse"));
        System.out.println(Boolean.getBoolean("bTrue"));
        System.out.println(Boolean.getBoolean(sTrue));

    }
}
