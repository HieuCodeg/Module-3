package com.hieucodeg.quanlydaotao.dao;


import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findUser(String userName, String password, Integer status);
	List<UserModel> findAll(Integer offset, Integer limit, String sortName, String sortBy);
	List<UserModel> findUserList(Integer offset, Integer limit, String sortName, String sortBy, String finderName);
	int getTotalItem(String finderName);
}
