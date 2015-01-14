package com.shinowit.web;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2014/12/25.
 */

@Controller
@RequestMapping("mercahndiseclass")
public class MerchandiseClassController {

    @Resource
    private JdbcTemplate jt;

    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "name", required = false) String name) {
        List<Map<String, Object>> list = jt.queryForList("select top(5)* from TMe_MerchandiseCInfo ");
        if (name != null) {
            try {
                byte[] bb = name.getBytes("ISO-8859-1");
                name = new String(bb, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        } else {
            name = "null";
        }
        model.addAttribute("merchandiseclss", list);

        model.addAttribute("chandisename", name);
        return "index";
    }


    @RequestMapping("list2")
    @ResponseBody
    public List<Map<String, Object>> list2(Model model) {
        List<Map<String, Object>> list = jt.queryForList("select top(5)* from TMe_MerchandiseCInfo ");
        model.addAttribute("merchandiseclss", list);
        return list;
    }
}
