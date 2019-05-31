<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/22
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-12">
        <h1>用户中心</h1>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <form>
            <label for="userName">用户名</label>
            <input id="userName" name="userName" type="text"/>
            <br>
            <label for="password">密码  </label>
            <input id="password" name="password" type="password"/>
            <br>
            <input type="submit" value="登录|注册">
        </form>
        <p>用户名支持字母、数字和下划线组合</p>
    </div>
</div>