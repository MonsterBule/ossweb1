package com.shinowit.framework.convert;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2014/12/19.
 */
@Controller
@RequestMapping("valid")
public class ValidController {
//    @InitBinder
//    public void initBinder(DataBinder binder) {
//        //向当前Controller注册校验器
//        binder.setValidator(new UserinfoValidator());
//    }
//
//
//    @RequestMapping(value = "/test", method = RequestMethod.GET)
//    public String prepareNew(@ModelAttribute("user") Userinfo userinfo) {
//
//        return "html/login";
//    }
//
//    @RequestMapping(value = "/test", method = RequestMethod.POST)
//    public String prepareNew(@Valid @ModelAttribute("user") Userinfo userinfo, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
//            return "html/login";
//        }
//        return "";
//    }

    public String test() {
        return "";
    }
}
