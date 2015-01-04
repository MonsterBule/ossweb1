package com.shinowit.web;

import com.shinowit.dao.mapper.TmeMerchandisecinfoMapper;
import com.shinowit.dao.mapper.TmeMerchandiseinfoMapper;
import com.shinowit.entity.TmeMerchandisecinfoExample;
import com.shinowit.entity.TmeMerchandiseinfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Resource
    private JdbcTemplate jt;

//    @RequestMapping("/list")
//    @ResponseBody
//    public List list(@ModelAttribute TmeMerchandiseinfo tmemerchandise, @RequestParam(value = "name", required = false) String name) {
//        List<TmeMerchandiseinfo> list = new ArrayList<TmeMerchandiseinfo>();
//        TmeMerchandiseinfoExample ex1 = new TmeMerchandiseinfoExample();
//        ex1.setPageIndex(2);
//        ex1.setPageSize(5);
//        if (name != null) {
//            try {
//                byte[] bb = name.getBytes("ISO-8859-1");
//                name = new String(bb, "UTF-8");
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//            TmeMerchandisecinfoExample ex = new TmeMerchandisecinfoExample();
//            ex.createCriteria().andMerchandisecnameEqualTo(name);
//            String s = merchandisecdao.selectByExample(ex).get(0).getMerchandisecid();
//            ex1.createCriteria().andMerchandisecidEqualTo(s);
//            list = merchandisedao.selectByExample(ex1);
//        } else {
//            list = merchandisedao.selectByExample(ex1);
//
//        }
//        return list;
//    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list1(@ModelAttribute TmeMerchandiseinfo tmemerchandise, @RequestParam(value = "name", required = false) String name, Model model, @RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {
        Map<String, Object> result_map = new HashMap<String, Object>();
        if (page == null) {
            page = 1;
        }
        String sql = "SELECT TOP 8 * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id) AS RowNumber,* FROM TMe_MerchandiseInfo) A WHERE RowNumber > ?";
        String sql2 = "select count(*)as totalnum from TMe_MerchandiseInfo where 1=1";
        List<Map<String, Object>> data_list;
        int page_total = 0;
        if (name != null) {
            try {
                byte[] bb = name.getBytes("ISO-8859-1");
                name = new String(bb, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            sql = "SELECT TOP 8 * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id) AS RowNumber,* FROM TMe_MerchandiseInfo where UnitID=?) A WHERE RowNumber > ?";
            sql2 += " and UnitID=?";
            model.addAttribute("totalnum", page_total);
            TmeMerchandisecinfoExample ex = new TmeMerchandisecinfoExample();
            ex.createCriteria().andMerchandisecnameEqualTo(name);
            String merchandisecID = merchandisecdao.selectByExample(ex).get(0).getMerchandisecid();
            data_list = jt.queryForList(sql, new Object[]{merchandisecID, (page - 1) * 8}, new int[]{Types.VARCHAR, Types.INTEGER});
            result_map.put("data_list", data_list);
            page_total = jt.queryForInt(sql2, new Object[]{merchandisecID}, new int[]{Types.INTEGER});
            result_map.put("num", page_total);
            return result_map;
        }
        page_total = jt.queryForInt(sql2);
        data_list = jt.queryForList(sql, new Object[]{(page - 1) * 8}, new int[]{Types.INTEGER});
        result_map.put("data_list", data_list);
        result_map.put("num", page_total);
        return result_map;
    }
    @RequestMapping("/list1")
    public String list2(Model model) {
        String sql2 = "select count(*)as totalnum from TMe_MerchandiseInfo where 1=1";
        int a = jt.queryForInt(sql2);
        model.addAttribute("totalnum", a);
        return "test";
    }


    @RequestMapping("/list3")
    public Model list(@ModelAttribute TmeMerchandiseinfo tmemerchandise, @RequestParam(value = "name", required = false) String name, Model model, @RequestParam(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 0;
        }
        String sql = "SELECT TOP 8 * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id) AS RowNumber,* FROM TMe_MerchandiseInfo) A WHERE RowNumber > ?";
        String sql2 = "select count(*)as totalnum from TMe_MerchandiseInfo where 1=1";
        List<Map<String, Object>> map;
        int a = 0;
        if (name != null) {
            try {
                byte[] bb = name.getBytes("ISO-8859-1");
                name = new String(bb, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            sql += " and UnitID=?";
            sql2 += " and UnitID=?";
            model.addAttribute("totalnum", a);
            TmeMerchandisecinfoExample ex = new TmeMerchandisecinfoExample();
            ex.createCriteria().andMerchandisecnameEqualTo(name);
            String s = merchandisecdao.selectByExample(ex).get(0).getMerchandisecid();
            map = jt.queryForList(sql, new Object[]{page, s}, new int[]{Types.INTEGER, Types.VARCHAR});

            a = jt.queryForInt(sql2, new Object[]{s}, new int[]{Types.INTEGER});

            model.addAttribute("list", map);
            model.addAttribute("num", a);
            return model;
        }
        a = jt.queryForInt(sql2);
        model.addAttribute("totalnum", a);
        map = jt.queryForList(sql, new Object[]{1}, new int[]{Types.INTEGER});

        model.addAttribute("list", map);
        model.addAttribute("num", a);
        return model;
    }
}
