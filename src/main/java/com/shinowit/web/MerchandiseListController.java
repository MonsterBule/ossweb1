package com.shinowit.web;

import com.shinowit.dao.mapper.TmeMerchandisecinfoMapper;
import com.shinowit.dao.mapper.TmeMerchandiseinfoMapper;
import com.shinowit.entity.TmeMerchandisecinfoExample;
import com.shinowit.entity.TmeMerchandiseinfo;
import com.shinowit.entity.TmeMerchandiseinfoExample;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2014/12/24.
 */

@Controller
@RequestMapping("list")
public class MerchandiseListController {

    @Resource
    private TmeMerchandisecinfoMapper merchandisecdao;
    @Resource
    private TmeMerchandiseinfoMapper merchandisedao;

    @RequestMapping("/list")

    @ResponseBody
    public List list(@ModelAttribute TmeMerchandiseinfo tmemerchandise, @RequestParam(value = "name", required = false) String name) {

        List<TmeMerchandiseinfo> list = new ArrayList<TmeMerchandiseinfo>();
        TmeMerchandiseinfoExample ex1 = new TmeMerchandiseinfoExample();
        if (name != null) {

            try {
                byte[] bb = name.getBytes("ISO-8859-1");
                name = new String(bb, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            TmeMerchandisecinfoExample ex = new TmeMerchandisecinfoExample();
            ex.createCriteria().andMerchandisecnameEqualTo(name);
            String s = merchandisecdao.selectByExample(ex).get(0).getMerchandisecid();
            ex1.createCriteria().andMerchandisecidEqualTo(s);
            list = merchandisedao.selectByExample(ex1);
        } else {
            list = merchandisedao.selectByExample(ex1);
        }
//        model.addAttribute("merchandise_list", list);
        return list;
    }
}
