<%@ page import="com.my.domain.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/24
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="article">
    <h1>最新文章</h1>
</div>
<script>
    $.ajax({
        type: "POST",
        url: "article/init",
        data: {},
        dataType: "json",
        cache: false,
        async: false,
        success: function (data) {/* 处理返回是LIST的JSON */
            var obj = eval(data.articles);
            $(obj).each(function (index) {
                var article = obj[index];
                $("#article").append(
                    "<div class=\"article\">\n" +
                    "    <div class=\"row\">\n" +
                    "        <div class=\"col-md-4\">\n" +
                    "                <img src=" + article.icon + "/>\n" +
                    "        </div>\n" +
                    "        <div class=\"col-md-8\">\n" +
                    "            <div class=\"row\">\n" +
                    "                    <a href=\"" + article.url + "\">" + article.title +　"</a>\n" +
                    "            </div>\n" +
                    "            <div class=\"row\">\n" +
                    "                    <p>" + article.summary + "</p>\n" +
                    "            </div>\n" +
                    "            <div class=\"row\">\n" +
                    "               <div class=\"col-sm-3\">\n" +
                    "                    <p><span class=\"glyphicon glyphicon-user\"></span>" + article.author + "</p>\n" +
                    "               </div>\n" +
                    "               <div class=\"col-sm-3\">\n" +
                    "                    <p><span class=\"glyphicon glyphicon-retweet\"></span>" + article.createDate + "</p>\n" +
                    "               </div>\n" +
                    "               <div class=\"col-sm-3\">\n" +
                    "                    <p><span class=\"glyphicon glyphicon-comment\"></span>评论(" + article.comment + ")</p>\n" +
                    "               </div>\n" +
                    "               <div class=\"col-sm-3\">\n" +
                    "                    <p><span class=\"glyphicon glyphicon-eye-open\"></span>浏览(" +article.browse + ")</p>\n" +
                    "               </div>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>"
                )
            })
        }
    })
</script>
