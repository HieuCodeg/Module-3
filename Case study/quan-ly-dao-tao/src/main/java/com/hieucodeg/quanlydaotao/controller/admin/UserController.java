package com.hieucodeg.quanlydaotao.controller.admin;

import com.hieucodeg.quanlydaotao.dao.ISubjectDAO;
import com.hieucodeg.quanlydaotao.dao.IUserDAO;
import com.hieucodeg.quanlydaotao.model.StudentModel;
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

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {
    @Inject
    private IUserDAO iUserDAO;
    @Inject
    private ISubjectDAO iSubjectDAO;
    @Override
    public void init() throws ServletException {
        if(this.getServletContext().getAttribute("listSubject")==null) {
            this.getServletContext().setAttribute("listSubject",iSubjectDAO.findALL() );
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
                case "login":

                    break;
                case "logout":

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
                case "":

                    break;
                default:
                    loadPage(req, resp);
                    break;
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void loadPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        if (finder == null) {
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

}
