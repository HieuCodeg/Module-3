package com.hieucodeg.quanlydaotao.model;

public class ClassModel extends AbstractModel<ClassModel>{

    private String grade;

    public ClassModel(String grade) {
        this.grade = grade;
    }

    public ClassModel() {
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
