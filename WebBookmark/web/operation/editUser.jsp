<%-- 
    Document   : editUser
    Created on : 2015-12-25, 22:23:46
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
        <br /><br /><br /><br />
        <h2 style="text-indent: -6.5em">编辑用户</h2>
        <c:forEach items="${list}" var="temp" >
        <form name="info" action="EditUser.do?uid=${temp.getUid()}" method="post">
            <table align=center>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="uname" maxlength="16" style="width: 150px" value="${temp.getUname()}" /></td>
                    <td class="error"><span id="error1"></span></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="pass" name="upass" maxlength="16" style="width: 150px" value="${temp.getUpass()}" /></td>
                    <td class="error"><span id="error2"></span></td>
                </tr>
                <tr>
                    <td>电子邮箱：</td>
                    <td><input type="text" name="uemail" maxlength="20" style="width: 150px" value="${temp.getUemail()}" /></td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td colspan="2"><br />
                        <input type="button" value="添加" onclick="checkForm()" style="width: 6em"/>&nbsp;
                        <input type="reset" value="重置" style="width: 6em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
        </c:forEach>
        <script language="javascript">
            function checkForm(){
                flag = 1;
                document.getElementById("error1").innerHTML = "";
                document.getElementById("error2").innerHTML = "";
                if(document.info.upass.value == "") {
                    document.getElementById("error2").innerHTML = "* 密码不能为空!";
                    document.info.upass.focus();
                    flag = 0;
                }
                if(document.info.uname.value == "") {
                    document.getElementById("error1").innerHTML = "* 用户名不能为空!";
                    document.info.uname.focus();
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
