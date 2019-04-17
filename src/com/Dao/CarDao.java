package com.Dao;

import com.Entity.Car;
import com.JDBC.jdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CarDao extends jdbcUtils {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;

    public boolean saveCarInfoDao(Car carInfo) {
        String str = "'" + carInfo.getUserName() + "'" + "," + "'" + carInfo.getKind() + "'" + "," + "'" + carInfo.getPrice() + "'" + "," + "'" + carInfo.getUseTime() + "'" + "," + "'" +
                carInfo.getImgs() + "'" + "," + "'" + carInfo.getReleaseTime() + "'" + "," + "'" + carInfo.getDescribes() + "'";
        String sql = "INSERT INTO " + "upload_info" + " values(" + str + ")";
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

    public List<Car> showCarInfoDaoConditions(String kind, String price_d, String price_u, String useTime_d, String useTime_u) {

        String sql = "select *from upload_info where kind=" + "\"" + kind + "\"" + " and (price between " + price_d + " and " + price_u + ")" + "and (usetime between " + useTime_d + " and " + useTime_u + ")";
        List<Car> lists = null;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            lists = new ArrayList<Car>();

            while (rs.next()) {
                Car car = new Car();

                car.setUserName(rs.getString(1));
                car.setKind(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setUseTime(rs.getString(4));
                car.setImgs(rs.getString(5));
                car.setReleaseTime(rs.getString(6));
                car.setDescribes(rs.getString(7));
                lists.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }

        return lists;
    }

    public List<Car> showCarInfoDaoAll() {

        String sql = "select *from upload_info";
        List<Car> lists = null;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            lists = new ArrayList<Car>();

            while (rs.next()) {
                Car car = new Car();

                car.setUserName(rs.getString(1));
                car.setKind(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setUseTime(rs.getString(4));
                car.setImgs(rs.getString(5));
                car.setReleaseTime(rs.getString(6));
                car.setDescribes(rs.getString(7));
                lists.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }

        return lists;
    }

    public List<Car> showCollection(String selfName) {

        String sql = "select u.username,u.kind,u.price,u.usetime,u.imgs,u.releasetime,u.describes from " +
                "upload_info as u,collection as c where c.self_name=" + "\"" + selfName + "\"" + " and c.imgs=u.imgs";
        List<Car> lists = null;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            lists = new ArrayList<Car>();

            while (rs.next()) {
                Car car = new Car();

                car.setUserName(rs.getString(1));
                car.setKind(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setUseTime(rs.getString(4));
                car.setImgs(rs.getString(5));
                car.setReleaseTime(rs.getString(6));
                car.setDescribes(rs.getString(7));
                lists.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }

        return lists;
    }

    public boolean saveCollection(String selfName, String imgs) {
        String str = "'" + selfName + "'" + "," + "'" + imgs + "'";
        String sql = "INSERT INTO " + "collection" + " values(" + str + ")";
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

    public List<Car> showCarInfoDaoSelf(String selfName) {

        String sql = "select *from upload_info where username=" + "\"" + selfName + "\"";
        List<Car> lists = null;
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            lists = new ArrayList<Car>();

            while (rs.next()) {
                Car car = new Car();

                car.setUserName(rs.getString(1));
                car.setKind(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setUseTime(rs.getString(4));
                car.setImgs(rs.getString(5));
                car.setReleaseTime(rs.getString(6));
                car.setDescribes(rs.getString(7));
                lists.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return lists;
    }

    public Car showAlterCarInfoDaoSelf(String selfName, String img) {

        String sql = "select *from upload_info where username=" + "\"" + selfName + "\"" + " and imgs=" + "\"" + img + "\"";
        Car car = new Car();
        try {
            conn = jdbcUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {

                car.setUserName(rs.getString(1));
                car.setKind(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setUseTime(rs.getString(4));
                car.setImgs(rs.getString(5));
                car.setReleaseTime(rs.getString(6));
                car.setDescribes(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.free(rs, stmt, conn);
        }
        return car;
    }

    public boolean alterCar() {

        boolean flag = false;

        return flag;
    }

    public boolean deleteSelfCar(String selfName, String imgs) {
        boolean flag = false;
        String sql = "delete from upload_info where username=" + "\"" + selfName + "\"" + "and imgs=" + "\"" + imgs + "\"";
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

    public boolean deleteCollectionCar(String selfName, String imgs) {
        boolean flag = false;
        String sql = "delete from collection where self_name=" + "\"" + selfName + "\"" + " and imgs=" + "\"" + imgs + "\"";
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

    public boolean alterSelfCarInfo(Car carInfor, String preImg) {
        boolean flag = false;
        String sql = "update upload_info set " + "kind=" + "\"" + carInfor.getKind() + "\"" + ",price=" + "\"" + carInfor.getPrice() + "\"" +
                ",usetime=" + "\"" + carInfor.getUseTime() + "\"" + ",imgs=" + "\"" + carInfor.getImgs() + "\"" + ",releasetime=" + "\"" + carInfor.getReleaseTime() + "\"" +
                ",describes=" + "\"" + carInfor.getDescribes() + "\"" + " where username=" + "\"" + carInfor.getUserName() + "\"" + " and imgs=" + "\"" + preImg + "\"";
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
