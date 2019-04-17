<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/9
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>黔车网登录</title>
    <link href="css/login/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all"/>
    <link href="css/login/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/login/loginTest.js"></script>
</head>

<body>
<div id="bg-c">
    <div class="header">
        <h1 class="headerLogo"><a title="黔车网" target="_blank" href="#"><img alt="logo" src="img/login/test1.png"
                                                                            onmouseover="this.src='img/login/test2.png'"
                                                                            onmouseout="this.src='img/login/test1.png'"></a>
        </h1>
        <div class="headerNav">
            <a target="_blank" href="#">忘记密码</a>
            <a target="_blank" href="register.jsp">注册</a>
            <a target="_blank" href="#">开发团队</a>
            <a target="_blank" href="#">意见反馈</a>
            <a target="_blank" href="#">帮助</a>
        </div>
    </div>
</div>


<div class="banner">

    <div class="login-aside">
        <div id="o-box-up"></div>
        <div id="o-box-down" style="table-layout:fixed;">
            <div class="error-box">欢迎登陆黔车网</div>

            <form class="registerform" action="<%=basePath%>login" method="post" onsubmit="return checkAll()">
                <div class="fm-item">
                    <label for="userName" class="form-label">用户名：</label>
                    <input type="text" value="输入账号" maxlength="100" name="userName" id="userName" class="i-text"
                           onfocus="tipUsername()" onblur="checkUsername()">
                    <span class="ui-form-explain"></span>
                </div>

                <div class="fm-item">
                    <label for="userPwd" class="form-label">登陆密码：</label>
                    <input type="password" value="" maxlength="100" id="userPwd" name="userPwd" class="i-text"
                           onfocus="tipPassword()" onblur="checkPassword()">
                    <span class="ui-form-explain" id="back"></span>
                    <label for="send-btn" class="form-label">滑动验证</label>
                </div>

                <div class="drag">
                    <div class="bg"></div>
                    <div class="text" onselectstart="return false;">请拖动滑块解锁</div>
                    <div class="btn" onmouseover="hdYZ()">&gt;&gt;</div>
                </div>

                <div class="fm-item">
                    <label for="send-btn" class="form-label"></label>
                    <input type="submit" value="" tabindex="4" id="send-btn" class="btn-login">
                    <div class="ui-form-explain"></div>
                </div>

            </form>

        </div>

    </div>

    <div class="bd">
        <ul>
            <li style="background:url(img/login/bg.jpg) #CCE1F3 center 0 no-repeat;"><a target="_blank" href="#"></a>
            </li>
            <li style="background:url(img/login/bg.jpg) #BCE0FF center 0 no-repeat;"><a target="_blank" href="#"></a>
            </li>
        </ul>
    </div>
</div>

<div class="banner-shadow"></div>

<div class="footer">
    <p>一个专属大学生的二手车交易网站----|黔车网| @ ljq & ypx</p>
</div>
</body>
</html>
