package com.shinowit.web;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.shinowit.dao.mapper.ProvinceMapper;
import com.shinowit.dao.mapper.TbaMembeaddrinfoMapper;
import com.shinowit.entity.Province;
import com.shinowit.entity.TbaMembeaddrinfo;
import com.shinowit.entity.TbaMembeaddrinfoExample;
import com.shinowit.entity.TbaMemberinfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/1/13.
 */
@Controller
@RequestMapping("/submitchart")
public class SubmitChartController {


    @Resource
    private TbaMembeaddrinfoMapper addrinfodao;

    @Resource
    private ProvinceMapper provincedao;


    @RequestMapping("/insertSession")
    public String submit(@RequestParam("data") String data, HttpServletRequest request) {
        HttpSession session = request.getSession();
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<Object, Object>> list = objectMapper.readValue(data, List.class);
//            List<LinkedHashMap<String, Object>> list = objectMapper.readValue(
//                    data, List.class);
            session.setAttribute("subchart", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "chart01";

    }

    @RequestMapping("/location")
    public String location(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        TbaMembeaddrinfoExample ex = new TbaMembeaddrinfoExample();
        session.setAttribute("user", "user");
        //TbaMemberinfo user1 = (TbaMemberinfo) session.getAttribute("user");
        TbaMemberinfo user = new TbaMemberinfo();
        user.setUsername("user1");
        String a = request.getRealPath("/");
        System.out.println(a);
//        ex.createCriteria().andUsernameEqualTo(user.getUsername());
        List<TbaMembeaddrinfo> list = addrinfodao.selectByUsernmaeASC(user.getUsername());
        model.addAttribute("chartinfolist", list);
        List<Province> provinceslist = provincedao.selectall();
        model.addAttribute("province", provinceslist);

        return "chart01";
    }

}
