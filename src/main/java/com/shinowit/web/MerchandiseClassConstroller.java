package com.shinowit.web;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2014/12/25.
 */

@Controller
@RequestMapping("mercahndiseclass")
public class MerchandiseClassConstroller {

    @Resource
    private JdbcTemplate jt;

    @RequestMapping("list")
    public String list(Model model) {
        List<Map<String, Object>> list = jt.queryForList("select top(5)* from TMe_MerchandiseCInfo ");
        model.addAttribute("merchandiseclss", list);
        return "index";
    }
}
