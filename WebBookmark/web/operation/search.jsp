<%-- 
    Document   : search
    Created on : 2015-12-29, 23:44:03
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的书签</title>
        <style>
            table{
                table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
            }
            td{
                word-break:keep-all;/* 不换行 */
                white-space:nowrap;/* 不换行 */
                overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
                text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
            }
        </style>
    </head>
    <body  style="text-align: center;background-color: #cccccc">
        <div>
            <table style="width:100%"><tr>
                <td style="width:45%;text-align:left">
                    <span style="font-size:2em;text-indent:1em">${sessionScope.user}的书签</span>
                </td>
                <td style="width:55%;text-align: right">
                    <span>
                        <form action="SearchBookMark.do" method="get">
                        <input type="text" name="search" />
                        <input type="submit" value="搜&nbsp;索" />
                        </form>
                    </span>
                </td>
            </tr></table>
        </div>
        <div style="text-align: right">
            ${sessionScope.user}&nbsp;&nbsp;
            <a href="List.do">全部书签</a>&nbsp;&nbsp;
            <a href="SearchClass.do">添加书签</a>&nbsp;&nbsp;
            <a href="InvalidateSession.do">退出登录</a>&nbsp;&nbsp;
        </div>
            
            
            <table style="width: 100%" border="1" cellspacing="0" >
                <tr>
                    <th style="width: 25%">书签名称</th>
                    <th>书签地址</th>
                    <th style="width: 6em">分类</th>
                    <th style="width: 10em">操作</th>
                </tr>
                <c:forEach items="${list}" var="temp">
                <tr>
                    <td>${temp.getBname()}</td>
                    <td><a href="http://${temp.getBurl()}" target="_blank">${temp.getBurl()}</a></td>
                    <td>${temp.getBclass()}</td>
                    <td>
                        <a href="ShowEditBookMark.do?bid=${temp.getBid()}">编辑</a>&nbsp;
                        &nbsp;<a href="DelBookMark.do?bid=${temp.getBid()}">删除</a>
                    </td>
                </tr>
                </c:forEach>
            </table>
    </body>
</html>
