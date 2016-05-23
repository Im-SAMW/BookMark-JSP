<%-- 
    Document   : list
    Created on : 2015-12-22, 12:48:06
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的书签</title>
        <style>
            td{font-size:1em;text-align:left}
            div{font-family:宋体}
            div.tree_1{width:95%;text-align:left;padding-top:3px;font-size:1em;padding-left:1.5em;cursor:hand;color:blue}
            div.tree_2{width:95%;padding-left:1.5em;font-size:1em}
            div.tree_3{width:100%;padding-left:1.5em;padding-top:3px}
            
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
        <script>
            <!--
            function line(obj) {//添加下划线
                obj.style.textDecoration='underline';
            }
            function delline(obj) {//取消下划线
                obj.style.textDecoration='none';
            }
            function showtree(str) {//展开|关闭子分支
                var eval1="span_"+str+".innerHTML=span_"+str+".innerHTML=='+'?'-':'+'";
                var eval2=str+"_value.style.display="+str+"_value.style.display=='none'?'':'none'";
                eval(eval1);
                eval(eval2);
            }
            -->
        </script>
    </head>
    <body  style="text-align: center;background-color: #cccccc">
        <c:set var="flag" value="true" />
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
            <a href="SearchClass.do">添加书签</a>&nbsp;&nbsp;
            <a href="InvalidateSession.do">退出登录</a>&nbsp;&nbsp;
        </div>
        <div class=tree_3>
            <div class=tree_2>
            <table style="width: 100%" border="1" cellspacing="0" >
                <tr>
                    <th style="width: 25%">书签名称</th>
                    <th>书签地址</th>
                    <th style="width: 10em">操作</th>
                </tr>
            </table>
            </div>
        </div>
        <table style="width: 100%" border="0" cellspacing="0" >
            <tr><td style="width:100%">
            <c:forEach items="${list}" var="temp">
                <c:choose>
                <c:when test="${temp.getBid() == 0}" >
                    <c:choose>
                    <c:when test="{$flag == 'true'}">
                        <c:set var="flag" value="false" />
                    </c:when>
                    <c:otherwise>
                        </div>
                    </c:otherwise>
                    </c:choose>
                    <div class=tree_1  onmouseover="line(this)" onMouseOut="delline(this)" onClick="showtree('${temp.getBclass()}')">
                    ${temp.getBclass()}
                    <span id="span_${temp.getBclass()}" style="color:gray">+</span>
                    </div>
                    <div id="${temp.getBclass()}_value" class=tree_2 style="display:none">
                </c:when>
                <c:otherwise>
                    <div class=tree_3>
                        <table style="width: 100%" border="1" cellspacing="0" >
                            <tr>
                                <td style="width: 25%">${temp.getBname()}</td>
                                <td><a href="http://${temp.getBurl()}" target="_blank">${temp.getBurl()}</a></td>
                                <td style="width: 10em">
                                    <a href="ShowEditBookMark.do?bid=${temp.getBid()}">编辑</a>&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;<a href="DelBookMark.do?bid=${temp.getBid()}">删除</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:otherwise>
                </c:choose>
            </c:forEach> 
                        </div>
            </td></tr>
        </table>
    </body>
</html>
