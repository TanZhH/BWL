<%@ page import="Entities.User" %><%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/11/26
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示页面</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
</head>
<body>

<%
    String info = (String) request.getAttribute("info");
    if(info == null){
        response.sendRedirect("login.jsp");
    }
%>
    <div class="page">
        <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
        <ul class="topmenu">
            <li><a href="Remembrance.jsp">我的备忘录</a></li>
        </ul>
        <div class="main">


            <div class="greybox2" style="height: auto;height: 280px">
                <h1>${info}</h1>
                <div class="right">
                    <a href="login.jsp">去登录</a>
                    <br/>
                    <a href="reg.jsp">去注册</a>
                    <br/>
                    <a href="Remembrance.jsp">去备忘录</a>
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
