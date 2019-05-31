<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/6
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>晓来红</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">晓来红</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">学习日记</a></li>
            <li class="layui-nav-item"><a href="">我的频道</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a id="userLoginLink" href="#" onclick="userLogin()">登录</a></li>
<%--            <li class="layui-nav-item"><a href="user/loginSurface">登录</a></li>--%>
            <li class="layui-nav-item">
                <a id="userName" href="user/info">
                    <img id="profilePhoto" class="layui-nav-img" style="display: none">
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <select id="userStatus" onchange="updateUserStatus(this.value)">
                    <option value="0"></option>
                    <option value="1">在线</option>
                    <option value="2">隐身</option>
                    <option value="3">忙碌</option>
                    <option value="4">暂离</option>
                    <option value="5">离线</option>
                </select></li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<%-- 用户登录弹窗用 --%>
<div id="formUserLogin" style="display: none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input class="layui-input" name="userName" type="text" value=""
                       lay-verify="required" placeholder="请输入账号" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input class="layui-input" name="password" type="text" value=""
                       lay-verify="required" placeholder="请输入密码" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitUserLogin">确认</button>
                <button class="layui-btn">返回</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    //JavaScript代码区域
    /* 设置用户昵称 */
    if(undefined != getRequest().userId){
        $.ajax({
            type : "POST",
            url : "user/findInfo",
            data : {userId : getRequest().userId},
            dataType: "json",
            cache: false,
            success : function (data) {
                var userName = document.getElementById("userName");
                var str = "<img id='profilePhoto' class='layui-nav-img' src='static/images/profilePhoto/" +
                    data.userInfo.profilePhoto + ".jpg'>" + " " +
                    data.userInfo.name;
                userName.innerHTML = str;
                userName.href = "user/info?userId=" + getRequest().userId;
            }
        })
    }

    /* 设置登录状态 */
    if(undefined != getRequest().userId){
        $("#userStatus").show();
        $("#userStatus").val("1");
        $("#userLoginLink").hide();
    }
    else {
        $("#userStatus").hide();
        $("#userLoginLink").show();
    }

    //监听提交
    layui.use('form', function () {
        var form = layui.form;
        $ = layui.jquery;

        form.on('submit(submitUserLogin)', function (user) {
            $.ajax({
                type: "POST",
                url: "user/login",
                data: {userName : user.field.userName, password : user.field.password},
                dataType: "json",
                success: function (data) {
                    location.href="mainpage?userId=" + data.userId;
                }
            });
            return false;
        })
    })
</script>

<script type="text/javascript">
    /**
     * 更新用户状态
     * @param status
     */
    function updateUserStatus(status) {
        var userId = getRequest().userId;
        $.ajax({
            type : "POST",
            url : "user/updateStatus",
            data : {loginStatus : status, userId : userId},
            dataType : "json",
            cache : false,
            success : function (data) {
                if ("5" == data.loginStatus) {
                    location.href="mainpage"
                }
                else {
                    document.getElementById("userStatus").style.display="";
                    document.getElementById("userLoginLink").style.display="none";
                }
            }
        })
    }

    /**
     * 用户登录弹窗事件
     */
    function userLogin() {
        layui.use("layer", function () {
            var layer = layui.layer;
            layer.open({
                type : 1,
                title : "用户登录",
                //content : myForm,
                content : $("#formUserLogin"),
                success : function () {
                },
                yes:function(){
                }
            });
        })
    }
</script>
</body>
</html>
