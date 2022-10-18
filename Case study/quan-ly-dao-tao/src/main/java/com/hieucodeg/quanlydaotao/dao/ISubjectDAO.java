package com.hieucodeg.quanlydaotao.dao;
import com.hieucodeg.quanlydaotao.model.SubjectModel;

import java.util.List;

public interface ISubjectDAO extends GenericDAO<SubjectModel>{
    List<SubjectModel> findALL();
}
