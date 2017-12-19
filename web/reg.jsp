<%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/11/25
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reg</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>

    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/regJS.js"></script>

</head>
<body>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
    </ul>
    <div class="main" style="height: auto">


        <div class="greybox2" style="height: auto;height: 280px">
            <h3>用户注册</h3>

            <h3>注意：用户名和Email注册后不能修改！</h3>
            <br>
            <div class="right" style="height: auto">
                <form action="#" method="post" id="regForm">
                    <table>
                        <tr>
                            <td>*用户名：</td>
                            <td>
                                <input type="text" name="username" id="username" onBlur="checkUser(this.value)">
                            </td>
                            <td id="td_user" style="display: none;"></td>
                        </tr>
                        <tr>
                            <td>*密码：</td>
                            <td>
                                <input type="password" name="password" id="password" onBlur="checkPwd(this.value)">
                            </td>
                            <td id="td_pwd"></td>
                        </tr>
                        <tr>
                            <td>*确认密码：</td>
                            <td>
                                <input type="password" name="repassword" id="repassword" onBlur="checkRepwd(this.value)">
                            </td>
                            <td id="td_repwd"></td>
                        </tr>
                        <tr>
                            <td>*性别：</td>
                            <td colspan="2">
                                <input type="radio" name="sex" id="sex" class="sex" checked="checked" value="男">男
                                <input type="radio" name="sex" class="sex" value="女">女
                            </td>
                        </tr>
                        <tr>
                            <td>*邮箱：</td>
                            <td>
                                <input type="text" name="email" id="email" onblur="checkEmail(this.value)">
                            </td>
                            <td id="td_email"></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <input type="button" value="注册" id="send" onclick="sendInfo()">
                                <input type="reset" value="重置" onclick="clear()">
                                <a href="login.jsp">已有账号？</a>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
            <div class="cleaner">
                &nbsp;
            </div>
        </div>
        <!-- /greybox2-->
    </div>
    <!-- /main-->
    <div class="footer1">
        © Hello 2017！专属于你的备忘录 &nbsp;&nbsp;||&nbsp;&nbsp;<a href="manaLogin.jsp">管理员</a>
    </div>
</div>
<!-- /page-->
<div class="footer2">
    &nbsp;
</div>

</body>
</html>
