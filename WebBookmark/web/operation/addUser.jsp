<%-- 
    Document   : adminAddUser
    Created on : 2015-12-29, 15:53:21
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加用户</title>
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
        <h2 style="text-indent: -6.5em">添加用户</h2>
        <form name="info" action="../AddUser.do" method="post">
            <table align=center>
                <tr>
                    <td>用<span style="color: #cccccc">-</span>户<span style="color: #cccccc">-</span>名：</td>
                    <td><input type="text" name="uname" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="uname">*</span></td>
                </tr>
                <tr>
                    <td>密<span style="color: #cccccc">——</span>码：</td>
                    <td><input type="text" name="upass" value="123" maxlength="16" style="width: 150px" /></td>
                    <td class="error"><span id="upass">*</span></td>
                </tr>
                <tr>
                    <td>电子邮箱：</td>
                    <td><input type="text" name="uemail" maxlength="20" style="width: 150px" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="error">带“*”的为必填项</span><br /><br />
                        <input type="button" value="添加" onclick="checkForm()" style="width: 6em"/>&nbsp;
                        <input type="reset" value="重置" style="width: 6em" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
        
        <script language="javascript">
            function checkForm(){
                flag = 1;
                document.getElementById("uname").innerHTML = "*";
                document.getElementById("upass").innerHTML = "*";
                if(document.info.upass.value == "") {
                    document.getElementById("upass").innerHTML = "* 密码不能为空!";
                    document.info.upass.focus();
                    flag = 0;
                }
                if(document.info.uname.value == "") {
                    document.getElementById("uname").innerHTML = "* 用户名不能为空!";
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
