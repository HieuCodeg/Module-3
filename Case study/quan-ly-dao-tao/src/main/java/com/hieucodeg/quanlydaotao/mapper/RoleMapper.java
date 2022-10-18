package com.hieucodeg.quanlydaotao.mapper;

import com.hieucodeg.quanlydaotao.model.RoleModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements RowMapper<RoleModel>{
    @Override
    public RoleModel mapRow(ResultSet resultSet) {
        try {
            RoleModel roleModel = new RoleModel();
            roleModel.setId(resultSet.getLong(1));
            roleModel.setName(resultSet.getString(2));
            roleModel.setCode(resultSet.getString(3));

            return roleModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
