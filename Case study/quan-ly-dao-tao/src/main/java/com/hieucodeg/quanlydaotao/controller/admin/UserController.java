package com.hieucodeg.quanlydaotao.controller.admin;

import com.hieucodeg.quanlydaotao.dao.IRodeDAO;
import com.hieucodeg.quanlydaotao.dao.ISubjectDAO;
import com.hieucodeg.quanlydaotao.dao.ITeacherClassDAO;
import com.hieucodeg.quanlydaotao.dao.IUserDAO;
import com.hieucodeg.quanlydaotao.model.*;
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
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {
    @Inject
    private IUserDAO iUserDAO;
    @Inject
    private ISubjectDAO iSubjectDAO;

    @Inject
    private ITeacherClassDAO iTeacherClassDAO;


    @Override
    public void init() throws ServletException {
        if(this.getServletContext().getAttribute("listSubject")==null) {
            this.getServletContext().setAttribute("listSubject",iSubjectDAO.findALL() );
        }
        this.getServletContext().setAttribute("listTeacherClass",iTeacherClassDAO.findALL() );
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    loadEditPage(req,resp);
                    break;
                case "insert":
                    loadInsertPage(req,resp);
                    break;
                case "delete":
                    deleteUser(req,resp);
                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "information":
                        loadSearchPage(req,resp);
                    break;
                case "edit":
                    checkInformation(req,resp);
                    break;
                case "insert":
                    insertUser(req,resp);
                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException | ParseException e) {
            throw new RuntimeException(e);
        }
    }




    private void loadPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletContext().setAttribute("listTeacherClass",iTeacherClassDAO.findALL() );
        UserModel userModel = new UserModel();
        userModel.setVisiblePage(5);
        userModel.setPage(1);
        userModel.setSortName("id");
        userModel.setSortBy("asc");
        Integer offset = (userModel.getPage() - 1) * userModel.getVisiblePage();
        userModel.setListResult(iUserDAO.findAll(offset, userModel.getVisiblePage(),userModel.getSortName(), userModel.getSortBy()));
        userModel.setTotalItem(iUserDAO.getTotalItem(""));
        userModel.setTotalPage((int) Math.ceil((double) userModel.getTotalItem() / userModel.getVisiblePage()));
        req.setAttribute("userModel", userModel);

        String message = req.getParameter("message");
        req.setAttribute("message",message);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userList.jsp");
        rd.forward(req, resp);
    }
    private void loadSearchPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel userModel = new UserModel();
        this.getServletContext().setAttribute("listTeacherClass",iTeacherClassDAO.findALL() );

        String paged = req.getParameter("page");
        Integer visiblePage = Integer.parseInt(req.getParameter("visiblePage"));
        userModel.setVisiblePage(visiblePage);

        if (paged != null) {
            userModel.setPage(Integer.parseInt(paged));
        } else {
            userModel.setPage(1);
        }
        String finder = req.getParameter("finder");
        req.setAttribute("finder",finder);
        userModel.setSortName(req.getParameter("sortName"));
        userModel.setSortBy(req.getParameter("sortBy"));
        Integer offset = (userModel.getPage() - 1) * userModel.getVisiblePage();
        if (finder == null || finder == "") {
            userModel.setListResult(iUserDAO.findAll(offset, visiblePage,userModel.getSortName(), userModel.getSortBy()));
            userModel.setTotalItem(iUserDAO.getTotalItem(""));
        } else {
            userModel.setListResult(iUserDAO.findUserList(offset, visiblePage,userModel.getSortName(), userModel.getSortBy(),finder));
            userModel.setTotalItem(iUserDAO.getTotalItem(finder));
        }


        userModel.setTotalPage((int) Math.ceil((double) userModel.getTotalItem() / userModel.getVisiblePage()));

        req.setAttribute("userModel", userModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userList.jsp");
        rd.forward(req, resp);
    }

    private void loadEditPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletContext().setAttribute("listTeacherClass",iTeacherClassDAO.findALL() );
        Long id = Long.parseLong(req.getParameter("id"));
        UserModel userModel = iUserDAO.findUserEdit(id);
        List<ClassModel> listGrade = (List<ClassModel>) this.getServletContext().getAttribute("listGrade");
        List<TeacherClassModel> listTeacherClass = (List<TeacherClassModel>) this.getServletContext().getAttribute("listTeacherClass");
        List<Long> listIdClassTeach = iTeacherClassDAO.findClass(id,listGrade,listTeacherClass);


        req.setAttribute("listIdClassTeach",listIdClassTeach);
        req.setAttribute("userModel",userModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userEdit.jsp");
        rd.forward(req, resp);
    }

    private void checkInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
        UserModel userLogin = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
        HashMap<String,String> errors = new HashMap<>();
        UserModel userModel = new UserModel();
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userEdit.jsp");
        try {
            Long id = Long.parseLong(req.getParameter("id"));
            String fullName = req.getParameter("fullName");
            Integer gender = Integer.valueOf(req.getParameter("gender"));
            String birthday = req.getParameter("birthday");
            Long roleId = Long.valueOf(req.getParameter("role"));
            Integer idSubject = Integer.valueOf(req.getParameter("subject"));

            String listClassTeach[]  = req.getParameterValues("teacherClass");

            userModel = iUserDAO.findUserEdit(id);

            String image;
            String checkImage = req.getParameter("checkImage");
            if (checkImage == "" || checkImage == null) {
                image = req.getParameter("avatar");
            } else {
                image = checkImage;
            }

            userModel.setImage(image);

            if (userLogin.getId() == id) {
                String userName = req.getParameter("userName");
                String password = req.getParameter("password");

                if (Validex.checkUserName("Tên đăng nhập",userName)== null) {
                    if (iUserDAO.checkUserName(userName,id)) {
                        errors.put("userName", "Tên đăng nhập đã tồn tại");
                    } else {
                        userModel.setUserName(userName);
                    }
                } else {
                    errors.put("userName",Validex.checkUserName("Tên đăng nhập",userName));
                }

                if (Validex.checkPassword("Mật khẩu",password)== null) {
                    userModel.setPassword(password);
                } else {
                    errors.put("password",Validex.checkPassword("Mật khẩu",password));
                }
            }

            if (Validex.checkEmpty("Tên",fullName)== null) {
                userModel.setFullName(fullName);
            } else {
                errors.put("fullName",Validex.checkEmpty("Tên",fullName));
            }

            if (gender != 0 && gender != 1) {
                errors.put("gender", "Mã giới tính không hợp lệ");
            } else {
                userModel.setGender(gender);
            }

            if (Validex.checkBirthday("Ngày sinh",birthday)== null) {
                userModel.setBirthday(Date.valueOf(birthday));
            } else {
                errors.put("birthday",Validex.checkBirthday("Ngày sinh",birthday));
            }

            if (roleId != 1 && roleId != 2) {
                errors.put("role", "Quyền truy cập không hợp lệ");
            } else {
                userModel.setRoleId(roleId);
            }

            List<SubjectModel> listSubject = (List<SubjectModel>) this.getServletContext().getAttribute("listSubject");
            if (idSubject < 1 || idSubject > listSubject.size()) {
                errors.put("subject", "Mã môn học không hợp lệ");
            } else {
                userModel.setIdSubject(idSubject);
            }

            List<ClassModel> listClass = (List<ClassModel>) this.getServletContext().getAttribute("listGrade");
            List<Integer> listIdClass = new ArrayList<>();
            for (int i = 0; i < listClassTeach.length; i++) {
                if (Integer.valueOf(listClassTeach[i]) < 1 ||  Integer.valueOf(listClassTeach[i]) > listClass.size()) {
                    errors.put("teacherClass", "Mã lớp học không hợp lệ");
                    break;
                }
                listIdClass.add(Integer.valueOf(listClassTeach[i]));

            }

            if (errors.isEmpty()) {
                    iUserDAO.update(userModel,userLogin,listIdClass);
                resp.sendRedirect("/admin-user?message=updateSuccess");
            } else {
                req.setAttribute("userModel", userModel);
                req.setAttribute("errors", errors);
                rd.forward(req, resp);
            }
        } catch (Exception e){
            Long id = Long.parseLong(req.getParameter("id"));
            userModel = iUserDAO.findUserEdit(id);
            errors.put("format","Định dạng của 1 số trường không hợp lệ");
            req.setAttribute("errors", errors);
            req.setAttribute("userModel", userModel);

            rd.forward(req, resp);
        }
    }
    private void loadInsertPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userEdit.jsp");
        rd.forward(req, resp);
    }
    private void insertUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel userLogin = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
        HashMap<String,String> errors = new HashMap<>();
        UserModel userModel = new UserModel();
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/userEdit.jsp");
        try {

            String fullName = req.getParameter("fullName");
            Integer gender = Integer.valueOf(req.getParameter("gender"));
            String birthday = req.getParameter("birthday");
            Long roleId = Long.valueOf(req.getParameter("role"));
            Integer idSubject = Integer.valueOf(req.getParameter("subject"));

            String listClassTeach[]  = req.getParameterValues("teacherClass");

            String image;
            String checkImage = req.getParameter("checkImage");
            if (checkImage == "" || checkImage == null) {
                image = req.getParameter("avatar");
            } else {
                image = checkImage;
            }

            userModel.setImage(image);


            String userName = req.getParameter("userName");
            String password = req.getParameter("password");

            if (Validex.checkUserName("Tên đăng nhập",userName)== null) {
                if (iUserDAO.checkUserName(userName,0L)) {
                    errors.put("userName", "Tên đăng nhập đã tồn tại");
                } else {
                    userModel.setUserName(userName);
                }
            } else {
                    errors.put("userName",Validex.checkUserName("Tên đăng nhập",userName));
            }

            if (Validex.checkPassword("Mật khẩu",password)== null) {
                    userModel.setPassword(password);
            } else {
                    errors.put("password",Validex.checkPassword("Mật khẩu",password));
            }


            if (Validex.checkEmpty("Tên",fullName)== null) {
                userModel.setFullName(fullName);
            } else {
                errors.put("fullName",Validex.checkEmpty("Tên",fullName));
            }

            if (gender != 0 && gender != 1) {
                errors.put("gender", "Mã giới tính không hợp lệ");
            } else {
                userModel.setGender(gender);
            }

            if (Validex.checkBirthday("Ngày sinh",birthday)== null) {
                userModel.setBirthday(Date.valueOf(birthday));
            } else {
                errors.put("birthday",Validex.checkBirthday("Ngày sinh",birthday));
            }

            if (roleId != 1 && roleId != 2) {
                errors.put("role", "Quyền truy cập không hợp lệ");
            } else {
                userModel.setRoleId(roleId);
            }

            List<SubjectModel> listSubject = (List<SubjectModel>) this.getServletContext().getAttribute("listSubject");
            if (idSubject < 1 || idSubject > listSubject.size()) {
                errors.put("subject", "Mã môn học không hợp lệ");
            } else {
                userModel.setIdSubject(idSubject);
            }

            List<ClassModel> listClass = (List<ClassModel>) this.getServletContext().getAttribute("listGrade");
            List<Integer> listIdClass = new ArrayList<>();
            for (int i = 0; i < listClassTeach.length; i++) {
                if (Integer.valueOf(listClassTeach[i]) < 1 ||  Integer.valueOf(listClassTeach[i]) > listClass.size()) {
                    errors.put("teacherClass", "Mã lớp học không hợp lệ");
                    break;
                }
                listIdClass.add(Integer.valueOf(listClassTeach[i]));

            }

            if (errors.isEmpty()) {
                iUserDAO.insert(userModel,userLogin,listIdClass);
                resp.sendRedirect("/admin-user?message=updateSuccess");
            } else {
                req.setAttribute("userModel", userModel);
                req.setAttribute("errors", errors);
                rd.forward(req, resp);
            }
        } catch (Exception e){

            errors.put("format","Định dạng của 1 số trường không hợp lệ");
            req.setAttribute("errors", errors);
            req.setAttribute("userModel", userModel);

            rd.forward(req, resp);
        }
    }
    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        UserModel userLogin = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
        iUserDAO.delete(id,userLogin);
        resp.sendRedirect("/admin-user?message=updateSuccess");
    }

}
