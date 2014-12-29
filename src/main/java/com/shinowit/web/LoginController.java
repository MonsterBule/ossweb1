package com.shinowit.web;

import com.shinowit.dao.mapper.TbaMemberinfoMapper;
import com.shinowit.entity.TbaMemberinfo;
import com.shinowit.entity.TbaMemberinfoExample;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2014/12/25.
 */
@Controller
@RequestMapping("login")
public class LoginController {
    @Resource
    private TbaMemberinfoMapper tbadao;

    @RequestMapping("login")
    public String login(@ModelAttribute("user") TbaMemberinfo user, HttpServletRequest request) {
        HttpSession session = request.getSession();

        TbaMemberinfoExample ex = new TbaMemberinfoExample();
        ex.createCriteria().andUsernameEqualTo(user.getUsername());
        ex.createCriteria().andPwdEqualTo(user.getPwd());
        if ((user.getUsername() != null) && (user.getUsername().trim().length() > 0) && ((user.getPwd() != null) && (user.getPwd().trim().length() > 0))) {
            if (tbadao.selectByExample(ex).size() > 0) {
                return "redirect:/list/list";
            }
        }
        return "";
    }
}
