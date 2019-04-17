<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/8
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String to = basePath + "/ShowUser";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
    if (sessionUserName == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
<html>
<head>
    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>黔车网</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="UTF-8">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="<%=basePath%>/css/main/zerogrid.css">
    <link rel="stylesheet" href="<%=basePath%>/css/main/style.css">
    <link rel="stylesheet" href="<%=basePath%>/css/main/responsiveslides.css">

    <script src="<%=basePath%>/js/main/jquery-latest.min.js"></script>
    <script src="<%=basePath%>/js/main/script.js"></script>
    <script src="<%=basePath%>/js/main/jquery183.min.js"></script>
    <script src="<%=basePath%>/js/main/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow
            $("#slider").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });

        function changeBg1() {
            var sbt = document.getElementById("sbt2");
            sbt.style.backgroundColor = "sandybrown";
        }

        function changeBg2() {
            var sbt = document.getElementById("sbt2");
            sbt.style.backgroundColor = "white"
        }

        function changeBg3() {
            var sbt = document.getElementById("sbt");
            sbt.style.backgroundColor = "#2b6ca9";
        }

        function changeBg4() {
            var sbt = document.getElementById("sbt");
            sbt.style.backgroundColor = "#2D88CF"
        }
    </script>


</head>
<body>
<div class="wrap-body">

    <!--////////////////////////////////////Header-->
    <header class="bg-theme">
        <div class="wrap-header zerogrid">
            <div class="row">
                <div id="cssmenu" style="alignment: center">
                    <ul>
                        <li><a href="upload.jsp"><h2>关于</h2></a></li>
                        <li><a href="#"><h2>咨询</h2></a></li>
                        <li><a href="login.jsp"><h2>注销</h2></a></li>

                        <%--&lt;%&ndash;<form action="<%=basePath%>/ShowUser" method="post" id="myform"></form>&ndash;%&gt;缺点，返回页面是无法继续操作--%>
                        <%----%>
                        <%--<li><a href="javascript:void(0);" class="a_post"><h2><img src="img/main/user.png"  ></h2></a></li>--%>
                        <li>
                            <form action="<%=basePath%>/ShowUser" method="post"><h2><input type="submit" value="个人中心"
                                                                                           id="sbt"
                                                                                           onmouseover="changeBg3()"
                                                                                           onmouseout="changeBg4()">
                            </h2></form>
                        </li>
                    </ul>
                </div>
                <a class="logo"><img src="<%=basePath%>/img/main/label.png" height="80" width="218"/></a>
            </div>
        </div>
    </header>
    <div class="slider">
        <!-- Slideshow -->
        <div class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>
                    <img src="<%=basePath%>/img/main/p1.jpg"/>
                    <div class="caption">
                        <h1>黔车网</h1>
                        <span>一个属于我们大学生自己的二手车网</span>
                    </div>
                </li>
                <li>
                    <img src="<%=basePath%>/img/main/p2.jpg"/>
                    <div class="caption">
                        <h1>黔车网</h1>
                        <span>一个属于我们大学生自己的二手车网</span>
                    </div>
                </li>
                <li>
                    <img src="<%=basePath%>/img/main/p3.jpg"/>
                    <div class="caption">
                        <h1>黔车网</h1>
                        <span>一个属于我们大学生自己的二手车网</span>
                    </div>
                </li>
                <li>
                    <img src="<%=basePath%>/img/main/p4.jpg"/>
                    <div class="caption">
                        <h1>黔车网</h1>
                        <span>一个属于我们大学生自己的二手车网</span>
                    </div>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>

    <div class="bg-theme">
        <form action="<%=basePath%>/ShowCar" method="post">
            <div class="filter zerogrid">
                <h2 class="t-center">查询您的爱车</h2>
                <div class="row">
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <span>品牌：</span><br/>
                            <select name="kind">
                                <option>--请选择--</option>
                                <option>爱玛电动车</option>
                                <option>小刀电动车</option>
                                <option>绿源电动车</option>
                                <option>王派电动车</option>
                                2
                                <option>雅马哈踏板摩托车</option>
                                <option>铃木踏板摩托车</option>
                                <option>五羊本田踏板摩托车</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <span>使用时间：</span><br/>
                            <select name="useTime">
                                <option>--请选择--</option>
                                <option>2个月以内</option>
                                <option>2-6个月</option>
                                <option>6-9个月</option>
                                <option>一年至两年</option>
                                <option>两年及以上</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <span>价格：</span><br/>
                            <select name="price">
                                <option>--请选择--</option>
                                <option>500-1000</option>
                                <option>1000-1500</option>
                                <option>1500-2000</option>
                                <option>2000以上</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <br>
                            <%--<a href="<%=basePath%>/Show" class="button bt1">Go</a>--%>
                            <input type="submit" value="搜寻" id="sbt2" onmouseover="changeBg1()"
                                   onmouseout="changeBg2()">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%--<jsp:useBean id="carList" scope="session" type="java.util.List"/>--%>
    <c:forEach items="${carList}" var="car">
        <%--<div style="width: 100px;height: 100px;display: inline-block">--%>
        <%--<img src="WEB-INF/imgs/<c:out value="${car.imgs}"/> " style="width: 100%;height: 100%">--%>
        <%--</div>--%>
        <form action="<%=basePath%>/SaveCollection" method="post" style="display: inline-block">
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <table style="display: inline-block ;margin-top:100px ">
                <tr>
                    <td>
                        <div style="width: 250px;height: 250px">
                            <img src="imgs/<c:out value="${car.imgs}"/> " style="width: 100%;height: 100%">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>发布人：${car.userName}</td>
                </tr>
                <tr>
                    <td>发布时间：${car.releaseTime}</td>
                </tr>
                <tr>
                    <td>品牌：${car.kind}</td>
                </tr>
                <tr>
                    <td>使用时间：${car.useTime}</td>
                </tr>
                <tr>
                    <td>价格：${car.price}</td>
                </tr>
                <tr>
                    <td>描述：${car.describes}</td>
                </tr>
                <tr>
                    <td><input type="hidden" name="img" value="${car.imgs}"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="收藏" style="background: rosybrown;margin-top: 20px"></td>
                </tr>
            </table>
        </form>
    </c:forEach>

    <!--////////////////////////////////////Footer-->
    <footer>
        <div class="zerogrid">
            <div class="wrap-footer">
                <div class="row">
                    <h3>欢迎访问</h3>
                    <span>电话： / 于：+86 18744972966</span></br>
                    <span>  李：+86 13715545955</span></br>
                    <span>邮箱： / 于： 2568824264@qq.com</span></br>
                    <span>李： 265214165@qq.com</span></br>
                    <span><strong>这是一个专属大学生的二手车交易网站----|黔车网| @ ljq & ypx</strong></span>
                </div>
            </div>
        </div>
    </footer>

