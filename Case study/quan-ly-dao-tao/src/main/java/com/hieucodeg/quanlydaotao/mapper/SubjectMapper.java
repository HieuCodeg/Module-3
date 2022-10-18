package com.hieucodeg.quanlydaotao.mapper;

import com.hieucodeg.quanlydaotao.model.SubjectModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SubjectMapper implements RowMapper<SubjectModel>{
    @Override
    public SubjectModel mapRow(ResultSet resultSet) {
        try {
            SubjectModel subjectModel = new SubjectModel();
            subjectModel.setId(resultSet.getLong(1));
            subjectModel.setSubject(resultSet.getString(2));

            return subjectModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
