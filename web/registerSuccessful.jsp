<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/9
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
    if (sessionUserName == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <title>黔车网注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
    <link rel="stylesheet" href="<%=basePath%>/css/register/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/register/style.css">
    <style type="text/css">
        #div1 {
            position: absolute;
            right: 20%;
        }
    </style>
</head>

<body>

<div class="header">
    <div class="container">
        <div class="row">
            <div class="logo span4">
                <h1><a href="">黔车网注册 <span class="red">.</span></a></h1>
            </div>
            <div id="div1">
                <img src="<%=basePath%>/img/register/label.png" height="105" width="181"/>
            </div>
        </div>
    </div>
</div>

<div class="register-container container">
    <div class="row">
        <div align="center">
            <h1 style="color: yellow">注册成功！</h1>
            <a href="login.jsp"><h2>登录</h2></a>
        </div>
    </div>
    <div align="center">
        <h3 style="color: red">
            |黔车网|&emsp;一个属于大学生的二手车网
        </h3>
    </div>
</div>

<!-- Javascript -->
<script src="<%=basePath%>/js/register/jquery-1.8.2.min.js"></script>
<script src="<%=basePath%>/js/register/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/register/jquery.backstretch.min.js"></script>
<script src="<%=basePath%>/js/register/scripts.js"></script>

</body>
</html>
