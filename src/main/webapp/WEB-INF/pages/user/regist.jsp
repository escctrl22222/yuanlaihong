<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/6
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新用户注册</title>
    <meta charset="UTF-8" />
    <script type="text/javascript" src="../static/login/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.tips.js"></script>
</head>
<body>
<br>
<br>
<br>
<br>
<div>
    帐户名：<input id="userName" type="text" name="userName"><br>
    密码：<input id="password" type="password" name="password"><br>
    再次输入密码：<input id="rePassword" type="password" name="rePassword"><br>
    邮箱：<input id="email" type="text" name="email"><br>
    <div>
        <button onclick="registCheck()">注册</button>
    </div>
</div>

    <script type="text/javascript">
        // 服务器校验
        function registCheck() {
            if (clientCheck()){
                var userName = $("#userName").val();
                var password = $("#password").val();
                var email = $("#email").val();
                $.ajax({
                    type : "POST",
                    url : "insert",
                    data : {userName : userName, password : password, email : email},
                    dataType : "json",
                    cache : false,
                    success:function(data){
                        if("success" == data.result) {
                            alert("注册成功");
                            window.location.href="success";
                        }
                        else if ("userError" == data.result) {
                            $("#userName").tips({
                                side : 1,
                                msg : "用户名已被注册",
                                bg : "#FF5080",
                                time : 15
                            });
                            $("#userName").focus();
                        }
                        else if ("emailError" == data.result) {
                            $("#email").tips({
                                side : 1,
                                msg : "邮箱已被注册",
                                bg : "#FF5080",
                                time : 15
                            });
                            $("#email").focus();
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
            if ($("#rePassword").val() == "") {
                $("#rePassword").tips({
                    side :2,
                    msg : '密码验证不能为空',
                    bg : "#AE81FF",
                    time : 3
                });
            }
            if($("#email").val() == "") {
                $("#email").tips({
                    side : 2,
                    msg : '邮箱不能为空',
                    bg : "#AE81FF",
                    time : 3
                });
            }
            if ($("#password").val() != $("#rePassword").val()) {
                $("#rePassword").tips({
                    side : 2,
                    msg : '两次输入密码不相同，请重新输入',
                    bg : "#AE81FF",
                    time : 3
                });
            }
            return true;
        }
    </script>
</body>
</html>
