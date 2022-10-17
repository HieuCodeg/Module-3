package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public interface IStudentDAO extends GenericDAO<StudentModel>{
    List<StudentModel> findAll(Integer offset, Integer limit, String sortName, String sortBy);
    List<StudentModel> findStudentList(Integer offset, Integer limit, String sortName, String sortBy, String finderName);
    int getTotalItem(String finderName);
    StudentModel findStudent(Long id);
    boolean checkPhone(String phoneNumber, Long id);
    boolean checkEmail(String email, Long id);
    void update(StudentModel studentModel, UserModel userModel);
    void insert(StudentModel studentModel, UserModel userModel);
    void delete(Long id, UserModel userModel);
}
