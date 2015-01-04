<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/30
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">

        $(function () {

            $.post("GetData.ashx", null, function (data) {

                var total = data;
                PageClick(1, total, 3);
            });

            PageClick = function (pageIndex, total, spanInterval) {
                $.ajax({
                    url: "GetData.ashx",
                    data: { "PageIndex": pageIndex },
                    type: "post",
                    dataType: "json",
                    success: function (data) {

                        //索引从1开始
                        //将当前页索引转为int类型
                        var intPageIndex = parseInt(pageIndex);

                        //获取显示数据的表格
                        var table = $("#content");
                        //清楚表格中内容
                        $("#content tr").remove();

                        //向表格中添加内容
                        for (var i = 0; i < data.length; i++) {
                            table.append(
                                    $("<tr><td>" +
                                            data[i].Title
                                            + "</td><td>" +
                                            data[i].Auhor
                                            + "</td><td>" +
                                            data[i].PublishDate
                                            + "</td><td>" +
                                            data[i].ISBN
                                            + "</td></tr>")
                            );
                        } //for

                        //创建分页
                        //将总记录数结果 得到 总页码数
                        var pageS = total
                        if (pageS % 10 == 0) pageS = pageS / 10;
                        else pageS = parseInt(total / 10) + 1;
                        var $pager = $("#pager");

                        //清楚分页div中的内容
                        $("#pager span").remove();
                        $("#pager a").remove();

                        //添加第一页
                        if (intPageIndex == 1)
                            $pager.append("<span class='disabled'>第一页</span>");
                        else {
                            var first = $("<a href='javascript:void(0)' first='" + 1 + "'>第一页</a>").click(function () {
                                PageClick($(this).attr('first'), total, spanInterval);
                                return false;
                            });
                            $pager.append(first);
                        }


                        //添加上一页
                        if (intPageIndex == 1)
                            $pager.append("<span class='disabled'>上一页</span>");
                        else {
                            var pre = $("<a href='javascript:void(0)' pre='" + (intPageIndex - 1) + "'>上一页</a>").click(function () {
                                PageClick($(this).attr('pre'), total, spanInterval);
                                return false;
                            });
                            $pager.append(pre);
                        }

                        //设置分页的格式  这里可以根据需求完成自己想要的结果
                        var interval = parseInt(spanInterval); //设置间隔
                        var start = Math.max(1, intPageIndex - interval); //设置起始页
                        var end = Math.min(intPageIndex + interval, pageS)//设置末页

                        if (intPageIndex < interval + 1) {
                            end = (2 * interval + 1) > pageS ? pageS : (2 * interval + 1);
                        }

                        if ((intPageIndex + interval) > pageS) {
                            start = (pageS - 2 * interval) < 1 ? 1 : (pageS - 2 * interval);

                        }


                        //生成页码
                        for (var j = start; j < end + 1; j++) {
                            if (j == intPageIndex) {
                                var spanSelectd = $("<span class='current'>" + j + "</span>");
                                $pager.append(spanSelectd);
                            } //if
                            else {
                                var a = $("<a href='javascript:void(0)'>" + j + "</a>").click(function () {
                                    PageClick($(this).text(), total, spanInterval);
                                    return false;
                                });
                                $pager.append(a);
                            } //else
                        } //for

                        //上一页
                        if (intPageIndex == total) {
                            $pager.append("<span class='disabled'>下一页</span>");

                        }
                        else {

                            var next = $("<a href='javascript:void(0)' next='" + (intPageIndex + 1) + "'>下一页</a>").click(function () {
                                PageClick($(this).attr("next"), total, spanInterval);
                                return false;
                            });
                            $pager.append(next);
                        }

                        //最后一页
                        if (intPageIndex == pageS) {
                            $pager.append("<span class='disabled'>最后一页</span>");

                        }
                        else {
                            var last = $("<a href='javascript:void(0)' last='" + pageS + "'>最后一页</a>").click(function () {
                                PageClick($(this).attr("last"), total, spanInterval);
                                return false;
                            });
                            $pager.append(last);
                        }

                    } //sucess

                }); //ajax

            }; //function

        });   //ready

    </script>
</head>
<body>
<div>

    <table id="content">/*显示数据内容*/

    </table>

    <div id="pager" class="yahoo2"></div>
    /*显示分页条*/

</div>
</body>
</html>
