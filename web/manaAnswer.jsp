<%@ page import="tools.ManaDao" %><%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/22
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员查询结果</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(
                function () {
                    if ($("#manaNAME").html() == "") {
                        alert("管理员尚未登录！！");
                        window.open("manaLogin.jsp", "_self");
                    }
                    $("#return").click(
                            function () {
                                window.open("manaQuest.jsp", "_self");
                            }
                    )
                }
        )
    </script>
</head>
<body>
<jsp:useBean id="manager" class="Entities.Manager" scope="session"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
    String find = request.getParameter("find");
    if (find != null) {
        ManaDao manaDao = new ManaDao();
        String pwd = manaDao.findPWD(find);
        if (pwd == null) {
            pwd = "用户不存在";
        }else
%>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
    </ul>
    <div class="main">


        <div class="greybox2" style="height: auto;height: 280px">
            <form action="exit.do" method="post">
                欢迎你，<span id="manaNAME">${manager.manaNAME}</span>&nbsp;&nbsp;<input type="submit" value="注销">
            </form>
            <div class="right">
                <table>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            查询username：<%=find %>
                        </td>
                    <tr>
                        <td>
                            结果:<%=pwd%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="返回查询页" id="return">
                        </td>
                    </tr>

                    </tr>
                </table>
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
<%

    } else {
        response.sendRedirect("manaQuest.jsp");
    }
%>
</body>
</html>
