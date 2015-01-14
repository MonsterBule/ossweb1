package com.shinowit.web;

import com.shinowit.dao.mapper.TmeMerchandiseinfoMapper;
import com.shinowit.dao.mapper.TmeProstatusinfoMapper;
import com.shinowit.dao.mapper.TmeStockinfoMapper;
import com.shinowit.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by Administrator on 2014/12/31.
 */
@Controller
@RequestMapping("merchendise")
public class MerchandiseInfoController {

    @Resource
    private TmeMerchandiseinfoMapper merchandisedao;

    @Resource
    private TmeStockinfoMapper stockdao;

    @Resource
    private TmeProstatusinfoMapper prostatusdao;


    @RequestMapping("info")
    public String info(Model model, @RequestParam("merchandiseName") String name) {
        TmeMerchandiseinfoExample chandiseex = new TmeMerchandiseinfoExample();
        TmeMerchandiseinfo merchan = new TmeMerchandiseinfo();
        try {
            byte[] bb = name.getBytes("ISO-8859-1");
            name = new String(bb, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        TmeProstatusinfoExample statusex = new TmeProstatusinfoExample();
        TmeStockinfoExample stockex = new TmeStockinfoExample();
        chandiseex.createCriteria().andMerchandisenameEqualTo(name);
        merchan = merchandisedao.selectByExample(chandiseex).get(0);
        model.addAttribute("merchandis", merchan);
        String merchandisid = merchan.getMerchandiseid();
        int prostatusid = merchan.getProstatusid();
        statusex.createCriteria().andProstatusidEqualTo(prostatusid);
        stockex.createCriteria().andMerchandiseidEqualTo(merchandisid);
        List<TmeStockinfo> stockinfo = stockdao.selectByExample(stockex);
        if (stockinfo.size() == 0) {

            String status = prostatusdao.selectByExample(statusex).get(0).getProstatusname();
            model.addAttribute("num", "该商品已售完");
            model.addAttribute("status", status);
            return "inner-page";
        }
        int num = stockinfo.get(0).getNum();
        String status = prostatusdao.selectByExample(statusex).get(0).getProstatusname();
        model.addAttribute("num", num);
        model.addAttribute("status", status);
        return "inner-page";
    }
}
