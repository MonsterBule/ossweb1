<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/24
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>启奥</title>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript"> var chandisename = '${chandisename}'</script>

    <script type="text/javascript">
        $(document).ready(function () {
//         var a=   function sleep(numberMillis) {
//                var now = new Date();
//                var exitTime = now.getTime() + numberMillis;
//                while (true) {
//                    now = new Date();
//                    if (now.getTime() > exitTime)
//                        alert("aaaaaaaa")
//                        break;
//
//                }
//            }
//            a(1000);

//            setInterval (   function showTime()
//                    {
//                        var today = new Date();
//                        alert("时间: " + today.toString ());
//                    }
//                    , 5000);
            var pageIndex = '';
            var aa = function (pageIndex) {
                if ((typeof(chandisename) == "undefined") || (chandisename == "null")) {
                    chandisename = null;
                }
                $.ajax({
                    type: "GET",
                    url: "/list/list?page=" + pageIndex + '&name=' + chandisename,
                    //   data: {merchandisename: $("#MerchandiseName").val(), price: $("#Price").val()},
                    dataType: "json",
                    success: function (data) {
                        $('.hotsale').empty();   //清空hotsale里面的所有内容
                        var html = '';
                        var html1 = '';
                        var a = data.num;
                        var p = Math.ceil(a / 8);
                        if (pageIndex == 0) {
                            pageIndex++;
                        }
                        var newpage = 1;
                        $.each(data.data_list, function (commentIndex, comment) {
                            html += '<dl>' +
                                    '<dt>' +
                                    '<a href="${ctx}/merchendise/info?merchandiseName=' + comment['MerchandiseName'] + ' "  target="_new">' +
                                    '<img src="${ctx}/images/T1.jpg" width="310" height="310"border="0"/></a></dt><dd>' + comment['MerchandiseName'] + '</dd>' +
                                    '<dd><span class="viv1">￥:' + comment['Price'] + '.0</span><span class="viv2"><a href="" target="_new">' +
                                    '<img src="${ctx}/images/vivioow_b2.jpg" width="80" height="24" border="0"/></a></span></dd></dl>';
                        });
                        html1 += '<div style=" height: 460px;width:728px"> ' + html + '</div>';

                        html1 += '<div  style="text-align: center "class="page">共' + a + '件商品 / 分页' + p + '显示 / 当前第' + pageIndex + '页 / <input class="inputpage" type="text" value="1" name="pagenum" id="pagenum" style="width: 30px"/> <input class="button1" type="button"value="GO"/> '

                        if (1 < pageIndex) {
                            html1 += ' <a class="pageclass"  data="pagereduce" style="color: black;">前一页</a> '
                        }
                        if (p > pageIndex) {
                            html1 += ' <a class="pageclass" data="pageadd" style="color: black;">后一页</a> '
                        }
                        html1 += '<a  class="pageclass" data="1" style="color: black;">首页</a> <a  class="pageclass" data=' + p + ' style="color: black;">尾页</a> </div>';
                        $('.hotsale').html(html1);

                        $('.button1').on('click', function () {
                            var inputpage = $('.inputpage').val();
                            if (inputpage > p) {
                                alert("输入的页数超出范围！！！");
                                return;
                            }
                            if (isNaN(inputpage)) {
                                alert("请输入一个有效的数字");
                                return;
                            }
                            aa(inputpage);

                        });
                        $('.pageclass').on('click', function () {
                            var Operation = $(this).attr("data")
                            if (Operation == 'pagereduce') {
                                pageIndex--;
                                aa(pageIndex);
                                return;
                            }
                            if (Operation == 'pageadd') {
                                pageIndex++;
                                aa(pageIndex);
                                return;
                            }
                            pageIndex = Operation;
                            aa(pageIndex);
                        });
                    }
                });
            };
            aa(pageIndex);
            $(".merchclass").click(function () {
                var MerchdieclassName = $(this).attr("data")
                var bb = function (pageIndex) {
                    $.ajax({
                        type: "GET",
                        url: "/list/list?name=" + MerchdieclassName + '&page=' + pageIndex,
                        data: {merchandisename: $("#MerchandiseName").val(), price: $("#Price").val()},
                        dataType: "json",
                        success: function (data) {
                            $('.hotsale').empty();   //清空hotsale里面的所有内容
                            var html = '';
                            var html1 = '';
                            var a = data.num;
                            var p = Math.ceil(a / 8);
                            if (pageIndex == 0) {
                                pageIndex++;
                            }
                            var newpage = 1;
                            $.each(data.data_list, function (commentIndex, comment) {
                                html += '<dl>' +
                                        '<dt>' +
                                        '<a href="${ctx}/merchendise/info?merchandiseName=' + comment['MerchandiseName'] + '" target="_new">' +
                                        '<img src="${ctx}/images/T1.jpg" width="310" height="310"border="0"/></a></dt><dd>' + comment['MerchandiseName'] + '</dd>' +
                                        '<dd><span class="viv1">￥:' + comment['Price'] + '.0</span><span class="viv2"><a href="" target="_new">' +
                                        '<img src="${ctx}/images/vivioow_b2.jpg" width="80" height="24" border="0"/></a></span></dd></dl>';
                            });
                            html1 += '<div style=" height: 460px;width:728px"> ' + html + '</div>';

                            html1 += '<div  style="text-align: center "class="page">共' + a + '件商品 / 分页' + p + '显示 / 当前第' + pageIndex + '页 / <input class="inputpage" type="text" value="1" name="pagenum" id="pagenum" style="width: 30px"/> <input class="button1" type="button"value="GO"/> '
                            if (1 < pageIndex) {
                                html1 += ' <a class="pageclass"  data="pagereduce" style="color: black;">前一页</a> '
                            }
                            if (p > pageIndex) {
                                html1 += ' <a class="pageclass" data="pageadd" style="color: black;">后一页</a> '
                            }
                            html1 += '<a  class="pageclass" data="1" style="color: black;">首页</a> <a  class="pageclass" data=' + p + ' style="color: black;">尾页</a> </div>';
                            $('.hotsale').html(html1);


                            $('.button1').on('click', function () {
                                var inputpage = $('.inputpage').val();
                                if (inputpage > p) {
                                    alert("输入的页数超出范围！！！");
                                    return;
                                }
                                if (isNaN(inputpage)) {
                                    alert("请输入一个有效的数字");
                                    return;
                                }
                                bb(inputpage);

                            });
                            $('.pageclass').on('click', function () {
                                var Operation = $(this).attr("data")
                                if (Operation == 'pagereduce') {
                                    pageIndex--;
                                    bb(pageIndex);
                                    return;
                                }
                                if (Operation == 'pageadd') {
                                    pageIndex++;
                                    bb(pageIndex);
                                    return;
                                }
                                pageIndex = Operation;
                                bb(pageIndex);
                            });
                        }
                    })
                };
                bb(pageIndex);
            })
        })
    </script>
