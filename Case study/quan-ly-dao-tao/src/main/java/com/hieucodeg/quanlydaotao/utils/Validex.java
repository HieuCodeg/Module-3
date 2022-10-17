package com.hieucodeg.quanlydaotao.utils;


import java.util.regex.Pattern;

public class Validex {

    public static final String BIRTHDAY_REGEX = "^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$";
    public static final String PHONE_REGEX = "^[0][1-9][0-9]{8}$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9.]*[A-Za-z0-9]+@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";

    public static boolean isBirthdayValid(String birthday) {
        return Pattern.compile(BIRTHDAY_REGEX).matcher(birthday).matches();
    }
    public static boolean isPhoneValid(String birthday) {
        return Pattern.compile(PHONE_REGEX).matcher(birthday).matches();
    }
    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }

    public static String checkEmpty(String nameCheck, String string) {
        String result = nameCheck;
        if (string == null || string.trim().equals("")) {
            result += " không được để trống";
            return result;
        } else {
            return null;
        }
    }
    public static String checkBirthday(String nameCheck, String string) {
        String result = nameCheck;
        if (string == null || string.trim().equals("")) {
            result += " không được để trống";
            return result;
        } else if (!isBirthdayValid(string)) {
            result += " không đúng định dạng";
            return result;
        } else {
            return null;
        }
    }
    public static String checkPhoneNumber(String nameCheck, String string) {
        String result = nameCheck;
        if (string == null || string.trim().equals("")) {
            result += " không được để trống";
            return result;
        } else if (!isPhoneValid(string)) {
            result += " không đúng định dạng";
            return result;
        } else {
            return null;
        }
    }
    public static String checkEmail(String nameCheck, String string) {
        String result = nameCheck;
        if (string == null || string.trim().equals("")) {
            result += " không được để trống";
            return result;
        } else if (!isEmailValid(string)) {
            result += " không đúng định dạng";
            return result;
        } else {
            return null;
        }
    }
}
