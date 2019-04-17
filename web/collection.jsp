<%@ page import="com.Entity.User" %>
<%@ page import="com.Entity.Car" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/12
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
    List<Car> carList = (List<Car>) httpSession.getAttribute("carList");
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
                <li>
                    <form action="<%=basePath%>/ShowUser" method="post"><input type="submit" value="个人中心"
                                                                               id="personBtn"></form>
                </li>
                <li class="active">
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
            <div class="blog">
                <div class="grid">
                    <h4><a>我的收藏</a></h4>
                    <%--<c:forEach items="${carList}" var="car">--%>
                    <%--<div style="width: 100px;height: 100px;display: inline-block">--%>
                    <%--<img src="WEB-INF/imgs/<c:out value="${car.imgs}"/> " style="width: 100%;height: 100%">--%>
                    <%--</div>--%>

                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <%--<table style="display: inline-block ;margin-top:30px ">--%>
                    <%--<tr>--%>
                    <%--<td>--%>
                    <%--<div style="width: 250px;height: 250px">--%>
                    <%--<img src="imgs/<c:out value="${car.imgs}"/> " style="width: 100%;height: 100%">--%>
                    <%--</div>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>发布人：${car.userName}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>发布时间：${car.releaseTime}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>品牌：${car.kind}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>使用时间：${car.useTime}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>价格：${car.price}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>描述：${car.describes}</td>--%>
                    <%--</tr>--%>
                    <%--<tr><td><button>收藏</button></td></tr>--%>
                    <%--</table>--%>
                    <%--</c:forEach>--%>

                    <c:forEach items="${carList}" var="car">
                    <form action="/DeleteCollection" method="post">
                        <h5>车主&nbsp;<a href="#">${car.userName}</a></h5>
                        <div class="blog-para">
                            <p>
                                <a href="" rel="lightbox">
                                    <div class="box-img">
                                        <img src="imgs/<c:out value="${car.imgs}"/>" alt="">
                                    </div>
                                </a>
                                <div class="box-img-form">
                            <p></p>
                            品牌: <p>${car.kind}</p>
                            价格: <p>${car.price}</p>
                            发布时间: <p>${car.releaseTime}</p>
                            使用时间： <p>${car.useTime}个月</p>
                            描述: <p>${car.describes}</p>
                            </p>
                            <div class="readmore">
                                    <%--<a href="#">--%>
                                    <%--<button class="btn btn-3 btn-3e icon-arrow-right">详情</button>--%>
                                    <%--</a>--%>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#">
                                    <button class="btn btn-3 btn-3e icon-arrow-right">删除</button>
                                </a>
                            </div>
                        </div>
                        <input type="hidden" name="img" value="${car.imgs}">
                    </form>
                </div>
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
