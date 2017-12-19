/**
 * Created by CWZZ on 2016/12/20.
 */
$(document).ready(
    function () {
        if ($("#username").html() == "") {
            alert("你还没有登录！");
            window.open("login.jsp", "_self");
        }
        
        $("#mod").click(
            function () {
                var textarea = $("#newReb").val();
                var val = $("#select").val();
                var select = val;
                // alert(textarea);
                $.ajax({
                    type: "post",
                    url:  "rebm.do",
                    data: {
                        "textarea": textarea,
                        "rebID": select,
                        "action": "modReb",
                    },
                    success:function (data) {
                        if (data == "true")
                        {
                            alert("修改成功！");
                            window.open("Remembrance.jsp", "_self");
                        }
                        else
                            alert("失败了..");
                    }
                });
            }
        )
        
    }
);
