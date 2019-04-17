package com.Entity;

public class User {
    private String userName;
    private String userPwd;
    private String school;
    private String phoneNum;
    private String email;

    public String getPwd() {
        return userPwd;
    }

    public void setPwd(String upwd) {
        this.userPwd = upwd;
    }

    public void setuName(String uName) {
        this.userName = uName;
    }

    public String getuName() {
        return userName;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
