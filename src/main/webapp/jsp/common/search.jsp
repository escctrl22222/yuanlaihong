<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/22
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-12">
        <h1>站内搜索</h1>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <p>搜索</p>
        <input id="search" name="search" type="text"/>
        <button onclick="blogSearch($('#search').val())">搜索</button>
    </div>
</div>

<script>
    function blogSearch(searchStr) {
        location.href="blog/allArticle";
        $.ajax({
            type: "POST",
            url: "blog/search",
            data: {str: searchStr},
            dataType:"json",
            async: false,
            success: function (data) {
                var obj = exal(data.articles);
                $(obj).each(function (index) {
                    var article = obj[index];
                    $("#searchedArticle").append(
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
    }
</script>