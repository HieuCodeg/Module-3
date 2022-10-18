package com.hieucodeg.quanlydaotao.mapper;

import com.hieucodeg.quanlydaotao.model.RoleModel;
import com.hieucodeg.quanlydaotao.model.UserModel;


import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel user = new UserModel();
			user.setId(resultSet.getLong("id"));
			user.setUserName(resultSet.getString("username"));
			user.setFullName(resultSet.getString("fullname"));
			user.setPassword(resultSet.getString("password"));
			user.setStatus(resultSet.getInt("status"));
			user.setBirthday(resultSet.getDate("birthday"));
			user.setIdSubject(resultSet.getInt("idsubject"));
			user.setGender(resultSet.getInt("gender"));
			user.setRoleId(resultSet.getLong("roleid"));

			return user;
		} catch (SQLException e) {
			return null;
		}
	}
}
