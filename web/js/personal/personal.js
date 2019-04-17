var personBtn = document.getElementById("personBtn");
var collectionBtn = document.getElementById("collectionBtn");
var personUBtn = document.getElementById("personUBtn");
personBtn.onmousemove = function () {
    personBtn.style.backgroundColor = "black";
}
personBtn.onmouseout = function () {
    personBtn.style.backgroundColor = "rgba(106, 106, 106, 0)";
}
collectionBtn.onmousemove = function () {
    collectionBtn.style.backgroundColor = "black";
}
collectionBtn.onmouseout = function () {
    collectionBtn.style.backgroundColor = "rgba(106, 106, 106, 0)";
}
personUBtn.onmousemove = function () {
    personUBtn.style.backgroundColor = "black";
}
personUBtn.onmouseout = function () {
    personUBtn.style.backgroundColor = "rgba(106, 106, 106, 0)";
}


/*---------------------------------------------*/
var modifyPhoneNumBtn = document.getElementById("modifyPhoneNum");
var phoneNumSpan = document.getElementById("phoneNumSpan");
var check2 = true;
modifyPhoneNumBtn.onclick = function () {
    check2 = false;
    var phoneNum = phoneNumSpan.innerText;
    phoneNumSpan.innerText = "";
    phoneNumSpan.innerHTML = "<input type='text' value='" + phoneNum + "' style='width: 180px;height: 18px'>";
    phoneNumSpan.childNodes[0].focus();
}

var modifyUserSchool = document.getElementById("modifyUserSchool");
var userSchoolSpan = document.getElementById("userSchoolSpan");
modifyUserSchool.onclick = function () {
    var userSchool = userSchoolSpan.innerText;
    userSchoolSpan.innerText = "";
    userSchoolSpan.innerHTML = "<select style='width: 200px;height: 23px'> <option>贵州民族大学</option> <option>贵州大学</option> <option>贵州师范大学</option> <option>贵州财经大学</option> <option>贵州医科大学</option> <option>贵阳中医学院</option> </select>";
}

var EmailSpan = document.getElementById("EmailSpan");
var modifyEmail = document.getElementById("modifyEmail");
var check3 = true;
modifyEmail.onclick = function () {
    check3 = false;
    var Email = EmailSpan.innerText;
    EmailSpan.innerText = "";
    EmailSpan.innerHTML = "<input type='text' value='" + Email + "' style='width: 195px;height: 18px'>";
    EmailSpan.childNodes[0].focus();
}

var modifyUserPwd = document.getElementById("modifyUserPwd");
var userPwdSpan = document.getElementById("userPwdSpan");
var check1 = true;
modifyUserPwd.onclick = function () {
    check1 = false;
    var userPwdYZ = prompt("请输入原密码");
    var userPwdYL = document.getElementById("userPwdYL").value;
    if (userPwdYL == userPwdYZ) {
        userPwdSpan.innerText = "";
        userPwdSpan.innerHTML = "<input type='password' style='width: 195px;height: 18px'>";
        userPwdSpan.childNodes[0].focus();
    } else {
        alert("输入的原密码不正确");
    }
}

function checkPwd() {
    if (check1) {
        return true;
    }
    var judge = 1;
    var password = userPwdSpan.childNodes[0].value;
    if (password == "") {
        alert("密码不能为空");
        return false;
    }
    else if (password[0] >= 0 && password[0] <= 9) {
        alert("首字母不能为数字");
        return false;
    } else if (password.length != 6) {
        alert("密码只能位6位构成");
        return false;
    } else {
        for (var i = 0; i < password.length; i++) {
            if ((password[i] >= 0 && password[i] <= 9) || (password[i] >= 'a' && password[i] <= 'z') || (password[i] >= 'A' && password[i] <= 'Z') || password[i] == '_') {
            }
            else {
                judge = 0;
            }
        }
        if (judge == 1) {
            return true;
        } else {
            alert("密码只能由字母、数字或下划线构成");
            return false;
        }
    }
}

function checkPhoneNum() {
    if (check2) {
        return true;
    }
    rge = /^1[0-9]{10}$/;
    var phoneNum = phoneNumSpan.childNodes[0].value;
    if (!rge.test(phoneNum)) {
        alert("号码不正确");
        return false;
    } else {
        return true;
    }
}

function checkEmail() {
    if (check3) {
        return true;
    }
    var rge = /^[1-9]{5,10}\@(qq)\.(com)$/;
    var Enail = EmailSpan.childNodes[0].value;
    if (!rge.test(Enail)) {
        alert("邮箱不正确");
        return false;
    } else {
        return true;
    }
}

function checkCommit() {
    if (checkPwd() && checkPhoneNum() && checkEmail()) {
        return true;
    } else {
        return false;
    }
}
