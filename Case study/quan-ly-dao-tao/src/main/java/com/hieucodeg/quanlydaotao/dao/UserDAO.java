package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.UserMapper;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO  {
	private static final String SELECT_USER = "SELECT * FROM user WHERE username = ? AND password = ? AND status = ?";
	private static final String SELECT_ALL_USER = "SELECT * FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID WHERE u.STATUS = 1";
	private static final String SELECT_USER_EDIT = "SELECT * FROM USER WHERE  STATUS = 1 && ID = ?";
	private static final String UPDATE_USER = "UPDATE `education`.`user` SET `username` = ?, `password` = ?, `fullname` = ?, `gender` = ?, `birthday` = ?, `image` = ?, `roleid` = ?, `idSubject` = ?, `modifieddate` = CURRENT_TIMESTAMP, `modifiedby` = ?  WHERE (`id` = ?)";
	private static final String DELETE_TEACHERCLASS = "DELETE FROM `education`.`teacherclass` WHERE (`idteacher` = ?)";
	private static final String UPDATE_TEACHERCLASS = "INSERT INTO `education`.`teacherclass` (`idteacher`, `idclass`) VALUES (?, ?)";
	private static final String INSERT_USER = "INSERT INTO `education`.`user` (`username`, `password`, `fullname`, `gender`, `birthday`, `status`, `image`, `roleid`, `idSubject`, `createdby`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
	private static final String FIND_LAST_ID = "SELECT * FROM education.user order by createddate desc";
	private static final String CHECK_USERNAME = "select count(username) from user where username = ? and id != ?";
	private static final String DELETE_USER = "UPDATE `education`.`user` SET `status` = 0, `modifieddate` = CURRENT_TIMESTAMP, `modifiedby` = ? WHERE (`id` = ?)";
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
		String sql = SELECT_ALL_USER + " AND (id like '%" +finderName +"%' or fullname like '%"+finderName+
				"%' or birthday like '%"+finderName+ "%' or subject like '%"+finderName+"%')";
		sql = sql +" ORDER BY "+sortName +" " + sortBy +" LIMIT "+ offset + ", " + limit;

		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}

	@Override
	public int getTotalItem(String finderName) {
		String sql;
		if (finderName.equals("")) {
			sql = "SELECT count(*) FROM user WHERE STATUS = 1";
		} else {
			sql = "SELECT count(*) FROM USER AS U INNER JOIN SUBJECT AS S ON U.IDSUBJECT = S.SID" + " where STATUS= 1 AND (id like '%" +finderName +"%' or fullname like '%"+finderName+
					"%' or birthday like '%"+finderName+ "%' or subject like '%"+finderName+"%')";
		}
		return count(sql);
	}
	@Override
	public UserModel findUserEdit(Long id) {
		List<UserModel> userModels = query(SELECT_USER_EDIT, new UserMapper(), id);
		return userModels.get(0);
	}

	@Override
	public void update(UserModel userModel, UserModel userLogin, List<Integer> listIdClass) {
		Long id = userModel.getId();
		String fullName = userModel.getFullName();
		Integer gender = userModel.getGender();
		String birthday = String.valueOf(userModel.getBirthday());
		Long roleId = userModel.getRoleId();
		Integer idSubject = userModel.getIdSubject();
		String image = userModel.getImage();
		String userName = userModel.getUserName();
		String password = userModel.getPassword();
		String idUserChange = String.valueOf(userLogin.getId());

		update(UPDATE_USER,userName,password,fullName,gender,birthday,image,roleId,idSubject,idUserChange,id);
		update(DELETE_TEACHERCLASS,id);
		for (Integer idClass : listIdClass) {
			update(UPDATE_TEACHERCLASS, id, idClass);
		}
	}

	@Override
	public boolean checkUserName(String userName, Long id) {
		int checkor = count(CHECK_USERNAME,userName, id);
		if (checkor != 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void insert(UserModel userModel, UserModel userLogin, List<Integer> listIdClass) {

		String fullName = userModel.getFullName();
		Integer gender = userModel.getGender();
		String birthday = String.valueOf(userModel.getBirthday());
		Long roleId = userModel.getRoleId();
		Integer idSubject = userModel.getIdSubject();
		String image = userModel.getImage();
		String userName = userModel.getUserName();
		String password = userModel.getPassword();
		String idUserChange = String.valueOf(userLogin.getId());

		update(INSERT_USER,userName,password,fullName,gender,birthday,1,image,roleId,idSubject,idUserChange);

		List<UserModel> userModels = query(FIND_LAST_ID, new UserMapper());
		Long id = userModels.get(0).getId();
		for (Integer idClass : listIdClass) {
			update(UPDATE_TEACHERCLASS, id, idClass);
		}
	}

	@Override
	public void delete(Long id, UserModel userLogin) {
		update(DELETE_USER,userLogin.getId(),id);
	}
}
