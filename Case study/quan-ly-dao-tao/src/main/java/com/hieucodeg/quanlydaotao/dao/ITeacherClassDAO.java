package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.model.ClassModel;
import com.hieucodeg.quanlydaotao.model.TeacherClassModel;

import java.util.List;

public interface ITeacherClassDAO extends GenericDAO<TeacherClassModel>{
    List<TeacherClassModel> findALL();
    List<Long> findClass(Long idTeacher, List<ClassModel> listGrade,List<TeacherClassModel> list );
}
