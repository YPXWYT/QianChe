<%@ page import="com.Entity.User" %><%--<jsp:useBean id="user" scope="session" type="com.Control.ShowUserServlet"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/12
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
    User user;
    user = (User) request.getAttribute("user");
//    if (sessionUserName==null){
//        request.getRequestDispatcher("login.jsp").forward(request,response);
//    }
%>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/personal/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<div class="wrap">
    <div class="header-right">
        <div class="logo">
            <a href="index.jsp"><img src="img/personal/logo4.PNG" alt=""/> </a>
        </div>
        <div class="menu">
            <ul class="nav">
                <li class="active">
                    <form action="<%=basePath%>/ShowUser" method="post"><input type="submit" value="个人中心"
                                                                               id="personBtn"></form>
                </li>
                <li>
                    <form action="<%=basePath%>/ShowCollection" method="post"><input type="submit" value="我的收藏"
                                                                                     id="collectionBtn"></form>
                </li>
                <li>
                    <form action="<%=basePath%>/ShowCarSelf" method="post"><input type="submit" value="我的发布"
                                                                                  id="personUBtn"></form>
                </li>
                <li><a href="upload.jsp">我要发布</a></li>
                <li><a href="index.jsp">首页</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="header-left">
        <div class="main" style="margin-top: 0">

            <div class="content">

                <div class="artists">
                    <h2>个人信息</h2>
                    <div class="banner">
                        <a><img src="#" alt=""></a>
                    </div>
                    <p class="para-top">用户名：<span><%=user.getuName()%></span></p>
                    <p class="para-top">密码：<span id="userPwdSpan">******</span><input type="hidden"
                                                                                      value="<%=user.getPwd()%>"
                                                                                      id="userPwdYL"></p>
                    <p class="para-top">学校：<span id="userSchoolSpan"><%=user.getSchool()%></span></p>
                    <p class="para-top">手机号：<span id="phoneNumSpan"><%=user.getPhoneNum()%></span></p>
                    <p class="para-top">邮箱：<span id="EmailSpan"><%=user.getEmail()%></span></p>
                    <div class="readmore">
                        <a href="#">
                            <form action="#" method="post" onsubmit="return checkCommit()"><input type="submit"
                                                                                                  class="btn btn-3 btn-3e icon-arrow-right"
                                                                                                  value="修改"></form>
                        </a>
                    </div>
                </div>

                <div class="artists">
                </div>
            </div>
            <div class="sidebar">
                <div class="blog">
                    <h2>设置</h2>
                    <div class="blog-img">
                        <img src="img/personal/user.png" alt="">
                    </div>
                    <div class="blog-text">
                        <span>密码设置</span><br>
                        <a href="#" class="link4" id="modifyUserPwd">修改密码</a><br>
                        <span>学校设置</span><br>
                        <a href="#" class="link4" id="modifyUserSchool">修改学校</a><br>
                        <span class="color1">手机号设置</span><br>
                        <a href="#" class="color2" id="modifyPhoneNum">更换号码</a> / <a href="#"
                                                                                     class="color2">解绑号码</a><br>
                        <span class="link-top">邮箱设置</span><br>
                        <a href="#" class="color2" id="modifyEmail">更换邮箱</a><br>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="blog">
                    <div class="blog-img">
                    </div>
                    <div class="blog-text">
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="blog">
                    <div class="blog-img">
                    </div>
                    <div class="blog-text">
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="readmore">
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="footer-bg">
    <div class="wrap">
        <div class="f-main">
            <div class="f-icons">
            </div>
            <div class="f-grid">
                <h4></h4>
                <nav>
                    <ul>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                    </ul>
                </nav>
            </div>
            <div class="f-grid">
                <h4>联系我们</h4>
                <p></p>
                <a href="#">ypx</a>&nbsp;<span>cell</span>&nbsp;<a href="">137-655-******</a>
                <p></p>
                <a href="#">ljq</a>&nbsp;<span>cell</span>&nbsp;<a href="">135-542******</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="ftr-bg">
    <div class="wrap">
        <div class="footer">
            <p class="w3-link">一个专属大学生的二手车交易网站----|黔车网| @ ljq & ypx</p>
        </div>
    </div>
</div>

<script src="js/personal/personal.js"></script>
</body>
</html>
