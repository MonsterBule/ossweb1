<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/24
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>启奥</title>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/innerstyle.css" rel="stylesheet" type="text/css"/>
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
            <div id="welcome" class="welmsgdiv2"><span>您好，欢迎光临果果香。</span><a href="login.html">登录</a><span
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
            <ul>
                <li><a href="#">特级椒盐味</a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">壳杏仁 23元/500克 </a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">壳杏仁 23元/500克 </a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">壳杏仁 23元/500克</a></li>
                <li><a href="#">壳杏仁 23元/500克 </a></li>
                <li><a href="#">纸皮巴旦木龙果</a></li>
                <li><a href="#">壳杏仁 23元/500克</a></li>
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
                <dt><img src="${ctx}/images/T1.jpg" width="310" height="310"/></dt>
                <dd>
                    <table height="413" border="1" cellpadding="0" cellspacing="0"
                           style="border-collapse:collapse; border:#ccc 1px solid;">
                        <tbody>
                        <tr>
                            <td valign="top" align="middle" width="323" colspan="2"
                                height="30"><font
                                    color="#bb1213"><strong>实心眼 特级薄皮奶香味 巴旦木 250g</strong></font></td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">市 场 价：
                            </td>
                            <td valign="top" width="212" height="28"><span
                                    style="text-decoration:line-through; font-size:14px;color:#666; font-weight:bold;">￥25.0</span>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">网 站 价：
                            </td>
                            <td valign="top" width="212" height="28"><span
                                    style=" font-size:14px;color:#c00; font-weight:bold;">￥18.0</span></td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="28">规&nbsp;&nbsp;&nbsp; 格：
                            </td>
                            <td valign="top" width="212" height="28">500g</td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111" height="28">批 发 价：</td>
                            <td valign="top" width="212"
                                height="28">电话咨询
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="111" height="5"></td>
                            <td width="212" height="5"></td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="111"
                                height="21">内&nbsp;&nbsp;&nbsp; 配：
                            </td>
                            <td valign="top" width="212" height="169" rowspan="2">
                                <table height="32" cellspacing="0" cellpadding="0"
                                       width="100%" border="0" style="border:none;">
                                    <tbody>
                                    <tr>
                                        <td
                                                valign="top">750g有机全麦粉<br/>
                                            750g黄金玉米粉<br/>
                                            750g黄豆粉<br/>
                                            750g地瓜粉<br/>
                                            750g高粱粉<br/>
                                            750g豌豆粉<br/>
                                            750g窝窝头粉<br/>
                                            750g玉米糁
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="111" height="147">　</td>
                        </tr>
                        <tr>
                            <td align="middle" width="323" colspan="2"
                                height="89"><span style="font-size:20px; color:#f00; font-weight:bold;">批发价热线：0315-3876584</span>
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
                <p><strong>产品信息:</strong>所有散装东东在包装前都会经过严格挑拣，挑拣掉空籽、僵籽、空壳等，很难做到100%，坏籽的比率一般最多2-3％。是良好的蛋白质资源之一，同时也是一种极好的甲型生育酚型维生素E的来源，甲型生育酚是维生素E的最有效型态。美国杏仁还能提供镁、膳食纤维、钾、钙、磷和铁等。并且，美国杏仁中所含脂肪的近70%是有益于健康的单不饱和脂肪，研究表明其有助于保持一个健康的胆固醇水平。
                </p>

                <p>
                    此外，杏仁和其他坚果中含有植物化学物质，这些植物成分可以有力地抗衡心脏病、中风以及其他慢性疾病。在树坚果家族中，美国杏仁和中国杏仁是两种不同的坚果，虽然在中文里它们都被称为杏仁，但两者的营养成分不同，功效也不同。美国大杏仁对人们来说总是有些黄金情节，爱，昂贵，奢侈，处于巨大压力，亚健康状态，辛苦劳累的我们，更应该爱惜自己，一瓶纽崔莱可以买10斤大杏仁了，而十分之一价格换来的是家人的健康和美味。
                </p>

                <p>
                    此外，杏仁和其他坚果中含有植物化学物质，这些植物成分可以有力地抗衡心脏病、中风以及其他慢性疾病。在树坚果家族中，美国杏仁和中国杏仁是两种不同的坚果，虽然在中文里它们都被称为杏仁，但两者的营养成分不同，功效也不同。美国大杏仁对人们来说总是有些黄金情节，爱，昂贵，奢侈，处于巨大压力，亚健康状态，辛苦劳累的我们，更应该爱惜自己，一瓶纽崔莱可以买10斤大杏仁了，而十分之一价格换来的是家人的健康和美味。
                </p>

                <p>
                    此外，杏仁和其他坚果中含有植物化学物质，这些植物成分可以有力地抗衡心脏病、中风以及其他慢性疾病。在树坚果家族中，美国杏仁和中国杏仁是两种不同的坚果，虽然在中文里它们都被称为杏仁，但两者的营养成分不同，功效也不同。美国大杏仁对人们来说总是有些黄金情节，爱，昂贵，奢侈，处于巨大压力，亚健康状态，辛苦劳累的我们，更应该爱惜自己，一瓶纽崔莱可以买10斤大杏仁了，而十分之一价格换来的是家人的健康和美味。
                </p>

                <p><strong>公司主营项目：</strong>中秋月饼 端午粽子 年货礼品 有机食品 干果杂粮 水果蔬菜 山菌海鲜 橄榄油 柴鸡蛋等成套礼品</p>

                <p><strong>产品价格低:</strong>我们已与国内几十家正规大型工厂达成了共同开发、设计、生产、销售礼品的合作协议，最直接的礼品生产加工渠道以及薄利多销的经营准则使我们的礼品价格做到最低。
                </p>

                <p><strong>我们的客户包括:</strong>平安保险 光大银行 联想网御 爱国者 新雅迪传媒……北京乐购礼品团购网欢迎您的到来,公司服务于北京多家知名企事业单位。渠道市场京北京
                    贵宾贵宾服务百分百。乐购为您提供礼品团购全攻略，专业的服务永远是我公司的经营宗旨。您的支持和鼓励都将成为我们前进的方向。为您提供专业的礼品团购服务，确保你的礼品团购，买的更放心。</p>
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
