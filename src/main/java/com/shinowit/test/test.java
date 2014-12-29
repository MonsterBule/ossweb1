package com.shinowit.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2014/12/25.
 */
public class test {

    public static void main(String[] aa) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = simpleDateFormat.format(new Date());
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = format.parse(s);
            System.out.println(date);
            System.out.println(new Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
