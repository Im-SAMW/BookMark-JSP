<%-- 
    Document   : success
    Created on : 2015-12-22, 12:46:42
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录成功</title>
        <script type="text/javascript">
            window.setTimeout("window.location='../List.do'",3000);
        </script>
    </head>
    <body style="text-align: center;background-color: #cccccc">
        <br /><br /><br /><br /><br /><br /><br /><br />
        <h1>登录成功，${sessionScope.user},你好！3秒后自动跳转到我的书签...</h1>
        <a href="../List.do">如果没有跳转，请点击这里...</a>
    </body>
</html>
