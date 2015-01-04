package com.shinowit.web;

import com.shinowit.dao.mapper.TbaMemberinfoMapper;
import com.shinowit.entity.TbaMemberinfoExample;
import com.shinowit.framework.Email.Email;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2014/12/31.
 */

@Controller
@RequestMapping("getpwd")
public class GetPwdController {
    @Resource
    private Email sendMail;
    @Resource
    private TbaMemberinfoMapper memberdao;


    @RequestMapping("sendmail")
    public String sendMail(@RequestParam("") String mail, Model model) {

        TbaMemberinfoExample ex = new TbaMemberinfoExample();

        try {
            sendMail.sendMail("重置密码", "重置成功新密码为 'GXX123456'切记", mail);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "";
    }
}
