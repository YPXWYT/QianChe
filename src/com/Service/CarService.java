package com.Service;

import com.Dao.CarDao;
import com.Entity.Car;

import java.util.List;

public class CarService {
    CarDao carDao = new CarDao();

    public boolean saveCarInfoService(Car carInfor) {
        return carDao.saveCarInfoDao(carInfor);
    }


    public List<Car> showCarInfoDaoConditions(String kind, String price_d, String price_u, String useTime_d, String useTime_u) {
        return carDao.showCarInfoDaoConditions(kind, price_d, price_u, useTime_d, useTime_u);
    }

    public List<Car> showCarInfoDaoAll() {
        return carDao.showCarInfoDaoAll();
    }

    public List<Car> showCollection(String selfName) {
        return carDao.showCollection(selfName);
    }

    public boolean saveCollection(String selfName, String imgs) {
        return carDao.saveCollection(selfName, imgs);
    }

    public List<Car> showCarInfoDaoSelf(String selfName) {
        return carDao.showCarInfoDaoSelf(selfName);
    }

    public boolean deleteSelfCar(String selfName, String imgs) {
        return carDao.deleteSelfCar(selfName, imgs);
    }

    public boolean deleteCollectionCar(String selfName, String imgs) {
        return carDao.deleteCollectionCar(selfName, imgs);
    }

    public Car showAlterCarInfoDaoSelf(String selfName, String img) {
        return carDao.showAlterCarInfoDaoSelf(selfName, img);
    }

    public boolean alterSelfCarInfo(Car carInfor, String preImg) {
        return carDao.alterSelfCarInfo(carInfor, preImg);
    }
}
