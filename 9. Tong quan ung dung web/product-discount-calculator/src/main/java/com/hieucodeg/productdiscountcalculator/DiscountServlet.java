package com.hieucodeg.productdiscountcalculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Double listPrice = Double.valueOf(req.getParameter("listPrice"));
        Double discountPercent = Double.valueOf(req.getParameter("discountPercent"));
        Double discountAmount = listPrice * discountPercent *  0.01;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1> Discount Amount: " + discountAmount + " </h1>");
        writer.println("<h1> Discount Price: " + (listPrice - discountAmount) + " </h1>");

        writer.println("</html>");
    }
}
