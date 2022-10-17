package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.UserMapper;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO  {
	private static final String SELECT_USER = "SELECT * FROM user AS u INNER JOIN role AS r ON r.id = u.roleid WHERE username = ? AND password = ? AND status = ?";
	@Override
	public UserModel findUser(String userName, String password, Integer status) {

		List<UserModel> users = query(SELECT_USER, new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}
	
}
