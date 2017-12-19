/**
 * Created by CWZZ on 2016/11/29.
 */
var flag_user = true;		//记录用户是否合法
var flag_pwd = true;			//记录密码是否合法
var flag_repwd = true;		//确认密码是否通过
var flag_email = true;		//记录E-mail地址是否合法

function checkUser(username) {
    if (username == "") {
        $("#td_user").html("请输入用户名!");
        $("#td_user").css("display","block");
        $("#td_user").css("color","red");
        flag_user = false;
    }
    else {
        $.ajax({
            type: "POST",
            url: "reg.do",
            data: {
                "username": username,
                "action": "checkUser",
            },
            success: function (data) {
                if (data == "true") {
                    $("#td_user").html("√");
                    $("#td_user").css("display","block");
                    $("#td_user").css("color","green");
                    flag_user = true;

                } else {
                    $("#td_user").html("用户名已存在!");
                    $("#td_user").css("display","block");
                    $("#td_user").css("color","red");
                    flag_user = false;
                }
            }
        });
    }
}

function checkPwd(password) {
    if (password == "") {
        $("#td_pwd").html("请输入密码!");
        $("#td_pwd").css("display","block");
        $("#td_pwd").css("color","red");
        flag_pwd = false;
    }
    else {
        $("#td_pwd").html("√");
        $("#td_pwd").css("display","block");
        $("#td_pwd").css("color","green");
        flag_pwd = true;
    }
}

function checkRepwd(repassword) {
    if (repassword == "") {
        $("#td_repwd").html("请确认密码!");
        $("#td_repwd").css("display","block");
        $("#td_repwd").css("color","red");
        flag_repwd = false;
    }
    else if (repassword != $("#password").val()) {
        $("#td_repwd").html("两次密码输入不一致!");
        $("#td_repwd").css("display","block");
        $("#td_repwd").css("color","red");
        flag_repwd = false;
    }
    else {
        $("#td_repwd").html("√");
        $("#td_repwd").css("display","block");
        $("#td_repwd").css("color","green");
        flag_repwd = true;
    }
}

function checkEmail(email) {
    var flag = checkemail(email);
    if (flag) {
        $("#td_email").html("√");
        $("#td_email").css("display","block");
        $("#td_email").css("color","green");
        flag_email = true;
    }
    else {
        $("#td_email").html("邮箱格式不正确!");
        $("#td_email").css("display","block");
        $("#td_email").css("color","red");
        flag_email = false;
    }
}

function checkemail(email) {
    var str = email;
    //在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
    var Expression = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    var objExp = new RegExp(Expression);		//创建正则表达式对象
    if (objExp.test(str) == true) {				//通过正则表达式进行验证
        return true;
    } else {
        return false;
    }
}

function sendInfo() {
    var message = "";
    var username = $("#username").val();
    var password = $("#password").val();
    var repassword = $("#repassword").val();
    var sex = $('input:radio[name="sex"]:checked').val();
    
    var email = $("#email").val();
    if (!flag_user || !username)
        message += "*用户名非法！\n";
    if (!flag_pwd || !password)
        message += "*密码非法！\n";
    if (!flag_repwd || !repassword)
        message += "*请确认密码！\n";
    if (!flag_email || !email)
        message += "*邮箱格式非法！\n";
    if (message != "") {
        alert(message);
        return;
    }

    $.ajax({
        type: "POST",
        url: "reg.do",
        data: {
            "username": username,
            "password": password,
            "sex": sex,
            "email": email,
            "action": "sendInfo"
        },
        success: function (data) {
            if (data == "true") {
                var c = confirm("注册成功，请先登录！")
                if (c) {
                    window.open("login.jsp", "_self", "");
                }
                else {
                    window.open("login.jsp", "_self", "");
                }

            } else {
                alert("注册失败！请检查！")
            }
        }
    })

}

function clear() {
    var flag_user = true;
    var flag_pwd = true;
    var flag_repwd = true;
    var flag_email = true;
    $("#td_user").html("");
    $("#td_user").css("display","none");
    $("#td_pwd").html("");
    $("#td_pwd").css("display","none");
    $("#td_repwd").html("");
    $("#td_repwd").css("display","none");
    $("#td_email").html("");
    $("#td_email").css("display","none");

}