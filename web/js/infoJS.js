/**
 * Created by CWZZ on 2016/12/22.
 */
$(document).ready(
    function () {
        if ($("#username").html() == "") {
            alert("你还没有登录！");
            window.open("login.jsp", "_self");
        }

        $("#exit").click(
            function () {
                alert("成功注销！");
            }
        )

        

        $("#reP").click(
            function () {
                var userID = $("#userID").val();
                var repassword = $("#rePassword").val();
                // alert(repassword);
                $.ajax({
                    type: "post",
                    url:  "info.do",
                    data: {
                        "userID": userID,
                        "repassword": repassword,
                        "action": "rePwd"
                    },
                    success:function (data) {
                        if (data == "true")
                        {
                            alert("修改成功！");
                            window.location.reload();
                        }
                        else
                            alert("失败了..");
                    }
                })
            }
        )

        $("#reS").click(
            function () {
                var userID = $("#userID").val();
                var resex = $('input:radio[name="reSex"]:checked').val();
                $.ajax({
                    type: "post",
                    url:  "info.do",
                    data: {
                        "userID": userID,
                        "resex": resex,
                        "action": "reSex"
                    },
                    success:function (data) {
                        if (data == "true")
                        {
                            alert("修改成功！");
                            window.location.reload();
                        }
                        else
                            alert("失败了..");
                    }
                })
            }
        )
        
        

        


    }
);