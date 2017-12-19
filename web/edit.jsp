<%@ page import="tools.RebDao" %>
<%@ page import="Entities.Reb" %><%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/20
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑备忘录</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/editJS.js"></script>
</head>
<body>
<jsp:useBean id="user" class="Entities.User" scope="session"></jsp:useBean>
<%
    if(request.getParameter("select")!=null){
        int rebID = Integer.parseInt(request.getParameter("select").toString());
        RebDao rebDao = new RebDao();
        Reb reb = rebDao.getOneReb(rebID);
        session.setAttribute("reb",reb);

%>
<div class="page">
    <h3 class="header"><a href="Remembrance.jsp" title="Home">我的备忘录~~<span></span></a></h3>
    <ul class="topmenu">
        <li><a href="Remembrance.jsp">我的备忘录</a></li>
    </ul>
    <div class="main">
        <h3>用户信息</h3>
        <div class="userInfo">
            <table>
                <tr>
                    <td id="username">${user.username}</td>
                    <%
                        String sex = null;
                        if (user.getSex().equals("女"))
                            sex = "女士";
                        else
                            sex = "先生";
                    %>
                    <td><%=sex%>&nbsp;&nbsp;&nbsp;</td>
                    <td colspan="2"><a id="exit" href="exit.do">注销</a></td>
                </tr>


            </table>
        </div>
        <h3>Edit</h3>
        <div class="greybox2" style="height: 300px">
            <div class="right" style="height: auto">
                <form action="">
                    <input type="hidden" value="0" name="select" id="select">
                    <table>
                        <tr>
                            <td>
                                No：${sessionScope.reb.rebID}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                comment：
                                <textarea name="newReb" id="newReb" >${sessionScope.reb.content}</textarea>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="mod" type="button" value="修改" onclick="this.form.select.value='${sessionScope.reb.rebID}'">
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
<%
    }else {
        response.sendRedirect("Remembrance.jsp");
    }
%>
</body>
</html>
