package com.hieucodeg.quanlydaotao.dao;


import com.hieucodeg.quanlydaotao.mapper.RoleMapper;
import com.hieucodeg.quanlydaotao.model.RoleModel;

import java.util.List;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRodeDAO{
    private static final String SELECT_ROLE = "SELECT * FROM ROLE";
    @Override
    public List<RoleModel> findALL() {
        List<RoleModel> list = query(SELECT_ROLE, new RoleMapper());
        return list;

    }

    @Override
    public String checkRole(Long roleId) {
        List<RoleModel> list = findALL();
        for (int i = 0; i < list.size(); i++) {
            if (roleId.equals(list.get(i).getId())) {
                return list.get(i).getCode();
            }
        }
        return null;
    }
}
