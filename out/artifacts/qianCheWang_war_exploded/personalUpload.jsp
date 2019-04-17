<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/12
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
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
            <a href="index.jsp"><img src="img/personal/logo4.PNG" alt="logo"/> </a>
        </div>
        <div class="menu">
            <ul class="nav">
                <li>
                    <form action="<%=basePath%>/ShowUser" method="post"><input type="submit" value="个人中心"
                                                                               id="personBtn"></form>
                </li>
                <li>
                    <form action="<%=basePath%>/ShowCollection" method="post"><input type="submit" value="我的收藏"
                                                                                     id="collectionBtn"></form>
                </li>
                <li class="active">
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

            <div class="blog">

                <div class="grid">
                    <h4><a>我的发布</a></h4>
                    <c:forEach items="${carList}" var="car">
                        <form method="post" action="<%=basePath%>/DeleteSelfCarServlet">
                            <div class="blog-para">
                                <p>
                                    <a rel="lightbox">
                                        <div class="box-img">
                                            <img src="imgs/<c:out value="${car.imgs}"/> " alt="我的发布">
                                        </div>
                                    </a>
                                <div class="box-img-form">
                                </p>
                                车品牌：<p>${car.kind}</p>
                                发布定价：<p>${car.price}</p>
                                发布时间: <p>${car.releaseTime}</p>
                                使用时间： <p>${car.useTime}个月</p>
                                我的描述：<textarea readonly style="width: 320px;height: 50px">${car.describes}</textarea>
                                </p>
                                <input type="hidden" value="${car.imgs}" name="img">
                                <div class="readmore">
                                    <input type="submit" class="btn btn-3 btn-3e icon-arrow-right" value="修改"
                                           formaction="<%=basePath%>/ShowAlterUpload">
                                    <a href="#"><input type="submit" class="btn btn-3 btn-3e icon-arrow-right"
                                                       value="删除"></a>
                                </div>
                            </div>
                            <br><br><br><br>
                        </form>
                    </c:forEach>
                </div>

                <div class="clear"></div>
            </div>

        </div>
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
