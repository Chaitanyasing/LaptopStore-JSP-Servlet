package com.laptopstore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteLaptop")
public class DeleteLaptop extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    private static final String USER = "root";
    private static final String PASS = "YOUR_DATABASE_PASSWORD";

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check Admin Session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "DELETE FROM laptops WHERE id=?";

            PreparedStatement pst = con.prepareStatement(sql);

            pst.setInt(1, id);

            int row = pst.executeUpdate();

            pst.close();
            con.close();

            if (row > 0) {

                response.sendRedirect("ViewLaptop.jsp");

            } else {

                response.setContentType("text/html");

                response.getWriter().println(
                        "<html><body style='font-family:Arial;text-align:center;padding-top:100px;'>"
                      + "<h2 style='color:red;'>Laptop ID Not Found!</h2>"
                      + "<br>"
                      + "<a href='DeleteLaptop.jsp'>Try Again</a>"
                      + "</body></html>");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error : " + e.getMessage() + "</h2>");

        }

    }
}
