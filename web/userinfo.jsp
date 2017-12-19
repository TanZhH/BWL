<%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/22
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script language="javascript" src="js/infoJS.js"></script>
</head>
<body>
<jsp:useBean id="user" class="Entities.User" scope="session"></jsp:useBean>
<%
    String sex = null;
    if(user.getSex() != null) {
        if (user.getSex().equals("女"))
            sex = "女士";
        else
            sex = "先生";
    }
%>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
        <li><a href="userinfo.jsp">个人信息</a></li>
    </ul>
    <div class="main">
        <h3>用户信息</h3>
        <div class="userInfo">
            <table>
                <tr>
                    <td id="username">${user.username}</td>
                    <td><%=sex%>&nbsp;&nbsp;&nbsp;</td>
                    <td colspan="2"><a id="exit" href="exit.do">注销</a></td>
                </tr>
            </table>
        </div>
        <h3>您的个人信息</h3>
        <div class="greybox2" style="height: auto;height: 240px">

            <div class="right">
                    <table>
                        <tr>
                            <td>用户名：</td>
                            <td>
                                ${user.username}
                            </td>
                        </tr>
                        <tr>
                            <td>密码：</td>
                            <td>
                                ${user.password}
                            </td>

                        </tr>
                        <tr>
                            <td>性别</td>
                            <td>
                                ${user.sex}
                            </td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td>
                                ${user.email}
                            </td>
                        </tr>

                    </table>
            </div>
            <div class="cleaner">
                &nbsp;
            </div>
        </div>
        <h3>信息修改</h3>
        <div class="greybox2" style="height: auto;height: 240px">
            <div class="right">
                <form action="" id="infoForm">
                    <input type="hidden" value="${user.userID}" name="userID" id="userID">
                    <table>
                        <tr>
                            <td colspan="2">
                                用户名和Email注册后不允许修改.
                            </td>
                        </tr>

                        <tr>
                            <td>密码：</td>
                            <td>
                                <input type="text" id="rePassword">&nbsp;&nbsp;<input type="button" value="修改" id="reP">
                            </td>

                        </tr>
                        <tr>
                            <td>性别</td>
                            <td>
                                <input type="radio" name="reSex" value="男">男
                                <input type="radio" name="reSex" value="女">女&nbsp;&nbsp;
                                <input type="button" value="修改" id="reS">
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
