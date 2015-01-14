var MerAdd = function (id, recman, address, postcode, tel) {
    this.id = id;
    this.postcode = postcode;
    this.recaddress = postcode;
    this.recman = recman;
    this.tel = tel;
}
$(document).ready(function () {

    $("[name='newaddressid']").click(function () {
        $(this).parent().css("background", "#FF6100").siblings().css("background", "none");
    });

//        ss(":input").click(function(){
//            ss(".aaa").show();
//        });

    $("#Name").blur(function () {
        if (($(this).val() === "")) {
            $("#errorName").text("收货人姓名不能为空");
            $(this).focus();
        } else {
            $("#errorName").text("");
        }
    });

    $("#Zip").blur(function () {
        if (($(this).val() === "")) {
            $("#errorPostal").text("邮政编码不能为空");
            $(this).focus();
        } else {
            $("#errorPostal").text("");
        }
    });

    $("#Address").blur(function () {
        if (($(this).val() === "")) {
            $("#errorAddress").text("收货地址不能为空");
            $(this).focus();
        } else {
            $("#errorAddress").text("");
        }
    });

    $("#Mobile").blur(function () {
        if (($(this).val() === "")) {
            $("#errorMobile").text("联系电话不能为空");
            $(this).focus();
        } else {
            if (!$(this).val().match(/(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/)) {
                $("#errorMobile").text("联系电话不合法");
            } else {
                $("#errorMobile").text("");
            }
        }
    });
});
function updateclick(msg, recname, recaddress, postcode, tel) {
    $.colorbox({
        html: "<table style='border-collapse:separate; border-spacing:10px;width: 453px;height: 354px' id='table1'>" +
            "<tbody>" +
            "<tr>" +
            "<td style='background: #808080;width: 0;height: 46px'>请输入新的发货地址</td>" +
            "</tr>" +
            "<tr>" +
            "<td style='margin: 0'>" +
            "<form id='formid' action='/shop/updateaddr' method='post'>" +
            "<input  type='text' value=" + msg + " name='id' style='visibility: hidden'/>" +
            "<ul style='border-collapse:separate; border-spacing:10px;margin: 10px 92px 30px 92px' id='newul'>" +
            "<li style='margin-left: 15px'>" +
            "<label >收货人:</label><input name='recman' value=" + recname + " type='text'/>" +
            "</li></br>" +
            "<li>" +
            "<label >收货地址:</label><input name='recaddress' value=" + recaddress + " type='text'/>" +
            "</li></br>" +
            "<li>" +
            "<label >邮政编码:</label><input name='postcode' value=" + postcode + " type='text'/>" +
            "</li></br>" +
            "<li>" +
            "<label >联系电话:</label><input name='tel' value=" + tel + " type='text'/>" +
            "</li></br>" +
            "<li>" +
            "<input type='submit' style='margin-left: 105px;width: 95px;background: red'/>" +
            "</li>" +
            "</ul>" +
            "</form>" +
            "</td>" +
            "</tr>" +
            "</tbody>" +
            "</table>"
    })
}
//删除
function deletemeradd(msg) {
    $.ajax({
        type: "POST",
        url: "${ctx}/shop/delememaddr",
        data: {id: msg},
        dataType: "Text",
        success: function (msg) {
            alert(msg);
            window.location = "${ctx}/shop/01chart"
        },
        error: function (msg) {
            alert(msg)
        }
    })
}
//将选中的地址添加到session中
function meradd() {
    var id = ""
    $("#changeAdd input[type=radio]:checked").each(function () {
        id = ss(this).attr("id");
    });
    $.ajax({
        type: "POST",
        url: _path + "/shop/addrsession",
        data: {meraddid: id},
        dataType: "Text",
        success: function (msg) {
            alert(msg);
            window.location = _path + "/shop/02chart";
        },
        error: function (msg) {
            window.location = _path + "/shop/01chart";
            alert(msg);
        }

    })
};
//session失效跳转