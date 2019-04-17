package com.Service;

import com.Dao.UserDao;
import com.Entity.Car;
import com.Entity.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {

    UserDao userDao = new UserDao();

    public boolean registerService(String userName, String userPwd, String school, String phoneNum, String email) {
        return userDao.register(userName, userPwd, school, phoneNum, email);
    }

    public boolean loginService(String userName, String userPwd) throws SQLException {
        return userDao.login(userName, userPwd);
    }

    public User showUserInfoDao(String userName) {
        return userDao.showUserInfoDao(userName);
    }

    public boolean deleteUser(String userName) {
        return userDao.deleteUser(userName);
    }

    public boolean alterUser(User userInfor) {
        return userDao.alterUser(userInfor);
    }
}
