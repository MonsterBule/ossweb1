package com.shinowit.web;

import com.shinowit.dao.mapper.TmeMerchandiseinfoMapper;
import com.shinowit.dao.mapper.TmeProstatusinfoMapper;
import com.shinowit.dao.mapper.TmeStockinfoMapper;
import com.shinowit.entity.TmeMerchandiseinfo;
import com.shinowit.entity.TmeMerchandiseinfoExample;
import com.shinowit.entity.TmeProstatusinfoExample;
import com.shinowit.entity.TmeStockinfoExample;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

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
    public String info(@ModelAttribute("chandise") TmeMerchandiseinfo merchan, Model model, @RequestParam("merchandiseName") String name) {

        TmeMerchandiseinfoExample chandiseex = new TmeMerchandiseinfoExample();
        TmeProstatusinfoExample statusex = new TmeProstatusinfoExample();
        TmeStockinfoExample stockex = new TmeStockinfoExample();
        chandiseex.createCriteria().andMerchandisenameEqualTo(name);
        merchan = merchandisedao.selectByExample(chandiseex).get(0);
        model.addAttribute("merchandis", merchan);
        String merchandisid = merchan.getMerchandisecid();
        int prostatusid = merchan.getProstatusid();
        statusex.createCriteria().andProstatusidEqualTo(prostatusid);
        stockex.createCriteria().andMerchandiseidEqualTo(merchandisid);
        int num = stockdao.selectByExample(stockex).get(0).getNum();
        String status = prostatusdao.selectByExample(statusex).get(0).getProstatusname();
        model.addAttribute("mun", num);
        model.addAttribute("status", status);
        return "inner-page";
    }
}
