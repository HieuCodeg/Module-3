package com.hieucodeg.quanlydaotao.controller.admin;

import com.hieucodeg.quanlydaotao.dao.IClassDAO;
import com.hieucodeg.quanlydaotao.dao.IStudentDAO;
import com.hieucodeg.quanlydaotao.model.ClassModel;
import com.hieucodeg.quanlydaotao.model.StudentModel;
import com.hieucodeg.quanlydaotao.model.UserModel;
import com.hieucodeg.quanlydaotao.utils.SessionUtil;
import com.hieucodeg.quanlydaotao.utils.Validex;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;


@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

    @Inject
    private IStudentDAO iStudentDAO;

    @Inject
    private IClassDAO iClassDAO;

    @Override
    public void init() throws ServletException {
        if(this.getServletContext().getAttribute("listGrade")==null) {
            this.getServletContext().setAttribute("listGrade", iClassDAO.findALL());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "infomation":
                    loadStudentsInforGet(req, resp);
                    break;
                case "edit":
                    loadEditPage(req,resp);
                    break;
                case "insert":
                    loadInsertPage(req,resp);
                    break;
                case "delete":
                    deleteStudent(req,resp);
                    break;
                case "logout":
                    SessionUtil.getInstance().removeValue(req, "USERMODEL");
                    resp.sendRedirect(req.getContextPath() + "/trang-chu");
                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
        iStudentDAO.delete(id,userModel);
        resp.sendRedirect("/admin-home?action=infomation&message=updateSuccess");
    }

    private void loadInsertPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit.jsp");
        rd.forward(req, resp);
    }

    private void loadEditPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));
        StudentModel studentModel = iStudentDAO.findStudent(id);

        req.setAttribute("studentModel",studentModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit.jsp");
        rd.forward(req, resp);
    }

    private void loadStudentsInforGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        StudentModel studentModel = new StudentModel();
        studentModel.setVisiblePage(10);
        studentModel.setPage(1);
        studentModel.setSortName("id");
        studentModel.setSortBy("asc");
        Integer offset = (studentModel.getPage() - 1) * studentModel.getVisiblePage();
        studentModel.setListResult(iStudentDAO.findAll(offset, studentModel.getVisiblePage(),studentModel.getSortName(), studentModel.getSortBy()));
        studentModel.setTotalItem(iStudentDAO.getTotalItem(""));
        studentModel.setTotalPage((int) Math.ceil((double) studentModel.getTotalItem() / studentModel.getVisiblePage()));
        req.setAttribute("studentModel", studentModel);

        String message = req.getParameter("message");
        req.setAttribute("message",message);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/studentsList.jsp");
        rd.forward(req, resp);
    }

    private void loadPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "infomation":
                    loadStudentsInforPost(req, resp);
                    break;
                case "edit":
                    checkInformation(req,resp);
                    break;
                case "insert":
                    insertStudent(req,resp);
                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String,String> errors = new HashMap<>();
        StudentModel studentModel = new StudentModel();
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit.jsp");
        try {
            String name = req.getParameter("name");
            Integer gender = Integer.valueOf(req.getParameter("gender"));
            String birthday = req.getParameter("birthday");
            String phoneNumber = req.getParameter("phoneNumber");
            String email = req.getParameter("email");
            Integer grade = Integer.parseInt(req.getParameter("grade"));


            if (Validex.checkEmpty("Tên",name)== null) {
                studentModel.setName(name);
            } else {
                errors.put("name",Validex.checkEmpty("Tên",name));
            }

            if (gender != 0 && gender != 1) {
                errors.put("gender", "Mã giới tính không hợp lệ");
            } else {
                studentModel.setGender(gender);
            }

            if (Validex.checkBirthday("Ngày sinh",birthday)== null) {
                studentModel.setBirthday(Date.valueOf(birthday));
            } else {
                errors.put("birthday",Validex.checkBirthday("Ngày sinh",birthday));
            }

            if (Validex.checkPhoneNumber("SĐT",phoneNumber)== null) {
                if (iStudentDAO.checkPhone(phoneNumber, 0L)) {
                    errors.put("phoneNumber","SĐT đã tồn tại");
                } else {
                    studentModel.setPhoneNumber(phoneNumber);
                }
            } else {
                errors.put("phoneNumber",Validex.checkPhoneNumber("SĐT",phoneNumber));
            }

            if (Validex.checkEmail("Email",email)== null) {
                if (iStudentDAO.checkEmail(email,0L)) {
                    errors.put("email", "Email đã tồn tại");
                } else {
                    studentModel.setEmail(email);
                }
            } else {
                errors.put("email",Validex.checkEmail("Email",email));
            }
            List<ClassModel> listClass = (List<ClassModel>) this.getServletContext().getAttribute("listGrade");
            if (grade < 1 || grade > listClass.size() -1) {
                errors.put("grade","Mã lớp không hợp lệ");
            } else {
                studentModel.setIdGrade(grade);
            }

            if (errors.isEmpty()) {
                UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
                iStudentDAO.insert(studentModel,userModel);
                resp.sendRedirect("/admin-home?action=infomation&message=updateSuccess");
            } else {
                req.setAttribute("studentModel", studentModel);
                req.setAttribute("errors", errors);
                rd.forward(req, resp);
            }
        } catch (Exception e){
            errors.put("format","Định dạng của 1 số trường không hợp lệ");
            req.setAttribute("errors", errors);
            rd.forward(req, resp);
        }
    }

    private void checkInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {

        HashMap<String,String> errors = new HashMap<>();
        StudentModel studentModel = new StudentModel();
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit.jsp");
        try {
            Long id = Long.parseLong(req.getParameter("id"));
            String name = req.getParameter("name");
            Integer gender = Integer.valueOf(req.getParameter("gender"));
            String birthday = req.getParameter("birthday");
            String phoneNumber = req.getParameter("phoneNumber");
            String email = req.getParameter("email");
            Integer grade = Integer.parseInt(req.getParameter("grade"));

            studentModel = iStudentDAO.findStudent(id);

            if (Validex.checkEmpty("Tên",name)== null) {
                studentModel.setName(name);
            } else {
                errors.put("name",Validex.checkEmpty("Tên",name));
            }

            if (gender != 0 && gender != 1) {
                errors.put("gender", "Mã giới tính không hợp lệ");
            } else {
                studentModel.setGender(gender);
            }

            if (Validex.checkBirthday("Ngày sinh",birthday)== null) {
                studentModel.setBirthday(Date.valueOf(birthday));
            } else {
                errors.put("birthday",Validex.checkBirthday("Ngày sinh",birthday));
            }

            if (Validex.checkPhoneNumber("SĐT",phoneNumber)== null) {
                if (iStudentDAO.checkPhone(phoneNumber, id)) {
                    errors.put("phoneNumber","SĐT đã tồn tại");
                } else {
                    studentModel.setPhoneNumber(phoneNumber);
                }
            } else {
                errors.put("phoneNumber",Validex.checkPhoneNumber("SĐT",phoneNumber));
            }

            if (Validex.checkEmail("Email",email)== null) {
                if (iStudentDAO.checkEmail(email,id)) {
                    errors.put("email", "Email đã tồn tại");
                } else {
                    studentModel.setEmail(email);
                }
            } else {
                errors.put("email",Validex.checkEmail("Email",email));
            }
            List<ClassModel> listClass = (List<ClassModel>) this.getServletContext().getAttribute("listGrade");
            if (grade < 1 || grade > listClass.size() -1) {
                errors.put("grade","Mã lớp không hợp lệ");
            } else {
                studentModel.setIdGrade(grade);
            }

            if (errors.isEmpty()) {
                UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
                iStudentDAO.update(studentModel,userModel);
                resp.sendRedirect("/admin-home?action=infomation&message=updateSuccess");
            } else {
                req.setAttribute("studentModel", studentModel);
                req.setAttribute("errors", errors);
                rd.forward(req, resp);
            }
        } catch (Exception e){
            Long id = Long.parseLong(req.getParameter("id"));
            studentModel = iStudentDAO.findStudent(id);
            errors.put("format","Định dạng của 1 số trường không hợp lệ");
            req.setAttribute("errors", errors);
            req.setAttribute("studentModel", studentModel);

            rd.forward(req, resp);
        }
    }

    private void loadStudentsInforPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentModel studentModel = new StudentModel();

        String paged = req.getParameter("page");
        Integer visiblePage = Integer.parseInt(req.getParameter("visiblePage"));
        studentModel.setVisiblePage(visiblePage);

        if (paged != null) {
            studentModel.setPage(Integer.parseInt(paged));
        } else {
            studentModel.setPage(1);
        }
        String finder = req.getParameter("finder");
        req.setAttribute("finder",finder);
        studentModel.setSortName(req.getParameter("sortName"));
        studentModel.setSortBy(req.getParameter("sortBy"));
        Integer offset = (studentModel.getPage() - 1) * studentModel.getVisiblePage();
        if (finder == null) {
            studentModel.setListResult(iStudentDAO.findAll(offset, visiblePage,studentModel.getSortName(), studentModel.getSortBy()));
            studentModel.setTotalItem(iStudentDAO.getTotalItem(""));
        } else {
            studentModel.setListResult(iStudentDAO.findStudentList(offset, visiblePage,studentModel.getSortName(), studentModel.getSortBy(),finder));
            studentModel.setTotalItem(iStudentDAO.getTotalItem(finder));
        }


        studentModel.setTotalPage((int) Math.ceil((double) studentModel.getTotalItem() / studentModel.getVisiblePage()));

        req.setAttribute("studentModel", studentModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/studentsList.jsp");
        rd.forward(req, resp);
    }
}
