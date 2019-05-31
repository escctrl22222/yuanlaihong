<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/19
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html>
<head>
    <title>晓来红</title>
    <meta charset="UTF-8">
</head>
<body>
    <div class="container">
    <%--    首行    --%>
        <div class="row">
            <div class="column pull-left">
                <p>欢迎来到晓来红</p>
            </div>
            <div id="divLogin" class="column pull-right">
                <ul class="list-inline right">
                    <li><a href="###" data-toggle="modal" data-target="#windowUserLogin">登录</a></li>
                    <li><a href="user/regist">注册</a></li>
                </ul>
            </div>
            <div id="divLoginSuccess" class="column pull-right">
                <a id="" href="###">
                    <img class="img-circle"/>
                </a>
            </div>
        </div>
        <%-- 分割线 --%>
        <div class="row">
            <div class="column">
                <hr class="simple" color="#000000" />
            </div>
        </div>

        <%-- 导航栏 --%>
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">晓来红</a>
                        </div>
                        <div>
                            <ul class="nav navbar-nav nav-tabs">
                                <li class="active">
                                    <a href="#mainpage" data-toggle="tab">首页</a>
                                </li>
                                <li>
                                    <a href="#diary" data-toggle="tab">学习日记</a>
                                </li>
                                <li>
                                    <a href="#">我的频道</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <%-- 标签页面板区 --%>
        <div class="row">
            <div class="col-12">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="mainpage">
                        <p>欢迎来到主页</p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="diary">
                        <ul class="list-inline">
                            <li><a href="###">JAVA</a></li>
                            <li><a href="###">PLSQL</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>




<%--    <div class="tab-container">--%>
<%--        <div id="diary1" class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-10 col-md-offset-2">--%>
<%--                    <ul class="list-inline">--%>
<%--                        <li><a href="###">JAVA</a></li>--%>
<%--                        <li><a href="###">PLSQL</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row">--%>
<%--                <div class="col-md-2 column">--%>
<%--                    <ul>--%>
<%--                        <li><a href="###">2019-05-18</a></li>--%>
<%--                        <li><a href="###">2019-05-19</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="col-md-10 column">--%>
<%--                    <iframe src="record/escctrl22222/article_2.html"></iframe>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <%-- 用户登录弹窗用 --%>
    <div class="modal fade" id="windowUserLogin" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">登录</h4>
                </div>
                <form id="formUserLogin" role="form">
                    <div class="modal-body form-group">
                        <label class="col-sm-2">用户名</label>
                        <div class="col-sm-10">
                            <input id="userName" class="form-control" name="userName" type="text"
                                   placeholder="请输入用户名"/>
                        </div>
                        <label class="col-sm-2">密码</label>
                        <div class="col-sm-10 ">
                            <input id="password" class="form-control" name="password" type="password"
                                   placeholder="请输入密码"/>
                        </div>
                    </div>

                    <div class="modal-footer form-group">
                        <button class="btn btn-primary" type="button" onclick="userLogin()">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        /**
         * 得到用户详细信息
         * @param userId
         */
        function getUserInfo(userId) {
            var userInfo;
            if(userId != null) {
                $.ajax({
                    type : "POST",
                    url : "user/findInfo",
                    data : {userId : userId},
                    dataType: "json",
                    cache: false,
                    async: false,
                    success : function (data) {
                        userInfo = data.userInfo;
                    }
                })
            }
            return userInfo;
        }

        function userLogin() {
            var loginDate = $("#formUserLogin").serialize();
            $.ajax({
                type: "POST",
                url: "user/login",
                data: loginDate,
                dataType: "json",
                success: function (data) {
                    if(data.userId != null){
                        var userInfo = getUserInfo(data.userId);
                        var str = "<img class='img-circle' src='static/images/profilePhoto/" +
                            userInfo.profilePhoto + ".jpg'>" + " " +
                            userInfo.name;

                        $("#divLogin").hide();
                        $("#divLoginSuccess").innerHTML=str;
                        $("#divLoginSuccess").show();
                        $("#windowUserLogin").modal("hide");

                    }
                }
            });
        }
    </script>
</body>
</html>
