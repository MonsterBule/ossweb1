<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/24
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>启奥</title>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/innerstyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                        type: 'GET',
                        url: '${ctx}/mercahndiseclass/list2',
                        dataType: 'json',
                        success: function (data) {
                            $('.ulclass').empty();
                            var html = '';
                            $.each(data, function (commentIndex, comment) {
                                html += '<li><a href="#" class="merchclass" data=' + comment['MerchandiseCName'] + '>' + comment['MerchandiseCName'] + '</a></li>';
                            });
                            $('.ulclass').html(html);
                            $('.merchclass').click(function () {
                                var MerchdieclassName = $(this).attr('data');
                                window.location.href = "<%=request.getContextPath()%>/mercahndiseclass/list?name=" + MerchdieclassName;
                            });
                        }
                    }
            );
            var num = '';
            var stock = '';
            $('.jian').click(function () {
                num = $('.inputnum').val(parseInt($('.inputnum').val()) - 1);
                if ((parseInt($('.inputnum').val())) < 1) {
                    parseInt($('.inputnum').val(1));
                }
            });
            $('.add').click(function () {
                stock = $('.stocknum').attr('data');
                if (isNaN(stock)) {
                    alert("商品已售完");
                } else {
                    num = $('.inputnum').val(parseInt($('.inputnum').val()) + 1);
                    if ((parseInt($('.inputnum').val())) > stock) {
                        parseInt($('.inputnum').val(stock))
                    }
                }
            });
            $('.goumai').click(function () {
            });
            $('.gouwuche').click(function () {
                $.ajax({
                    type: "POST",
                    url: '${ctx}/chart/insert',
                    data: {
                        price: $('.price').attr('data'),
                        name: $('.name').attr('data'),
                        num: $('.inputnum').val()
                    },
                    dataType: "Text",
                    success: function () {
                        alert("添加成功")
                    },
                    error: function () {
                        alert("内部错误")
                    }
                });
            });
        });
    </script>
</head>
<body>
<div id="box">
<!--top start -->
<!--top start -->
<div id="top">
    <a href="index.html"><img src="${ctx}/images/logo.gif" alt="Estimation" width="255" height="58" border="0"
                              class="logo"/></a>

    <p class="topDiv"></p>

    <p class="navLeft"></p>
    <ul>
        <li><a href="index.html" class="hover">首页</a></li>
        <li><a href="#">关于我们</a></li>
        <li><a href="#">在线客服</a></li>
        <li class="chart"><a href="../html/chart.html">购物车</a></li>
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
            <div id="welcome" class="welmsgdiv2"><span>您好，欢迎光临果果香。</span><a
                    href="../WEB-INF/views/login.html">登录</a><span
                    class="Lloginfg">&nbsp;</span><a href="reg.html">注册</a></div>
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
<!--guide02 start-->
<div class="guide02"><a href="#"><img src="${ctx}/images/guide_02.jpg" width="492" height="107" border="0"/></a><a
        href="#"><img src="${ctx}/images/guide_03.jpg" width="481" height="107" border="0"/></a></div>
