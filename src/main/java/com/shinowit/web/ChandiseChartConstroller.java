package com.shinowit.web;

import com.shinowit.dao.mapper.TmeMerchandiseinfoMapper;
import com.shinowit.entity.TmeMerchandiseinfo;
import com.shinowit.entity.TmeMerchandiseinfoExample;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/1/6.
 */

@Controller
@RequestMapping("chart")
public class ChandiseChartConstroller {


    @Resource
    private TmeMerchandiseinfoMapper chandisedao;

    @RequestMapping("insert")
    public void insert(HttpServletRequest request, HttpServletResponse response) {

        Map<String, Integer> chart = new HashMap<String, Integer>();
        Map<String, Integer> chart1 = new HashMap<String, Integer>();
        String name = request.getParameter("name");
        int num = new Integer(request.getParameter("num"));
        HttpSession session = request.getSession();
        chart1 = (Map) session.getAttribute("chart");
        if (chart1 == null) {
            chart.put(name, num);
            session.setAttribute("chart", chart);
        } else {
            if (chart1.get(name) == null) {
                chart1.put(name, num);
            } else {

                chart1.put(name, chart1.get(name) + num);
            }
//            for (String key : chart1.keySet()) {
//                if (key.equals(name)) {
//                    int a = chart1.get(key) + num;
//                    chart1.put(name, a);
//                    break;//停止for循环
//                } else {
//                    chart1.put(name, num);
//                    break;//防止加入的变量与原来的长度不匹配
//                }
//                chart1.put(name, num);
//            }

            //        (chart1.get(name))==null ? chart1.put(name, num):chart1.put(name, chart1.get(name) + num);
            session.setAttribute("chart", chart1);
        }
//        try {
//            response.getWriter().print("添加成功");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    @RequestMapping("list")
    public String list(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        Map<String, Integer> map = (Map) session.getAttribute("chart");
        List<TmeMerchandiseinfo> chandiselist = new ArrayList<TmeMerchandiseinfo>();
        if (map == null) {
            map = new HashMap<String, Integer>();
            model.addAttribute("start", "isnull");
        } else {
            for (String name : map.keySet()) {
                TmeMerchandiseinfo chandise = null;
                TmeMerchandiseinfoExample ex = new TmeMerchandiseinfoExample();
                ex.createCriteria().andMerchandisenameEqualTo(name);
                chandise = chandisedao.selectByExample(ex).get(0);
                int money = (chandise.getPrice().intValue()) * map.get(name);
                //状态id 存数量
                chandise.setProstatusid(map.get(name));
                //unitid 存money
                chandise.setUnitid(money);
                chandiselist.add(chandise);
            }
            model.addAttribute("chart_info", chandiselist);
        }
        return "chart";
    }
}
