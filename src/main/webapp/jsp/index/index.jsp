<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/22
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 column">
                <jsp:include page="../common/header.jsp"/>
            </div>
        </div>
        <div class="row" style="margin:20px 0 10px"> <%-- style中的margin设置外边距，此处为设置外边距为上20左右0下10 --%>
            <div class="col-md-8 column">
                <div class="row">
                    <div class="col-md-12">
                        <jsp:include page="../common/carousel.jsp"/>
                    </div>
                </div>
                <div class="row">
                    <jsp:include page="../blog/article.jsp"/>
                </div>
            </div>
            <div class="col-md-4 column">
                <div class="row">
                    <div class="col-md-12 column pull-right">
                        <jsp:include page="../common/search.jsp"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 column pull-right">
                        <jsp:include page="../common/userLogin.jsp"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 column pull-right">
                        <jsp:include page="../common/followMe.jsp"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>