</head>

<body>
<div id="box">
    <!--top start -->
    <div id="top">
        <a href="index.html"><img src="${ctx}/images/logo.gif" alt="Estimation" width="255" height="58" border="0"
                                  class="logo"/></a>

        <p class="topDiv"></p>

        <p class="navLeft"></p>
        <ul>

            <li><a href="index.html" class="hover">首页</a></li>
            <li>
                <a href="#">关于我们</a></li>
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
    <div id="header">
        <!--nav start -->
        <div class="nav">
            <ul>
                <li class="first"><a href="#" data="">新品上架</a></li>
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
                            class="Lloginfg">&nbsp;</span><a href="reg.html">注册</a></div>
                </li>
            </ul>
        </div>
        <!--nav end -->
        <div class="spacer"></div>
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
    <!--recommend start-->
    <div class="recommend">
        <h2>推荐美国山核桃长寿果 大杏仁 15.8/半斤 奶香味</h2>

        <p><img src="${ctx}/images/coma.gif" width="15" height="12" style="margin-right:12px;"/>山核桃,又名胡桃、马核桃、核桃楸果,是乔木核桃楸的种子。山核桃营养丰富,价值很高,是一种优质木本高级油料作物。此外,还含锌、锰、铬等微量元素与尼克酸等。<img
                src="${ctx}/images/coma_inverse.gif" width="15" height="12" style="margin-left:12px;"/></p>
    </div>
    <!--recommend end-->
    <!--body start -->
    <div id="body">
        <!--leftMain start -->
        <div id="leftMain">
            <!--left start -->
            <div id="left">
                <h2>商品分类</h2>
                <ul>

                    <c:forEach items="${merchandiseclss}" var="mer">
                        <li><a class="merchclass" data="${mer.MerchandiseCName}">${mer.MerchandiseCName} </a>
                        </li>
                    </c:forEach>
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
<span style="color:#f9c441;">ssss<br/>
ssssssssss<br/>
</span>
            </div>
            <!--left end -->
        </div>
        <!--leftMain end -->
        <!--mid start -->
        <div id="mid">
            <h2>新品上市</h2>
            <!--hotsale_ad start -->
            <div class="hotsale_ad"><img src="${ctx}/images/pic1.jpg" width="780" height="274"/></div>
            <!--hotsale_ad end -->
            <!--hotsale start -->
            <div class="hotsale">

                <br class="spacer"/>
            </div>

            <div id="cfooter"></div>
            <!--hotsale end -->
        </div>
        <!--mid end -->
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
</html>
