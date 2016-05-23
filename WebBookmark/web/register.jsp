<%-- 
    Document   : register
    Created on : 2015-12-22, 18:38:21
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册</title>
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
        <h2 style="text-indent: -6.5em">用户注册</h2>
        <form name="info" action="Register.do" method="post">
            <table align=center>
                <tr>
                    <td>用<span style="color: #cccccc">-</span>户<span style="color: #cccccc">-</span>名：</td>
                    <td><input type="text" name="uname" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="reguname">*</span></td>
                </tr>
                <tr>
                    <td>密<span style="color: #cccccc">——</span>码：</td>
                    <td><input type="password" name="upass1" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="regupass1">*</span></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" name="upass2" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="regupass2">*</span></td>
                </tr>
                <tr>
                    <td>电子邮箱：</td>
                    <td><input type="text" name="uemail" maxlength="20" style="width: 150px" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="error">带“*”的为必填项</span><br /><br />
                        <input type="button" value="注册" onclick="checkForm()" style="width: 6em"/>&nbsp;
                        <input type="reset" value="重置" style="width: 6em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="login.jsp">已有帐号，登录</a>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
        
        <script language="javascript">
            function checkForm(){
                flag = 1;
                document.getElementById("reguname").innerHTML = "*";
                document.getElementById("regupass1").innerHTML = "*";
                document.getElementById("regupass2").innerHTML = "*";
                if(document.info.upass1.value == "") {
                    document.getElementById("regupass1").innerHTML = "* 密码不能为空!";
                    document.info.upass1.focus();
                    flag = 0;
                }
                if(document.info.uname.value == "") {
                    document.getElementById("reguname").innerHTML = "* 用户名不能为空!";
                    document.info.uname.focus();
                    flag = 0;
                    return false;
                }
                if(document.info.upass1.value != document.info.upass2.value) {
                    document.getElementById("regupass2").innerHTML = "* 两次密码不同!";
                    document.info.upass1.value = "";
                    document.info.upass2.value = "";
                    document.info.upass1.focus();
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
