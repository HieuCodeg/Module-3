package com.hieucodeg.khac_hang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<KhachHang> listKH = new ArrayList<>();
        listKH.add(new KhachHang("Nguyễn Lung Linh", LocalDate.parse("2000-12-02"),"Huế","https://hinhgaixinh.com/wp-content/uploads/2022/03/anh-gai-xinh-hoc-sinh-tuyet-dep.jpg"));
        listKH.add(new KhachHang("Nguyễn Hồng Ân", LocalDate.parse("2000-12-02"),"Đà Nẵng","https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-71.jpg"));
        listKH.add(new KhachHang("Hà Thị Anh", LocalDate.parse("2000-12-02"),"Hà Nội","https://media.baodautu.vn/Images/chicuong/2019/07/27/mvl7y4jk.jpg"));
        listKH.add(new KhachHang("Hoàng Hậu", LocalDate.parse("2000-01-02"),"Sài Gòn","https://gentlenobra.com/wp-content/uploads/2021/11/anh-gai-xinh-trang-non-na.jpg"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        req.setAttribute("listKH",listKH);
        requestDispatcher.forward(req,resp);
    }
}
