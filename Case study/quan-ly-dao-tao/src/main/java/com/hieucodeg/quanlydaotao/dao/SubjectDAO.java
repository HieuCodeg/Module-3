package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.SubjectMapper;
import com.hieucodeg.quanlydaotao.model.SubjectModel;

import java.util.List;

public class SubjectDAO extends AbstractDAO<SubjectModel> implements ISubjectDAO{
    private static final String SELECT_SUBJECT = "SELECT * FROM SUBJECT";
    @Override
    public List<SubjectModel> findALL() {
        List<SubjectModel> list = query(SELECT_SUBJECT, new SubjectMapper());
        return list;

    }
}
