<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/6
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>晓来红</title>
    <meta charset="UTF-8" />
    <base href="<%=basePath%>">
    <script type="text/javascript" src="static/login/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>
<body background="static/login/images/background.jpg">
<h1>晓来红</h1>
<br>
<!--
<form action="user/login">
    帐户名：<input type="text" name="userName"><br>
    密码：<input type="text" name="password"><br>
    <input type="submit" name="login" value="登录">
</form>
-->
<div>
    帐户名：<input id="userName" type="text" name="userName"><br>
    密码：<input id="password" type="text" name="password"><br>
    <div>
        <button onclick="loginCheck()">登录</button>
        <button onclick="location.href='user/regist'">注册</button>
    </div>
</div>

<script type="text/javascript">
    // 服务器校验
    function loginCheck() {
        if (clientCheck()){
            var userName = $("#userName").val();
            var password = $("#password").val();
            $.ajax({
                type : "POST",
                url : "user/login",
                data : {userName : userName, password : password},
                dataType : "json",
                cache : false,
                success:function(data){
                    if("success" == data.result) {
                        window.location.href="mainpage?loginStatus=1&userId=" + data.userId;
                    }
                    else if ("userError" == data.result) {
                        $("#userName").tips({
                            side : 1,
                            msg : "用户名或密码错误",
                            bg : "#FF5080",
                            time : 15
                        });
                        $("#userName").focus();
                    }
                    else {
                        $("#userName").tips({
                            side : 1,
                            msg : "其他错误",
                            bg : "#FF5080",
                            time : 15
                        });
                        $("#userName").focus();
                    }
                }
            })
        }
    }

    // 客户端校验
    function clientCheck(){
        if ($("#userName").val() == "") {
            $("#userName").tips({
                side : 2,
                msg : '用户名不能为空',
                bg : "#AE81FF",
                time : 3
            });
            $("#userName").focus();
            return false;
        }
        if ($("#password").val() == "") {
            $("#password").tips({
                side : 2,
                msg : '密码不能为空',
                bg : "#AE81FF",
                time : 3
            });
            $("#password").focus();
            return false;
        }
        return true;
    }
</script>

</body>
</html>
