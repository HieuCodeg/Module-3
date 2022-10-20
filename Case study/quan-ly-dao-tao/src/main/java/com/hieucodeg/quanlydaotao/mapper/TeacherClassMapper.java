package com.hieucodeg.quanlydaotao.mapper;

import com.hieucodeg.quanlydaotao.model.TeacherClassModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherClassMapper implements RowMapper<TeacherClassModel>{
    @Override
    public TeacherClassModel mapRow(ResultSet resultSet) {
        try {
            TeacherClassModel teacherClassModel = new TeacherClassModel();
            teacherClassModel.setId(resultSet.getLong(1));
            teacherClassModel.setIdTeacher(resultSet.getLong(2));
            teacherClassModel.setIdClass(resultSet.getLong(3));

            return teacherClassModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
