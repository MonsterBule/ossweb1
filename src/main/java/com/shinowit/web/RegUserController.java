package com.shinowit.web;

import com.shinowit.dao.mapper.TbaMemberinfoMapper;
import com.shinowit.entity.TbaMemberinfo;
import com.shinowit.entity.TbaMemberinfoExample;
import com.shinowit.framework.Email.SendHtmlMail;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2014/12/25.
 */
@Controller
@RequestMapping("/reg")
public class RegUserController {

    @Resource
    private TbaMemberinfoMapper tbadao;
    @Resource
    private SendHtmlMail sendHtmlMail;


    @RequestMapping(value = "/reg", method = RequestMethod.GET)
    public String reg1(@ModelAttribute("user") TbaMemberinfo user) {

        return "reg";
    }

    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    public String reg(@Valid @ModelAttribute("user") TbaMemberinfo user, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {
        if (bindingResult.hasErrors()) {
            return "reg";
        }

        String uuid = UUID.randomUUID().toString();
        HttpSession session = request.getSession(true);

        user.setRemark(uuid);
        user.setRegdate(new Date());
        user.setStatus(false);
        String str = "http://localhost:8080/reg/values?username=" + user.getUsername() + "$id=" + uuid;
        TbaMemberinfoExample example = new TbaMemberinfoExample();
        example.createCriteria().andUsernameEqualTo(user.getUsername());
        try {

            sendHtmlMail.sendMessage(user.getEmail(), "用户激活", str);
            return "wer";
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
//        if (tbadao.selectByExample(example).size() > 0) {
//            session.setAttribute("error", "该用户名称已被使用");
//            return "reg";
//        }
//        try {
//            tbadao.insert(user);
//            session.setAttribute("reg_mag", "注册成功，激活后才能登陆");
//            sendHtmlMail.sendMessage(user.getEmail(), "用户激活", str);
//            response.sendRedirect(request.getContextPath() + "list/list");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        ;
//        session.setAttribute("reg_mag", "注册失败，请检查");
        return "reg";
    }

    @RequestMapping("values")
    public void values() {

    }
}
