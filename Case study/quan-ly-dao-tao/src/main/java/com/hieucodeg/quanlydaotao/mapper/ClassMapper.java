package com.hieucodeg.quanlydaotao.mapper;

import com.hieucodeg.quanlydaotao.model.ClassModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ClassMapper implements RowMapper<ClassModel>{
    @Override
    public ClassModel mapRow(ResultSet resultSet) {
        try {
            ClassModel classModel = new ClassModel();
            classModel.setId(resultSet.getLong(1));
            classModel.setGrade(resultSet.getString(2));

            return classModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
