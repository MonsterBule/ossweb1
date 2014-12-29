package com.shinowit.framework.intercepter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2014/12/22.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri1 = request.getRequestURI();

//        String path = request.getServletPath();
//        String baseUri = request.getContextPath();
//        System.out.println(baseUri);
//        System.out.println(path);
//        System.out.println(uri1);

        if ((uri1.indexOf("index") != -1) || (uri1.indexOf("images") != -1) || (uri1.indexOf("css") != -1) || (uri1.indexOf("css") != -1)) {
            return true;

        }
//        if (uri1.endsWith("/login") || (uri1.endsWith("/html/login.jsp"))) {
//            //处理登陆操作的url,放行
//            return true;
//        }
        HttpSession session = request.getSession();
        if ((session != null) && (session.getAttribute("start")) != null) {
            return true;
        }

        response.sendRedirect(request.getContextPath() + "/index/login.jsp");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
