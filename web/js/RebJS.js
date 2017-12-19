/**
 * Created by CWZZ on 2016/11/28.
 *
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

        $(".del").click(
            function () {
                var select = $("#select").val();
                $.ajax({
                    type: "post",
                    url:  "rebm.do",
                    data: {
                        "select": select,
                        "action": "delReb",
                    },
                    success:function (data) {
                        if (data == "true")
                        {
                            alert("删除成功！");
                            window.location.reload();
                        }
                        else
                            alert("失败了..");
                    }
                });
            }
        )

        $(".add").click(
            function () {
                var textarea = $("#newReb").val();
                var userID = $("#userID").val();
                $.ajax({
                    type: "post",
                    url:  "rebm.do",
                    data: {
                        "textarea": textarea,
                        "userID": userID,
                        "action": "addReb",
                    },
                    success:function (data) {
                        if (data == "true")
                        {
                            alert("添加成功！");
                            window.location.reload();
                        }
                        else
                            alert("失败了..");
                    }
                });
            }
        )
        

    }
);








