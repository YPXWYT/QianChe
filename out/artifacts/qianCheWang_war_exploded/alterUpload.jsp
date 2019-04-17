<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/9
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <meta charset="UTF-8">
    <title>我要发布</title>
    <link rel="stylesheet" href="css/upload/style.css" type="text/css">
    ;

    <style>
        #imgPreview {
            width: 260px;
            height: 180px;
            margin: 10px auto 0px auto;
            border: 1px solid black;
            text-align: center;
        }

        #prompt3 {
            width: 100%;
            height: 180px;
            text-align: center;
            position: relative;
        }

        #imgSpan {
            position: absolute;
            top: 60px;
            left: 100px;
        }

        .filepath {
            width: 100%;
            height: 100%;
            opacity: 0;
        }

        #img3 {
            height: 100%;
            width: 100%;
            display: none;
        }

        #test2 {
            position: relative;
            left: 210px;
            top: 0px;
            width: 160px;
            height: 50px;

        }

        #test2 a {
            text-align: center;
            line-height: 50px;
            font-family: KaiTi;
            font-size: 24px;
            color: #3BBFBC;
            text-decoration: none;
        }

        #myUpload {
            position: relative;
            left: 270px;
            top: 0px;
            height: 20px;
            width: auto;
            font-family: KaiTi;
            font-size: 18px;
            color: #3BBFBC;
        }

        #person {
            position: relative;
            left: 1300px;
            top: -30px;
            display: inline-block;
        }

        #img4 {
            display: inline-block;
            float: left;
        }

        #file {
            position: relative;
            top: -180px;
        }
    </style>

    <script>
        function changepic() {
            document.getElementById("prompt3").style.display = "none";
            var reads = new FileReader();
            var f = document.getElementById('file').files[0];
            reads.readAsDataURL(f);
            reads.onload = function (e) {
                document.getElementById('img3').src = this.result;
                document.getElementById("img3").style.display = "block";
            }
        }

        function changeimg() {
            document.getElementById("img3").style.display = "none";
            document.getElementById("prompt3").style.display = "block";
        }


        function logo_over() {
            document.getElementById("test2").style.backgroundColor = "white";
        }

        function logo_out() {
            document.getElementById("test2").style.backgroundColor = "transparent";
        }

        function person_over() {
            document.getElementById("person").style.border = "solid";
            document.getElementById("person").style.borderWidth = "1px";
        }

        function person_out() {
            document.getElementById("person").style.border = "none";
        }

        function changePrice1() {
            var price = document.getElementById("field5");
            if (price.value == "请输入价格，单位为元" || price.value == "您输入的价格不合理") {
                price.value = "";
            }
        }

        function changePrice2() {
            var gre = /^\d{1,5}$/;
            var price = document.getElementById("field5");
            if (price.value == "") {
                price.value = "请输入价格，单位为元";
                return false;
            } else if (!gre.test(price.value)) {
                price.value = "您输入的价格不合理";
                return false;
            } else {
                price.style.color = "black";
                return true;
            }
        }

        function changeTime1() {
            var time = document.getElementById("field4");
            if (time.value == "请输入使用时间，单位为月" || time.value == "请输入您正确的使用时间") {
                time.value = "";
            }
        }

        function changeTime2() {
            var gre = /^[1-9]\d?$/;
            var time = document.getElementById("field4");
            if (time.value == "") {
                time.value = "请输入使用时间，单位为月";
                return false;
            } else if (!gre.test(time.value)) {
                time.value = "请输入您正确的使用时间";
                return false;
            } else {
                time.style.color = "black";
                return true;
            }
        }

        function checkCommit() {
            if (changePrice2() && changeTime2()) {
                var img = document.getElementById("file");
                if (img.value == "") {
                    img.value =${car.imgs};
                    /*alert("请上传自己爱车的照片");*/
                    return true;
                }
            }
        }
    </script>
</head>
<body>

<div id="test2" onmouseover="logo_over()" onmouseout="logo_out()">
    <a href="#"><h2>黔车网</h2></a>
</div>

<div id="person" onmouseover="person_over()" onmouseout="person_out()">
    <a href="#"><img src="img/upload/person.png" alt="个人中心" width="30px" height="30px"/></a>
</div>

<div class="form_content">
    <form id="test" action="/AlterUpload" method="post" enctype="multipart/form-data" onsubmit="return checkCommit()">
        <!--<fieldset>
            <legend>发布人信息</legend>
            <div class="form-row">
                <div class="field-label"><label for="field1">姓名</label>:</div>
                <div class="field-widget"><input name="field1" id="field1" class="required" title="Enter your name" /></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field2">联系电话</label>:</div>
                <div class="field-widget"><input name="field2" id="field2" class="required" title="Enter your name" /></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field3">联系地址</label>:</div>
                <div class="field-widget"><textarea class="required"></textarea></div>
                </div>
                </fieldset>
            -->

        <fieldset>
            <div id="myUpload">修改我的发布</div>
            <legend>二手车信息</legend>
            <div class="form-row">
                <div class="field-label"><label for="field6">车品牌</label>:</div>
                <div class="field-widget">
                    <select id="field6" name="kind" class="validate-selection" title="请选择您要卖车的品牌">
                        <option value="其他">${car.kind}</option>
                        <option value="爱玛电动车">爱玛电动车</option>
                        <option value="小刀电动车">小刀电动车</option>
                        <option value="绿源电动车">绿源电动车</option>
                        <option value="王派电动车">王派电动车</option>
                        <option value="雅玛哈踏板摩托车">雅玛哈踏板摩托车</option>
                        <option value="铃木踏板摩托车">铃木踏板摩托车</option>
                        <option value="五羊本田踏板摩托车">五羊本田踏板摩托车</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="field-label">价格<label for="field5"></label>:</div>
                <div class="field-widget"><input name="price" id="field5" class="required validate-email"
                                                 title="请输入您想售卖的理想价格" value="${car.price}" onfocus="changePrice1()"
                                                 onblur="changePrice2()"/></div>
            </div>

            <div class="form-row">
                <div class="field-label">使用时间<label for="field4"></label>:</div>
                <div class="field-widget"><input name="useTime" id="field4" class="required" title="请输入使用时间"
                                                 value="${car.useTime}" onfocus="changeTime1()" onblur="changeTime2()"/>
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="desc">车详细信息</label>:</div>
                <div class="field-widget"><textarea class="required" id="desc"
                                                    name="describes">${car.describes}</textarea></div>
            </div>

        </fieldset>
        <fieldset>
            <legend class="optional">照片</legend>

            <div id="imgPreview" onclick="changeimg()">
                <div id="prompt3">
                    <img style="height: 100%;width: 100%" src="imgs/<c:out value='${car.imgs}'/>" id="img4">
                    <input type='file' id='file' value='' name='file' class='filepath' onchange='changepic(this)'
                           accept='image/jpg,image/jpeg,image/png,image/PNG'>
                    <!--当vaule值改变时执行changepic函数，规定上传的文件只能是图片-->
                </div>
                <img src="#" id="img3"/>
            </div>

        </fieldset>
        <input type="hidden" name="alterImg" value="${car.imgs}">
        <input type="submit" class="submit" value="Submit"/> <input class="reset" type="button" value="Reset"
                                                                    onclick="valid.reset(); return false"/>
    </form>
</div>
</body>
</html>
