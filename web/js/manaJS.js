/**
 * Created by CWZZ on 2016/12/21.
 */
function checkLog() {
    var username = $("#username").val();
    var password = $("#password").val();
    if (!username || !password) {
        alert("请输入管理员名和密码！");
        return;
    }
    else {
        $.ajax({
            type: "POST",
            url: "login.do",
            data: {
                "username": username,
                "password": password,
                "action": "manaLog"
            },
            success: function (data) {
                if (data == "true") {
                    alert("登录成功！")
                    window.open("manaQuest.jsp", "_self");

                } else {
                    alert("错误提示：用户名或密码错误！")
                }
            }
        });
    }
}