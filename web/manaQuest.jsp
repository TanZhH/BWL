<%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/22
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员的管理界面</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(
                function () {
                    if ($("#manaNAME").html() == "") {
                        alert("管理员尚未登录！！");
                        window.open("manaLogin.jsp", "_self");
                    }
                }
        )
    </script>
</head>
<body>
<jsp:useBean id="manager" class="Entities.Manager" scope="session"></jsp:useBean>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
    </ul>
    <div class="main">


        <div class="greybox2" style="height: auto;height: 280px">
            <form action="exit.do" method="post">
                欢迎你，<span id="manaNAME">${manager.manaNAME}</span>&nbsp;&nbsp;<input type="submit" value="注销">
            </form>

            <div class="right">
                <form action="manaAnswer.jsp" method="post">
                    <table>
                        <tr>
                            <td>
                                查询用户密码：<input type="text" name="find">
                            </td>
                            <td>
                                <input type="submit" value="查询">
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
