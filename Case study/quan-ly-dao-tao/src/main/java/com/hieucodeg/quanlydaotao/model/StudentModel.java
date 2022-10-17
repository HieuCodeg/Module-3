package com.hieucodeg.quanlydaotao.model;

import java.sql.Date;

public class StudentModel extends AbstractModel<StudentModel> {
    private String name;
    private Integer gender;
    private Date birthday;
    private String email;
    private String phoneNumber;
    private Integer idGrade;

    public StudentModel(String name, Integer gender, Date birthday, String email, String phoneNumber, Integer idGrade) {
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.idGrade = idGrade;
    }

    public StudentModel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }


    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getIdGrade() {
        return idGrade;
    }

    public void setIdGrade(Integer idGrade) {
        this.idGrade = idGrade;
    }
}
