package com.hieucodeg.quanlydaotao.model;

public class TeacherClassModel extends AbstractModel<TeacherClassModel>{
    private Long idTeacher;
    private Long idClass;

    public TeacherClassModel(Long idTeacher, Long idClass) {
        this.idTeacher = idTeacher;
        this.idClass = idClass;
    }

    public TeacherClassModel() {
    }

    public Long getIdTeacher() {
        return idTeacher;
    }

    public void setIdTeacher(Long idTeacher) {
        this.idTeacher = idTeacher;
    }

    public Long getIdClass() {
        return idClass;
    }

    public void setIdClass(Long idClass) {
        this.idClass = idClass;
    }
}
