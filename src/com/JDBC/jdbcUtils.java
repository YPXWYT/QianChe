package com.JDBC;

import java.sql.*;

/**
 * 1  包名
 * 2. 警告
 * 3. 注视
 */
public class jdbcUtils {
    private static final String user = "root";
    private static final String url = "jdbc:mysql://localhost:3306/carnet?" +
            "useSSL=false&serverTimezone=UTC";
    private static final String passwd = "root";


    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(url, user, passwd);
        return conn;
    }

    public static void free(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

    }
}
