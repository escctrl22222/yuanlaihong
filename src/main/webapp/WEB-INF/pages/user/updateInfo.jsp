<%--
  Created by IntelliJ IDEA.
  User: dongxiaohanlin
  Date: 2019/5/15
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <script type="text/javascript" src="../static/login/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="../static/js/myUtil.js"></script>
</head>
<body>
    <div id="photo" style="display: none">
        <table border="1">
            <tr>
                <td>
                    <img src="../static/images/profilePhoto/AAA.jpg" width="60" height="100"
                         onclick="changeProfilePhoto(filenameSplit(this.src))"/>
                </td>
                <td>
                    <img src="../static/images/profilePhoto/BBB.jpg" width="60" height="100"
                         onclick="changeProfilePhoto(filenameSplit(this.src))"/>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="../static/images/profilePhoto/CCC.jpg" width="60" height="100"
                         onclick="changeProfilePhoto(filenameSplit(this.src))"/>
                </td>
            </tr>
        </table>
    </div>
    昵称：<input id="name" type="text"/><br>
    头像：<img id="profilePhoto"/><br>
    <button id="changeProfilePhoto" onclick="javascript:document.getElementById('photo').style.display=''">更换头像</button>
    <button id="submit" onclick="submitUserInfo()">确定修改</button>
    
    <script type="text/javascript">
        $.ajax({
            type : "POST",
            url : "findInfo",
            data : {userId : getRequest().userId},
            dataType : "json",
            cache : false,
            success : function (data) {
                document.getElementById("name").value = data.userInfo.name;
                var prop = document.getElementById("profilePhoto");
                prop.src = "../static/images/profilePhoto/" + data.userInfo.profilePhoto + ".jpg";
                prop.style.width="120px";
                prop.style.height = "200px";
            }
        })
        loadCalendar()
    </script>

    <%-- 更改头像 --%>
    <script type="text/javascript">
        function changeProfilePhoto(photo) {
            var prop = document.getElementById("profilePhoto");
            prop.src = "../static/images/profilePhoto/" + photo + ".jpg";
            prop.style.width = "120px";
            prop.style.height = "200px";
            document.getElementById("photo").style.display = "none";
        }

        /* 取出链接文件的文件名
        *  例如 ...user/img/myimg.jpg 返回myimg
        *  */
        function filenameSplit(str) {
            var dest = "";
            strs = str.split('/');
            dest = strs[strs.length-1];
            strs = dest.split('.');
            dest = strs[strs.length-2];
            return dest;
        }
        
        function submitUserInfo() {
            var userId = getRequest().userId;
            var name = document.getElementById("name").value;
            var profilePhoto = filenameSplit(document.getElementById("profilePhoto").src);
            $.ajax({
                type: "POST",
                url: "submitUserInfo",
                data: {userId : userId, name : name, profilePhoto : profilePhoto},
                dataType: "json",
                cache:false
            })
        }
    </script>
</body>
</html>