</div>
</body>
<%--<script type="text/javascript">--%>
<%--// function fun() {--%>
<%--//     var sbt = document.getElementById("sbt");--%>
<%--//--%>
<%--// }--%>
<%--// function fun(to) {--%>
<%--//    var myForm = document.createElement("form");--%>
<%--//    myForm.method="post";--%>
<%--//    myForm.action = to;--%>
<%--//    var myinput = document.createElement("input");--%>
<%--//    myForm.appendChild(myinput);--%>
<%--//    document.body.appendChild(myForm);--%>
<%--//    myForm.submit();--%>
<%--//    document.body.removeChild(myForm);--%>
<%--// }--%>
<%--$(".a_post").on("click",function (event) {--%>
<%--event.preventDefault();--%>
<%--var data={sessionUserName:'<%=sessionUserName%>'};--%>
<%--// json.stringify[data];--%>
<%--$.ajax({--%>
<%--type:"POST",--%>
<%--url:"<%=basePath%>/ShowUser",--%>
<%--dataType:"json",--%>
<%--data:json.stringify[data],--%>
<%--success:function (result) {--%>
<%--if (result.code == 100){--%>
<%--alert("yes!");--%>
<%--} else {--%>
<%--alert("yes!");--%>
<%--}--%>
<%--},--%>
<%--error:function () {--%>
<%--alert("error!")--%>
<%--}--%>
<%--});--%>
<%--});--%>
<%--</script>--%>
</html>
