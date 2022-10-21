package com.hieucodeg.quanlydaotao.controller.user;

import com.hieucodeg.quanlydaotao.dao.ISubjectDAO;
import com.hieucodeg.quanlydaotao.dao.ITeacherClassDAO;
import com.hieucodeg.quanlydaotao.dao.IUserDAO;
import com.hieucodeg.quanlydaotao.model.ClassModel;
import com.hieucodeg.quanlydaotao.model.SubjectModel;
import com.hieucodeg.quanlydaotao.model.TeacherClassModel;
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
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(urlPatterns = {"/user-teacher"})
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

                case "edit":
                    checkInformation(req,resp);
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

        String message = req.getParameter("message");
        req.setAttribute("message",message);
        RequestDispatcher rd = req.getRequestDispatcher("/views/user/user.jsp");
        rd.forward(req, resp);
    }

    private void loadEditPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletContext().setAttribute("listTeacherClass",iTeacherClassDAO.findALL() );

        RequestDispatcher rd = req.getRequestDispatcher("/views/user/userEdit.jsp");
        rd.forward(req, resp);
    }

    private void checkInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
        UserModel userLogin = (UserModel) SessionUtil.getInstance().getValue(req,"USERMODEL");
        HashMap<String,String> errors = new HashMap<>();
        UserModel userModel = new UserModel();
        RequestDispatcher rd = req.getRequestDispatcher("/views/user/userEdit.jsp");
        try {
            Long id = Long.parseLong(req.getParameter("id"));
            String fullName = req.getParameter("fullName");
            Integer gender = Integer.valueOf(req.getParameter("gender"));
            String birthday = req.getParameter("birthday");



            userModel = iUserDAO.findUserEdit(id);


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



            if (errors.isEmpty()) {
                    iUserDAO.update(userModel,userLogin);
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



}
