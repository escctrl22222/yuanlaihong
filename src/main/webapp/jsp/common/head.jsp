<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/22
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>董晓韩霖个人博客</title>
<script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/myUtil.js"></script>
<%--<script type="text/javascript" src="static/layui/layui.js"></script>--%>
<%--<link rel="stylesheet" href="static/layui/css/layui.css" media="all">--%>

<%--<script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">--%>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="static/css/index.css?d=datetime.now">



