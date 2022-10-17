package com.hieucodeg.quanlydaotao.controller.web;


import com.hieucodeg.quanlydaotao.dao.IUserDAO;
import com.hieucodeg.quanlydaotao.model.UserModel;
import com.hieucodeg.quanlydaotao.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat"})
public class HomeController extends HttpServlet {

    @Inject
    private IUserDAO userDAO;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "login":
                    loginCheck(req, resp);
                    break;
                default:

                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "login":
                    login(req, resp);
                    break;
                case "logout":
                    SessionUtil.getInstance().removeValue(req, "USERMODEL");
                    resp.sendRedirect(req.getContextPath()+"/trang-chu");
                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String alert = req.getParameter("alert");
        String message = req.getParameter("message");
        if (message != null && alert != null) {
            req.setAttribute("message", resourceBundle.getString(message));
            req.setAttribute("alert", alert);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
        rd.forward(req, resp);
    }

    private void loadPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
        rd.forward(req, resp);
    }

    private void loginCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserModel model = userDAO.findUser(username, password, 1);

        if (model != null) {
            SessionUtil.getInstance().putValue(req, "USERMODEL", model);
            if (model.getRole().getCode().equals("USER")) {
                resp.sendRedirect(req.getContextPath()+"/trang-chu");
            } else if (model.getRole().getCode().equals("ADMIN")) {
                resp.sendRedirect(req.getContextPath()+"/admin-home");
            }
        } else {
            resp.sendRedirect(req.getContextPath()+"/dang-nhap?action=login&message=signing_invalid&alert=danger");
        }

    }


}
