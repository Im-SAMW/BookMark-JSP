<%-- 
    Document   : login
    Created on : 2015-12-22, 12:54:44
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
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
        <h2 style="text-indent: -6.5em">用户登录</h2>
        <form name="info" action="User.do" method="post">
            <table align=center>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="uname" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="uname"></span></td>
                </tr>
                <tr>
                    <td>密<span style="color: #cccccc">—</span>码：</td>
                    <td><input type="password" name="upass" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="upass"></span></td>
                </tr>
                <tr>
                    <td colspan="2"><br />
                        <input type="button" value="登录" onclick="checkForm()" style="width: 6em"/>&nbsp;
                        <input type="reset" value="重置" style="width: 6em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="register.jsp">用户注册</a>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
        
        <script language="javascript">
            function checkForm(){
                flag = 1;
                document.getElementById("uname").innerHTML = "";
                document.getElementById("upass").innerHTML = "";
                if(document.info.upass.value == "") {
                    document.getElementById("upass").innerHTML = "请输入密码!";
                    document.info.upass.focus();
                    flag = 0;
                }
                if(document.info.uname.value == "") {
                    document.getElementById("uname").innerHTML = "请输入用户名!";
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
