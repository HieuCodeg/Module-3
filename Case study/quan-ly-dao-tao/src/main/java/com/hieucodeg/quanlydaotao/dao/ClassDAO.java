package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.ClassMapper;
import com.hieucodeg.quanlydaotao.model.ClassModel;
import java.util.List;

public class ClassDAO extends AbstractDAO<ClassModel> implements IClassDAO{
    private static final String SELECT_CLASS = "SELECT * FROM CLASSED";
    @Override
    public List<ClassModel> findALL() {
        List<ClassModel> list = query(SELECT_CLASS, new ClassMapper());
        return list;

    }

}
