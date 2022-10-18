package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.StudentMapper;
import com.hieucodeg.quanlydaotao.mapper.UserMapper;
import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO  {
	private static final String SELECT_USER = "SELECT * FROM user WHERE username = ? AND password = ? AND status = ?";
	private static final String SELECT_ALL_USER = "SELECT * FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID";
	private static final String SELECT_USER_EDIT = "SELECT * FROM USER WHERE ID = ?";
	@Override
	public UserModel findUser(String userName, String password, Integer status) {

		List<UserModel> users = query(SELECT_USER, new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public List<UserModel> findAll(Integer offset, Integer limit , String sortName, String sortBy) {
		String sql = SELECT_ALL_USER +" ORDER BY "+sortName +" " + sortBy +" LIMIT "+ offset + ", " + limit;

		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}

	@Override
	public List<UserModel> findUserList(Integer offset, Integer limit, String sortName, String sortBy, String finderName) {
		String sql = SELECT_ALL_USER + " where id like '%" +finderName +"%' or fullname like '%"+finderName+
				"%' or birthday like '%"+finderName+ "%' or subject like '%"+finderName+"%'";
		sql = sql +" ORDER BY "+sortName +" " + sortBy +" LIMIT "+ offset + ", " + limit;

		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}

	@Override
	public int getTotalItem(String finderName) {
		String sql;
		if (finderName.equals("")) {
			sql = "SELECT count(*) FROM user";
		} else {
			sql = "SELECT count(*) FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID" + " where id like '%" +finderName +"%' or fullname like '%"+finderName+
					"%' or birthday like '%"+finderName+ "%' or subject like '%"+finderName+"%'";
		}
		return count(sql);
	}
}
