<%-- 
    Document   : admin
    Created on : 2015-12-25, 18:17:38
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  style="text-align: center;background-color: #cccccc">
        <h2 style="text-align: left;text-indent:1em">用户管理</h2>
        <div style="text-align: right">
            ${sessionScope.user}&nbsp;&nbsp;
            <a href="operation/addUser.jsp">添加用户</a>&nbsp;&nbsp;
            <a href="InvalidateSession.do">退出登录</a>&nbsp;&nbsp;
        </div>
        <table style="width: 100%" border="1" cellspacing="0" >
            <tr>
                <th style="width: 25%">用户名</th>
                <th style="width: 25%">密码</th>
                <th>电子邮箱</th>
                <th style="width: 10em">操作</th>
            </tr>
            <c:forEach items="${list}" var="temp">
                    <tr>
                        <td>${temp.getUname()}</td>
                        <td>${temp.getUpass()}</td>
                        <td>${temp.getUemail()}</td>
                        <td>
                            <a href="ShowEditUser.do?uid=${temp.getUid()}">编辑</a>&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;<a href="DelUser.do?uid=${temp.getUid()}">删除</a>
                        </td>
                    </tr>
            </c:forEach> 
        </table>
    </body>
</html>
