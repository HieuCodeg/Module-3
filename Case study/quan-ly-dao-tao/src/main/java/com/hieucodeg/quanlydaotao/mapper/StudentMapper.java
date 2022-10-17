package com.hieucodeg.quanlydaotao.mapper;


import com.hieucodeg.quanlydaotao.model.StudentModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentMapper implements RowMapper<StudentModel> {

	@Override
	public StudentModel mapRow(ResultSet resultSet) {
		try {
			StudentModel student = new StudentModel();
			student.setId(resultSet.getLong(1));
			student.setName(resultSet.getString("name"));
			student.setGender(resultSet.getInt("gender"));
			student.setBirthday(resultSet.getDate("birthday"));
			student.setPhoneNumber(resultSet.getString("phone"));
			student.setEmail(resultSet.getString("email"));
			student.setIdGrade(Integer.parseInt(resultSet.getString("classid")));
			student.setCreatedDate(resultSet.getTimestamp("createddate"));
			student.setCreatedBy(resultSet.getString("createdby"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				student.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				student.setModifiedBy(resultSet.getString("modifiedby"));
			}

			return student;
		} catch (SQLException e) {
			return null;
		}	
	}
}
