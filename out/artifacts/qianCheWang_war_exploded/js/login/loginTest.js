/**
 * Created by LJQ on 2018/12/7.
 */


/*账号初步验证*/
function tipUsername() {
    var tip = document.getElementById("userName");
    var errorBox = document.getElementsByClassName("error-box");
    var username = tip.value;
    if (username == '输入账号') {
        errorBox.innerText = "请输入用户名";
        tip.value = '';
    }
}

function checkUsername() {
    var tip = document.getElementById("userName");
    var errorBox = document.getElementsByClassName("error-box");
    var username = tip.value;
    if (username == '') {
        tip.value = '输入账号';
    } else {
        var judge = 1;
        if (username[0] >= 0 && username[0] <= 9) {
            errorBox[0].innerText = "首字母不能为数字！";
        } else if (username.length < 6 || username.length > 12) {
            errorBox[0].innerText = "用户名只能为6-12位";
        } else {
            for (var i = 0; i < username.length; i++) {
                if ((username[i] >= 0 && username[i] <= 9) || (username[i] >= 'a' && username[i] <= 'z') || (username[i] >= 'A' && username[i] <= 'Z') || username[i] == '_') {
                }
                else {
                    judge = 0;
                }
            }
            if (judge == 1) {
                errorBox[0].innerText = "欢迎登陆黔车网";
                return true;
            } else {
                errorBox[0].innerText = "用户名只能由字母、数字或下划线构成";
            }
        }
    }
}

function tipPassword() {
    var tip = document.getElementsByClassName("error-box");
    if (!checkUsername()) {
        var user = document.getElementById("userName");
        user.focus();
    } else if (!
        checkPassword()) {
        tip[0].innerText = "密码可以由6位的字母数字下划线构成";
    }
}

function checkPassword() {
    if (checkUsername()) {
        var judge = 1;
        var doc = document.getElementById("userPwd");
        var tip = document.getElementsByClassName("error-box");
        var password = doc.value;
        if (password == "") {
            tip[0].innerText = "密码不能为空";
        }
        else if (password[0] >= 0 && password[0] <= 9) {
            tip[0].innerText = "首字母不能为数字";
        } else if (password.length != 6) {
            tip[0].innerText = "密码只能位6位构成";
        } else {
            for (var i = 0; i < password.length; i++) {
                if ((password[i] >= 0 && password[i] <= 9) || (password[i] >= 'a' && password[i] <= 'z') || (password[i] >= 'A' && password[i] <= 'Z') || password[i] == '_') {
                }
                else {
                    judge = 0;
                }
            }
            if (judge == 1) {
                tip[0].innerText = "欢迎登陆黔车网";
                return true;
            } else {
                tip[0].innerText = "密码只能由字母、数字或下划线构成";
            }
        }
    }
    return false;
}

var success = false;//是否通过验证的标志

function checkAll() {
    if (checkPassword() && success == true) {
        return true;
    } else {
        return false;
    }
}


/*滑动验证*/
function hdYZ() {
    if (success == true) {
        return;
    }
    //一、定义一个获取DOM元素的方法
    var $ = function (selector) {
            return document.querySelector(selector);
        },
        box = $(".drag"),//容器
        bg = $(".bg"),//背景
        text = $(".text"),//文字
        btn = $(".btn"),//滑块

        distance = box.offsetWidth - btn.offsetWidth;//滑动成功的宽度（距离）

//二、给滑块注册鼠标按下事件
    btn.onmousedown = function (e) {

        //1.鼠标按下之前必须清除掉后面设置的过渡属性
        btn.style.transition = "";
        bg.style.transition = "";

        //说明：clientX 事件属性会返回当事件被触发时，鼠标指针向对于浏览器页面(或客户区)的水平坐标。

        //2.当滑块位于初始位置时，得到鼠标按下时的水平位置
        var e = e || window.event;
        var downX = e.clientX;

        //三、给文档注册鼠标移动事件
        document.onmousemove = function (e) {

            var e = e || window.event;
            //1.获取鼠标移动后的水平位置
            var moveX = e.clientX;

            //2.得到鼠标水平位置的偏移量（鼠标移动时的位置 - 鼠标按下时的位置）
            var offsetX = moveX - downX;

            //3.在这里判断一下：鼠标水平移动的距离 与 滑动成功的距离 之间的关系
            if (offsetX > distance) {
                offsetX = distance;//如果滑过了终点，就将它停留在终点位置
            } else if (offsetX < 0) {
                offsetX = 0;//如果滑到了起点的左侧，就将它重置为起点位置
            }

            //4.根据鼠标移动的距离来动态设置滑块的偏移量和背景颜色的宽度
            btn.style.left = offsetX + "px";
            bg.style.width = offsetX + "px";

            //如果鼠标的水平移动距离 = 滑动成功的宽度
            if (offsetX == distance) {

                //1.设置滑动成功后的样式
                text.innerHTML = "验证通过";
                text.style.color = "#fff";
                btn.innerHTML = "&radic;";
                btn.style.color = "green";
                bg.style.backgroundColor = "lightgreen";

                //2.设置滑动成功后的状态
                success = true;
                //成功后，清除掉鼠标按下事件和移动事件（因为移动时并不会涉及到鼠标松开事件）
                btn.onmousedown = null;
                document.onmousemove = null;

                //3.成功解锁后的回调函数
                setTimeout(function () {
                    //alert('解锁成功！');
                }, 100);
            }
        }

        //四、给文档注册鼠标松开事件
        document.onmouseup = function (e) {

            //如果鼠标松开时，滑到了终点，则验证通过
            if (success) {
                return true;
            } else {
                //反之，则将滑块复位（设置了1s的属性过渡效果）
                btn.style.left = 0;
                bg.style.width = 0;
                btn.style.transition = "left 1s ease";
                bg.style.transition = "width 1s ease";
                return false;
            }
            //只要鼠标松开了，说明此时不需要拖动滑块了，那么就清除鼠标移动和松开事件。
            document.onmousemove = null;
            document.onmouseup = null;
        }
    }
}