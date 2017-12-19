<%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/21
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script language="javascript" src="js/manaJS.js"></script>
</head>
<body>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
    </ul>
    <div class="main">


        <div class="greybox2" style="height: auto;height: 280px">
            <h3>管理员登录</h3>
            <div class="right">
                <form action="#" method="post" id="manalogForm">
                    <table id="manalogin">
                        <tr>
                            <td>管理员：</td>
                            <td>
                                <input type="text" name="username" id="username">
                            </td>
                        </tr>
                        <tr>
                            <td>密码：</td>
                            <td>
                                <input type="password" name="password" id="password">
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" value="登录" id="send" onclick="checkLog()">
                                <input type="reset" value="重置">
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
