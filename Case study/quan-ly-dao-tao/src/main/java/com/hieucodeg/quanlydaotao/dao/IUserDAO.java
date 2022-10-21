package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findUser(String userName, String password, Integer status);
	List<UserModel> findAll(Integer offset, Integer limit, String sortName, String sortBy);
	List<UserModel> findUserList(Integer offset, Integer limit, String sortName, String sortBy, String finderName);
	int getTotalItem(String finderName);
	UserModel findUserEdit(Long id);
	void update(UserModel userModel, UserModel userLogin, List<Integer> listIdClass);
	void update(UserModel userModel, UserModel userLogin);
	boolean checkUserName(String userName, Long id);
	void insert(UserModel userModel, UserModel userLogin, List<Integer> listIdClass);
	void delete(Long id, UserModel userLogin);
}
