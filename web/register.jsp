<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/9
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession httpSession = request.getSession();
    String sessionUserName = (String) httpSession.getAttribute("userName");
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
        <div class="iphone span5">

        </div>
        <div class="register span6">
            <form action="<%=basePath%>register" onsubmit="return checkfun()" method="post">
                <h2>黔车网注册</h2>
                <label for="userName">用户名：</label>
                <input type="text" id="userName" name="userName" onfocus="fun1()" onblur="fun1_onblur()"
                       placeholder="请输入您的用户名..."><br>
                <span id="s1"></span>
                <label for="userPwd">密码：</label>
                <input type="password" id="userPwd" name="userPwd" onfocus="fun2()" onblur="fun2_onblur()"
                       placeholder="请输入您的密码..."><br>
                <span id="s2"></span>
                <label for="checkPwd">再次输入密码：</label>
                <input type="password" id="checkPwd" onfocus="fun3()" onblur="fun3_onblur()"
                       placeholder="请输入您的密码..."><br>
                <span id="s3"></span>
                <label for="phoneNum">电话号码：</label>
                <input type="text" id="phoneNum" name="phoneNum" onfocus="fun5()" onblur="fun5_onblur()"
                       placeholder="请输入您的电话号码..."><br>
                <span id="s5"></span>
                <label for="email">邮箱：</label>
                <input type="text" id="email" name="email" onfocus="fun4()" onblur="fun4_onblur()"
                       placeholder="请输入您的邮箱..."><br>
                <span id="s4"></span>
                <table>
                    <tr>
                        <td>请选择您的大学：</td>
                        <td>
                            <select style="width: 325px" id="school" name="school">
                                <option>贵州民族大学</option>
                                <option>贵州大学</option>
                                <option>贵州师范大学</option>
                                <option>贵州财经大学</option>
                                <option>贵州医科大学</option>
                                <option>贵阳中医学院</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <%--<table>--%>
                <%--<tr>--%>
                <%--<td> 验证码：</td>--%>
                <%--<td><input type="text" id="checkCode"></td>--%>
                <%--<td><span id="verifyCode"></span></td>--%>
                <%--</tr>--%>
                <%--</table>--%>

                <button type="submit" onsubmit="checkfun()">提交</button>
            </form>
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
<script type="text/javascript">
    var userName = document.getElementById("userName");
    var userPwd = document.getElementById("userPwd");
    var checkPwd = document.getElementById("checkPwd");
    var phoneNum = document.getElementById('phoneNum');
    var email = document.getElementById("email");
    var verifyCode = document.getElementById("verifyCode");
    var s1 = document.getElementById("s1");
    var s2 = document.getElementById("s2");
    var s3 = document.getElementById("s3");
    var s4 = document.getElementById("s4");
    var s8 = document.getElementById("s8");

    function fun1() {
        s1.innerText = '字母、数字、下划线构成，首字符不可以是数字，6-12位';
    }

    function fun1_onblur() {
        if (userName.value == '') {
            s1.style.color = 'red';
            s1.innerText = '用户名不能为空';
            return false;
        } else {
            reg = /^[a-zA-Z_]\w{5,11}$/;
            if (reg.test(userName.value)) {
                s1.innerText = '√';
                s1.style.color = 'green';
                return true;
            } else {
                s1.innerText = '×';
                s1.style.color = 'red';
                return false;
            }

        }
    }

    function fun2() {
        s2.innerText = '字母、数字、下划线构成，6位，首字符不可以是数字';
    }

    function fun2_onblur() {
        if (userPwd.value == '') {
            s2.style.color = 'red';
            s2.innerText = '请输入密码';
            return false;
        } else {
            reg = /^[a-zA-Z_]\w{5}$/;
            if (reg.test(userPwd.value)) {
                s2.innerText = '√';
                s2.style.color = 'green';
                return true;
            } else {
                s2.innerText = '×';
                s2.style.color = 'red';
                return false;
            }

        }
    }

    function fun3() {
        s3.innerText = '再次输入密码';
    }

    function fun3_onblur() {
        if (checkPwd.value == '') {
            s3.style.color = 'red';
            s3.innerText = '请输入密码';
            return false;

        } else {
            if (checkPwd.value != userPwd.value) {
                s3.style.color = 'red';
                s3.innerText = '两次密码不一致';
                return false;
            } else {
                s3.innerText = '√';
                s3.style.color = 'green';
                return true;
            }
        }
    }

    function fun4() {
        s4.innerText = '请输入您的QQ邮箱（如：2568824264@qq.com）';
    }

    function fun4_onblur() {
        if (email.value == '') {
            s4.style.color = 'red';
            s4.innerText = '不能为空';
            return false;
        } else {
            reg = /^[1-9]{5,10}\@(qq)\.(com)$/;
            if (reg.test(email.value)) {
                s4.innerText = '√';
                s4.style.color = 'green';
                return true;
            } else {
                s4.innerText = '×';
                s4.style.color = 'red';
                return false;
            }
        }
    }

    function fun5() {
        s5.innerText = '请正确输入11位电话号码';
    }

    function fun5_onblur() {
        if (phoneNum.value == '') {
            s5.style.color = 'red';
            s5.innerText = '不能为空';
            return false;
        } else {
            reg = /^1[0-9]{10}$/;
            if (reg.test(phoneNum.value)) {
                s5.innerText = '√';
                s5.style.color = 'green';
                return true;
            } else {
                s5.innerText = '×';
                s5.style.color = 'red';
                return false;
            }
        }
    }

    function fun8(max, min) {
        var checkCode = Math.random() * (max - min + 1) + min;
        s8.innerText = parseInt(checkCode);
    }

    function fun8_onblur() {
        if (verifyCode.value == '') {
            s8.innerText = '不能为空';
            return false;
        } else {
            if (verifyCode.value == s8.innerText) {
                s8.innerText = '√';
                return true;
            } else {
                s8.innerText = '×';
                return false;
            }
        }
    }

    function checkfun() {
        if (fun1_onblur() && fun2_onblur() && fun3_onblur() && fun4_onblur()) {
            return true;
        } else {
            return false;
        }
    }
</script>
</html>
