<%-- 
    Document   : edit
    Created on : 2015-12-25, 11:53:21
    Author     : sam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> 编辑书签 </title>
        <style type="text/css">
            .error {
                text-align: left;
                color: #ff0000;
                width: 10em;
            }
        </style>
    </head>
    <body style="text-align: center;background-color: #cccccc">
        <br /><div style="text-align:left"><a href="List.do">返回书签列表</a></div>
        <br /><br /><br />
        <h2 style="text-indent: -6.5em">编辑书签</h2>
        <c:forEach items="${list}" var="temp" >
            <c:choose>
                <c:when test="${temp.getBid() != 0}">
        <form name="info" action="EditBookMark.do?bid=${temp.getBid()}" method="post">
            <table align=center>
                <tr>
                    <td>书签名称：</td>
                    <td><input type="text" name="bname" maxlength="50" style="width: 30em" value="${temp.getBname()}" /></td>
                    <td class="error"><span id="error1"></span></td>
                </tr>
                <tr>
                    <td>书签地址：</td>
                    <td><textarea name="burl" rows="5" style="width: 30em" >${temp.getBurl()}</textarea></td>
                    <td class="error"><span id="error2"></span></td>
                </tr>
                <tr>
                    <td>书签分类：</td>
                    <td>
                        <select name="bclass" size="1" style="width: 15em">
                </c:when>
                <c:when test="${temp.getBid() == 0}">
                            <option value="${temp.getBclass()}">${temp.getBclass()}</option>
                </c:when>
                            </c:choose>
        </c:forEach>
                            <option value="null" >新分类</option>
                        </select>
                        <input type="text" name="newbclass" value="添加新分类" style="width: 15em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td colspan="2"><br />
                        <input type="button" value="完成" onclick="checkForm()" style="width: 6em"/>&nbsp;
                        <input type="reset" value="重置" style="width: 6em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>

        <script language="javascript">
            function checkForm(){
                flag = 1;
                document.getElementById("error1").innerHTML = "";
                document.getElementById("error2").innerHTML = "";
                if(document.info.burl.value == "") {
                    document.getElementById("error2").innerHTML = "* 书签地址不能为空!";
                    document.info.burl.focus();
                    flag = 0;
                }
                if(document.info.bname.value == "") {
                    document.getElementById("error1").innerHTML = "* 书签名不能为空!";
                    document.info.bname.focus();
                    flag = 0;
                    return false;
                }
                if(flag == 1){
                    document.info.submit();
                }
            }
        </script>
    </body>
</html>
