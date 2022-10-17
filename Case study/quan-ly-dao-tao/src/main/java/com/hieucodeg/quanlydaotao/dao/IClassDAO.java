package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.model.ClassModel;

import java.util.List;

public interface IClassDAO extends GenericDAO<ClassModel>{
    List<ClassModel> findALL();

}
