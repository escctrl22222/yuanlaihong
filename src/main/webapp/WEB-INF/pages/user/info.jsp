<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/15
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详细信息</title>
    <script type="text/javascript" src="../static/login/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="../static/js/myUtil.js"></script>
    <script type="text/javascript" src="../static/layui/layui.js"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
    <br>
    昵称：<p id="name"></p>
    头像：<img id="profilePhoto"/>
    <a id="changeUserInfo">修改个人信息</a>
    <br>
    <div id="window-calendar">
        <input id="calendar" type="text"/>
    </div>

    <script type="text/javascript">
        $.ajax({
            type : "POST",
            url : "findInfo",
            data : {userId : getRequest().userId},
            dataType : "json",
            cache : false,
            success : function (data) {
                document.getElementById("name").innerHTML=data.userInfo.name;
                var prop = document.getElementById("profilePhoto");
                prop.src="../static/images/profilePhoto/" + data.userInfo.profilePhoto + ".jpg";
                prop.style.width="120px";
                prop.style.height="200px";
                document.getElementById("changeUserInfo").href="updateInfo?userId=" + getRequest().userId;
            }
        })
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#calendar' //指定元素
            });
        });
    </script>
</body>
</html>
