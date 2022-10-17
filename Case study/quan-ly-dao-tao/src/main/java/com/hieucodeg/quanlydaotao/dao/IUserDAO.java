package com.hieucodeg.quanlydaotao.dao;


import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findUser(String userName, String password, Integer status);

}
