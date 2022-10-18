package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.model.RoleModel;

import java.util.List;

public interface IRodeDAO extends GenericDAO<RoleModel>{
    List<RoleModel> findALL();
    String checkRole(Long roleId);
}
