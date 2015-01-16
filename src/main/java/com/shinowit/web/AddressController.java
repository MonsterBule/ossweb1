package com.shinowit.web;

import com.shinowit.dao.mapper.CityMapper;
import com.shinowit.dao.mapper.DistrictMapper;
import com.shinowit.entity.City;
import com.shinowit.entity.CityExample;
import com.shinowit.entity.District;
import com.shinowit.entity.DistrictExample;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/1/7.
 */

@Controller
@RequestMapping("/adderss")
public class AddressController {

    @Resource
    private CityMapper citydao;
    @Resource
    private DistrictMapper districtdao;

    @RequestMapping("/city")
    @ResponseBody
    public List city(@RequestParam("id") String id) {
        CityExample ex = new CityExample();
        ex.createCriteria().andProvinceidEqualTo(id);
        List<City> cityList = citydao.selectByExample(ex);
        return cityList;
    }

    @RequestMapping("/district")
    @ResponseBody
    public List district(@RequestParam("id") String id) {
        DistrictExample ex = new DistrictExample();
        ex.createCriteria().andCityidEqualTo(id);
        List<District> districtList = districtdao.selectByExample(ex);
        return districtList;
    }
}
