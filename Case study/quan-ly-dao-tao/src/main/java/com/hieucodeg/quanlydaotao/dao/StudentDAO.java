package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.StudentMapper;
import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;

import java.util.List;

public class StudentDAO extends AbstractDAO<StudentModel> implements IStudentDAO {
    private static final String SELECT_STUDENTS = "SELECT * FROM STUDENTS AS S INNER JOIN CLASSED AS C ON S.CLASSID = C.CID";
    private static final String SELECT_STUDENT_EDIT = "SELECT * FROM STUDENTS AS S INNER JOIN CLASSED AS C ON S.CLASSID = C.CID WHERE ID = ?";
    private static final String CHECK_PHONE = "select count(phone) from students where phone = ? and id != ?";
    private static final String CHECK_EMAIL = "select count(email) from students where email = ? and id != ?";
    private static final String UPDATE_STUDENT = "UPDATE `education`.`students` SET `name` = ?, `gender` = ? , `birthday` = ?, `phone` = ?, `classid` = ?, `email` = ?, `modifieddate` = CURRENT_TIMESTAMP, `modifiedby` = ? WHERE (`id` = ?)";
    private static final String INSERT_STUDENT = " INSERT INTO `education`.`students` (`name`, `gender`, `birthday`, `phone`, `classid`, `email`, `createdby`) VALUES (?,?,?,?,?,?,?)";
    private static final String DELETE_STUDENT = "DELETE FROM `education`.`students` WHERE (`id` = ?)";
    @Override
    public List<StudentModel> findAll(Integer offset, Integer limit ,String sortName, String sortBy) {
        String sql = SELECT_STUDENTS +" ORDER BY "+sortName +" " + sortBy +" LIMIT "+ offset + ", " + limit;

        List<StudentModel> students = query(sql, new StudentMapper());
        return students;
    }

    @Override
    public List<StudentModel> findStudentList(Integer offset, Integer limit, String sortName, String sortBy, String finderName) {
        String sql = SELECT_STUDENTS + " where id like '%" +finderName +"%' or name like '%"+finderName+
                "%' or birthday like '%"+finderName+ "%' or phone like '%"+finderName+"%' or grade like '%"+finderName+
                "%' or email like '%"+finderName+"%'";
        sql = sql +" ORDER BY "+sortName +" " + sortBy +" LIMIT "+ offset + ", " + limit;

        List<StudentModel> students = query(sql, new StudentMapper());
        return students;
    }

    @Override
    public int getTotalItem(String finderName) {
        String sql;
        if (finderName.equals("")) {
            sql = "SELECT count(*) FROM students";
        } else {
            sql = "SELECT count(*) FROM STUDENTS AS S INNER JOIN CLASSED AS C ON S.CLASSID = C.CID" + " where id like '%" +finderName +"%' or name like '%"+finderName+
                    "%' or birthday like '%"+finderName+ "%' or phone like '%"+finderName+"%' or grade like '%"+finderName+
                    "%' or email like '%"+finderName+"%'";
        }

        return count(sql);
    }

    @Override
    public StudentModel findStudent(Long id) {
        List<StudentModel> students = query(SELECT_STUDENT_EDIT, new StudentMapper(), id);
        return students.get(0);
    }

    @Override
    public boolean checkPhone(String phoneNumber, Long id) {
        int checkor = count(CHECK_PHONE,phoneNumber, id);
        if (checkor != 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean checkEmail(String email, Long id) {
        int checkor = count(CHECK_EMAIL,email, id);
        if (checkor != 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void update(StudentModel studentModel, UserModel userModel) {

        String name = studentModel.getName();
        Integer gender = studentModel.getGender();
        String birthday = String.valueOf(studentModel.getBirthday());
        String phoneNumber = studentModel.getPhoneNumber();
        Integer grade = studentModel.getIdGrade();
        String email = studentModel.getEmail();
        String userName = userModel.getFullName();
        Long id = studentModel.getId();
        update(UPDATE_STUDENT,name,gender,birthday,phoneNumber,grade,email,userName,id);
    }

    @Override
    public void insert(StudentModel studentModel, UserModel userModel) {
        String name = studentModel.getName();
        Integer gender = studentModel.getGender();
        String birthday = String.valueOf(studentModel.getBirthday());
        String phoneNumber = studentModel.getPhoneNumber();
        Integer grade = studentModel.getIdGrade();
        String email = studentModel.getEmail();
        String userName = userModel.getFullName();
        update(INSERT_STUDENT,name,gender,birthday,phoneNumber,grade,email,userName);

    }

    @Override
    public void delete(Long id, UserModel userModel) {
        update(DELETE_STUDENT,id);
    }
}
