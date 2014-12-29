<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/24
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/LoginAndReg.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div id="box">
    <!--top start -->
    <div id="top">
        <a href="../../index/index.html"><img src="${ctx}/images/logo.gif" alt="Estimation" width="255" height="58"
                                              border="0"
                                              class="logo"/></a>

        <p class="topDiv"></p>

        <p class="navLeft"></p>
        <ul>
            <li><a href="../../index/index.html" class="hover">首页</a></li>
            <li><a href="#">关于我们</a></li>
            <li><a href="#">在线客服</a></li>
            <li class="chart"><a href="../../html/chart.html">购物车</a></li>
        </ul>
        <p class="navRight"></p>

        <p class="topDiv"></p>

        <form name="serch" action="#" method="post">
            <input type="text" name="txtbox" value="购物搜索" class="txtBox"/>
            <input type="submit" name="go" value="搜" class="go"/>
        </form>
    </div>
    <!--top end -->
    <!--header start -->
    <div class="nav">
        <ul>
            <li class="first"><a href="#">新品上架</a></li>
            <li><a href="#">坚果炒货</a></li>
            <li><a href="#">补血大枣</a></li>
            <li><a href="#">经典肉类</a></li>
            <li><a href="#">进口零食</a></li>
            <li><a href="#">美味糖果</a></li>
            <li><a href="#">天然干果</a></li>
            <li><a href="#">蒙古奶酪</a></li>
            <li><a href="#">台湾牛轧糖</a></li>
            <li><a href="#">蜜饯果脯</a></li>
            <li class="last">
                <div id="welcome" class="welmsgdiv2"><span>您好，欢迎光临果果香。</span><a href="login.html">登录</a><span
                        class="Lloginfg">&nbsp;</span><a href="../../index/reg.html">注册</a></div>
            </li>
        </ul>
    </div>
    <!--header end -->
    <!--guide01 start -->
    <div class="guide01">
        <img src="${ctx}/images/guide_01.jpg" width="973" height="62" border="0" usemap="#Map"/>
        <map name="Map" id="Map">
            <area shape="rect" coords="398,11,493,51" href="#"/>
            <area shape="rect" coords="540,12,633,51" href="#"/>
            <area shape="rect" coords="684,12,790,53" href="#"/>
            <area shape="rect" coords="830,10,953,54" href="#"/>
        </map>
    </div>
    <!--guide01 end -->
    <!--body start -->
    <div id="body">
        <div id="Login">
            <h1 align="left" style="width:343px;"><img src="${ctx}/images/pic_dl.gif"></h1>

            <div class="dlC">
                <div class="regSetTabBox">
                    <div class="regSetTabMenu">
                        <ul>
                            <li id="one1" onclick="setTab('one',1,2)" class="hover">口口香用户</li>
                            <li class="" id="one2" onclick="setTab('one',2,2)" style="display:none;">VIP用户</li>
                        </ul>
                    </div>

                    <form:form action="/login/login" method="post" modelAttribute="user">

                        <div class="regSetTabCon">
                            <div style="display: block;" id="con_one_1"><span class="blank20"></span>

                                <div class="FTextArea"><span>用户名：</span>
                                    <form:input path="username"/>
                                        <%--<input name="UserName" id="UserName" class="" type="text" />--%>
                                </div>
                                <span class="blank20"></span>

                                <div class="FTextArea"><span>密&nbsp;&nbsp;码：</span>
                                    <form:password path="pwd"/>
                                        <%--<input name="PassWord" id="PassWord" class="" onkeypress="LoginKeyDown(event);" type="password" />--%>
                                </div>
                                <span class="blank15"></span>

                                <div class="btnReg">
                                    <button type="submit" class="" onclick="checkshopinglogin();"></button>
                                    <span><a href="${ctx}/index/GetPwd1.jsp" title="" target="_new">密码忘记了？</a></span>
                                </div>
                                <span class="blank20"></span></div>
                            <div id="con_one_2" style="display: none;"><span class="blank20"></span>
                                <span class="blank20"></span></div>
                        </div>
                    </form:form>
                    <span class="blank20"></span>

                    <div class="tishiArea">
                        <div class="tishiHead">温馨提示：</div>
                        <ul>
                            <li>1、请输入您的口口香用户名及密码进行登陆；</li>
                            <li>
                                2、如果还未注册口口香用户名，您可以使用VJIA用户名进行登陆,登陆后系统会自动为您注册一个与VJIA帐户相关联的口口香帐户。帐户关联后您可共享VJIA的会员积分和累积消费金额。
                            </li>
                        </ul>
                        <div class="">如有疑问请进入<a href="#" target="_blank">帮助中心</a>或<a href="#" target="_blank">联系客服</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br class="spacer"/>
    </div>
    <!--footer start -->
    <div id="footer">
        <ul>
            <li><a href="#">首页</a>|</li>
            <li><a href="#">关于我们</a>|</li>
            <li><a href="#">新闻资讯</a>|</li>
            <li><a href="#">价单下载</a>|</li>
            <li><a href="#">联系我们</a>|</li>
        </ul>
        <p class="copyright">Copyright 2010 vancl.com All Rights Reserved 冀ICP证xxxxxx号

        </p>

        <p class="design"><a href="http://www.CSSK8.com/" target="_blank" class="link">启奥科技</a></p>
    </div>
    <!--footer end -->
    <!--body end -->
</div>
<!--box-->
</body>
<c:if test="${!empty error}">
    <script type="text/javascript">
        alert('${error}');
    </script>
</c:if>
</html>

