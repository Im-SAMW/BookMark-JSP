<%-- 
    Document   : registersuccess
    Created on : 2015-12-22, 19:44:54
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册成功</title>
        <script type="text/javascript">
            window.setTimeout("window.location='../List.do'",3000);
        </script>
    </head>
    <body style="text-align: center;background-color: #cccccc">
        <br /><br /><br /><br /><br /><br /><br /><br />
        <h2>注册成功，${sessionScope.user},你好！3秒后自动跳转到我的书签...</h2>
        <a href="../List.do">如果没有跳转，请点击这里...</a>
    </body>
</html>
