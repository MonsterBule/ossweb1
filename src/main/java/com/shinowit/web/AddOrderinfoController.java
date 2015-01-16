package com.shinowit.web;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.shinowit.dao.mapper.TbaMembeaddrinfoMapper;
import com.shinowit.dao.mapper.TmeOrderdetailsinfoMapper;
import com.shinowit.dao.mapper.TmeOrderinfoMapper;
import com.shinowit.entity.TmeOrderdetailsinfo;
import com.shinowit.entity.TmeOrderinfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/1/14.
 */

@Controller
@RequestMapping("/orderinfo")
public class AddOrderinfoController {

    @Resource
    private TmeOrderinfoMapper orderdao;

    @Resource
    private TmeOrderdetailsinfoMapper orderdetailsinfodao;

    @Resource
    private TbaMembeaddrinfoMapper addrdao;

    @RequestMapping("/insert")
    public void insert(@RequestParam("data") String data, HttpServletRequest request) {

        TmeOrderinfo tmeOrderinfo = new TmeOrderinfo();
        HttpSession session = request.getSession();

        TmeOrderdetailsinfo orderdetailsinfo = new TmeOrderdetailsinfo();
        List<Map<String, Object>> chartlist = (List<Map<String, Object>>) session.getAttribute("subchart");
        for (Map<String, Object> a : chartlist) {
//            orderdetailsinfo.setMerchandiseid();
//            orderdetailsinfo.setNum();
//            orderdetailsinfo.setUnitid();
//            orderdetailsinfo.setPrice();
//            tmeOrderinfo.setTotalmoney();
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> list = objectMapper.readValue(data, List.class);
            for (Map<String, Object> b : chartlist) {

//                tmeOrderinfo.setUsername(b.get("recman");
//                tmeOrderinfo.setOrdertime(new Date());
//                tmeOrderinfo.set
            }
            System.out.println(list.get(0));
        } catch (Exception e) {
            e.printStackTrace();

        }


    }


    @RequestMapping("/insertandaddress")
    public void insertandaddress(@RequestParam("data") String data, HttpServletRequest request) {

        TmeOrderinfo tmeOrderinfo = new TmeOrderinfo();
        HttpSession session = request.getSession();

        TmeOrderdetailsinfo orderdetailsinfo = new TmeOrderdetailsinfo();
        List<Map<String, Object>> chartlist = (List<Map<String, Object>>) session.getAttribute("subchart");
        for (Map<String, Object> a : chartlist) {
//            orderdetailsinfo.setMerchandiseid();
//            orderdetailsinfo.setNum();
//            orderdetailsinfo.setUnitid();
//            orderdetailsinfo.setPrice();
//            tmeOrderinfo.setTotalmoney();
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> list = objectMapper.readValue(data, List.class);
            for (Map<String, Object> b : chartlist) {

//                tmeOrderinfo.setUsername(b.get("recman");
//                tmeOrderinfo.setOrdertime(new Date());
//                tmeOrderinfo.set
            }
            System.out.println(list.get(0));
        } catch (Exception e) {
            e.printStackTrace();

        }


    }
}