<!--guide02 end -->
<!--body start -->
<div id="body" style="margin-top:1px;">
    <!--leftMain start -->
    <div id="leftMain">
        <!--left start -->
        <div id="left">
            <h2>商品分类</h2>
            <ul class="ulclass">

            </ul>
            <h2 class="detail">纸皮巴旦木龙果</h2>
            <ul class="leftLink">
                <li><a href="#">特级椒盐味</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">特级椒盐味</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">特级椒盐味</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">特级椒盐味</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
            </ul>
            <br class="spacer"/>
    <span style="color:#f9c441;">sssss<br/>
    ssssssssss<br/>
    </span></div>
        <!--left end -->
    </div>
    <!--leftMain end -->
    <!--mid start -->
    <div id="mid">
        <h6><img height="28" src="${ctx}/images/cp_1.jpg" width="584" border="0"/></h6>
        <!--pro_price start -->
        <div class="pro_price">
            <dl>
                <dd>
                    <table style="width: 440px;height: 340px">
                        <tr>
                            <td>
                                <img src="${ctx}/images/T1.jpg" width="310" height="310"/>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购买数量:<img
                                    class="jian" src="${ctx}/images/jian.png" alt=""/><input
                                    class="inputnum" value="1" type="text" style="width: 20px"
                                    onkeypress="return IsNum(event)"/>
                                <script language="javascript" type="text/javascript">
                                    function IsNum(e) {
                                        var k = window.event ? e.keyCode : e.which;
                                        if (((k >= 48) && (k <= 57)) || k == 8 || k == 0) {
                                        } else {
                                            if (window.event) {
                                                window.event.returnValue = false;
                                            }
                                            else {
                                                e.preventDefault(); //for firefox
                                            }
                                        }
                                    }
                                </script>
                                <img class="add"
                                     src="${ctx}/images/add.png"
                                     alt=""/></td>
                        </tr>
                        <tr>
                            <td style="margin-left: 50px ;width: 156px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                                    class="goumai" src="${ctx}/images/mai.gif" width="100" height="20"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img class="gouwuche"
                                     src="${ctx}/images/jiaru.gif" width="100" height="20"/></td>
                        </tr>
                    </table>
                </dd>
                <dd>
                    <table height="413" border="1" cellpadding="0" cellspacing="0"
                           style="border-collapse:collapse; border:#ccc 1px solid;">
                        <tbody>
                        <tr>
                            <td valign="top" align="middle" width="323" colspan="2"
                                height="30"><font
                                    color="#bb1213"><strong class="name"
                                                            data="${merchandis.merchandisename}">${merchandis.merchandisename}</strong></font>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">市 场 价：
                            </td>
                            <td valign="top" width="212" height="28"><span
                                    style="text-decoration:line-through; font-size:14px;color:#666; font-weight:bold;">￥${merchandis.price}+10</span>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">网 站 价：
                            </td>
                            <td valign="top" width="212" height="28"><span
                                    class="price" data="${merchandis.price}"
                                    style=" font-size:14px;color:#c00; font-weight:bold;">￥${merchandis.price}</span>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">规&nbsp;&nbsp;&nbsp; 格：
                            </td>
                            <td valign="top" width="212" height="28">${merchandis.spec}</td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111" height="28">批 发 价：</td>
                            <td valign="top" width="212"
                                height="28">电话咨询
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">状 态：
                            </td>
                            <td valign="top" width="212" height="28"><span
                                    style=" font-size:14px;color:#c00; font-weight:bold;">${status}</span></td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">库 存：
                            </td>
                            <td class="stocknum" valign="top" width="212" height="28" data="${num}"><span
                                    style=" font-size:14px;color:#c00; font-weight:bold;">${num}</span></td>
                        </tr>
                        <%--<tr>--%>
                        <%--<td align="right" width="111" height="5"></td>--%>
                        <%--<td width="212" height="5"></td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                        <%--<td valign="top" align="right" width="111"--%>
                        <%--height="21">内&nbsp;&nbsp;&nbsp; 配：--%>
                        <%--</td>--%>
                        <%--<td valign="top" width="212" height="169" rowspan="2">--%>
                        <%--<table height="32" cellspacing="0" cellpadding="0"--%>
                        <%--width="100%" border="0" style="border:none;">--%>
                        <%--<tbody>--%>
                        <%--<tr>--%>
                        <%--<td--%>
                        <%--valign="top">750g有机全麦粉<br/>--%>
                        <%--750g黄金玉米粉<br/>--%>
                        <%--750g黄豆粉<br/>--%>
                        <%--750g地瓜粉<br/>--%>
                        <%--750g高粱粉<br/>--%>
                        <%--750g豌豆粉<br/>--%>
                        <%--750g窝窝头粉<br/>--%>
                        <%--750g玉米糁--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                        <%--</tbody>--%>
                        <%--</table>--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                        <%--<td width="111" height="147">　</td>--%>
                        <%--</tr>--%>
                        <tr>
                            <td align="middle" width="323" colspan="3"
                                height="70"><span style="font-size:20px; color:#f00; font-weight:bold;">批发价热线：0315-3876584</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </dd>
                <br class="spacer"/>
            </dl>
        </div>
        <!--pro_detail start -->
        <div class="pro_detail">
            <h3>--详细介绍--</h3>
            <!--pro_detail_con start -->
            <div class="pro_detail_con">
                <p><strong>产品信息:</strong>${merchandis.describe}</p>
            </div>
            <!--pro_detail_con end -->
        </div>
        <!--pro_detail end -->
        <br class="spacer"/>

    </div>
    <!--mid end -->
    <br class="spacer"/>
</div>
<!--body end -->
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
</div>
<!--box-->
</body>
</html>
