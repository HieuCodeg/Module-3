package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.TeacherClassMapper;
import com.hieucodeg.quanlydaotao.model.ClassModel;
import com.hieucodeg.quanlydaotao.model.TeacherClassModel;

import java.util.ArrayList;
import java.util.List;

public class TeacherClassDAO extends AbstractDAO<TeacherClassModel> implements ITeacherClassDAO {

    private static final String SELECT_CLASS = "SELECT * FROM TEACHERCLASS AS T INNER JOIN CLASSED AS C WHERE T.IDCLASS = C.CID";

    @Override
    public List<TeacherClassModel> findALL() {
        List<TeacherClassModel> list = query(SELECT_CLASS, new TeacherClassMapper());
        return list;

    }

    @Override
    public List<Long> findClass(Long idTeacher, List<ClassModel> listGrade, List<TeacherClassModel> list ) {
        List<Long> result = new ArrayList<>();
        for (TeacherClassModel item : list) {
            if (idTeacher == item.getIdTeacher()) {
                for (ClassModel classModel : listGrade) {
                    if (item.getIdClass().equals(classModel.getId())) {
                        result.add(classModel.getId());
                    }
                }
            }
        }
        return result;
    }

}
