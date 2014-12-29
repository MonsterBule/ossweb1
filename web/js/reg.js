function reg_value() {
    var email = document.getElementById("").value;
    if ((email = null) || (email.trim().length() < 0)) {

        alert("邮箱不能为空");
        document.getElementById("username1").focus();
        return false;
    }


}