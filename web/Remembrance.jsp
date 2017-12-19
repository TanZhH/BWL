<%@ page import="tools.RebDao" %>
<%@ page import="Entities.Reb" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CWZZ
  Date: 2016/12/19
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>备忘录</title>
    <link rel="stylesheet" href="./stylesheets/screen.css" type="text/css" media="screen, projection"/>
    <script language="javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/RebJS.js"></script>
    <script type="text/javascript" src="js/pageJS.js"></script>
</head>
<body>
<jsp:useBean id="user" class="Entities.User" scope="session"></jsp:useBean>
<%
    RebDao rebDao = new RebDao();
    List<Reb> rebList = rebDao.getRebList(user.getUserID());

    //Reb reb1 = rebList.get(0);
    //out.println(reb1.getRebID()+","+reb1.getContent()+","+reb1.getCreateTime());
    session.setAttribute("rebList", rebList);
%>

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
    <div class="main" style="height:auto">
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
        <h3>Tips</h3>

        <form action="edit.jsp" method="post" id="RebForm">
            <input type="hidden" value="0" name="select" id="select">
            <input type="hidden" value="${user.userID}" name="userID" id="userID">
            <input type="hidden" value="<%=rebList.size()%>" name="total" id="total">
            <table>
                <c:forEach var="reb" items="${sessionScope.rebList}" varStatus="status">
                    <tr id="tr_${status.count}" style="display:none">
                        <td>
                            <div class="greybox2" style="height:auto;">
                                <div class="right" style="height:auto;">
                                    <table style="width: 350px">
                                        <tr>
                                            <td colspan="2">
                                                No：${status.count}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                comment：${reb.content}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                创建时间：${reb.createTime}<br>
                                                最近修改时间：${reb.lastModTime}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input class="del" type="button" value="× delete"
                                                       onclick="this.form.select.value='${reb.rebID}'">

                                            </td>
                                            <td>
                                                <input class="mod" type="submit" value="edit"
                                                       onclick="this.form.select.value='${reb.rebID}';">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="cleaner">
                                    &nbsp;
                                </div>
                            </div>
                            <!-- /greybox2-->
                        </td>
                    </tr>

                </c:forEach>
                <tr align="center">
                    <td>
                        添加新备忘录：
                        <textarea name="newReb" id="newReb" placeholder="Your Message to Us"></textarea>
                        <input type="button" value="添加" class="add">
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <input type="button" value="首页" id="first">
                        <input type="button" value="上一页" id="back">
                        <input type="button" value="下一页" id="next">
                        <input type="button" value="末页" id="last">
                        <input type="hidden" value="1" id="pageId">
                        第 <span id="pageSpan">1</span>页|共<span id="sumSpan"></span>页&nbsp;&nbsp;<%=rebList.size() %>条记录
                    </td>
                </tr>
            </table>

        </form>

    </div>
    <!-- /main-->
    <div class="cleaner" style="height: 20px">
        &nbsp;
    </div>
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
