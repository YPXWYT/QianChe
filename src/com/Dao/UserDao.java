package com.Dao;

import com.Entity.Car;
import com.Entity.User;
import com.JDBC.jdbcUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends jdbcUtils {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;

    public boolean login(String userName, String userPwd) throws SQLException {
        String sql = "SELECT userpwd FROM user where username=" + "\"" + userName + "\"";
        boolean flag = false;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("userpwd").equals(userPwd)) {
                    flag = true;
                } else {
                    flag = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return flag;
    }

    public boolean register(String userName, String userPwd, String school, String phoneNum, String email) {
        String str = "'" + userName + "'" + "," + "'" + userPwd + "'" + "," + "'" + school + "'" + "," + "'" + phoneNum + "'" + "," + "'" + email + "'";
        String sql = "INSERT INTO " + "user" + " values(" + str + ")";
        int rs1 = 0;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs1 = stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        if (rs1 > 0) {
            return true;
        } else {
            return false;
        }
    }

    public User showUserInfoDao(String userName) {

        String sql = "select *from user where username=" + "\"" + userName + "\"";
        User user = new User();
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {

                user.setuName(rs.getString(1));
                user.setPwd(rs.getString(2));
                user.setSchool(rs.getString(3));
                user.setPhoneNum(rs.getString(4));
                user.setEmail(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return user;
    }


    public boolean deleteUser(String userName) {
        boolean flag = false;
        String sql = "delete *from user where username=" + "\"" + userName + "\"";
        int rs1 = 0;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs1 = stmt.executeUpdate(sql);

            if (rs1 > 0) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return flag;
    }

    public boolean alterUser(User userInfor) {
        boolean flag = false;
        String sql = "update user set " + "userpwd=" + "\"" + userInfor.getPwd() + "\"" + ",school=" + "\"" + userInfor.getSchool() + "\"" +
                ",phonenum=" + "\"" + userInfor.getPhoneNum() + "\"" + ",email" + "\"" + userInfor.getEmail() + "\"" + " where username=" + "\"" + userInfor.getuName() + "\"";
        int rs1 = 0;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs1 = stmt.executeUpdate(sql);

            if (rs1 > 0) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return flag;
    }

}
