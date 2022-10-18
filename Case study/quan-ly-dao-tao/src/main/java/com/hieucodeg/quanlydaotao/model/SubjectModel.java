package com.hieucodeg.quanlydaotao.model;

public class SubjectModel extends AbstractModel<SubjectModel>{
    private String subject;

    public SubjectModel(String subject) {
        this.subject = subject;
    }

    public SubjectModel() {
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
