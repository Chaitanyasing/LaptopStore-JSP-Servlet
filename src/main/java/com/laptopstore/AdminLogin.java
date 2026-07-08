package com.laptopstore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    private static final String USER = "root";
    private static final String PASS = "rawal324";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "SELECT * FROM admin WHERE username=? AND password=?";

            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("admin", username);

                response.sendRedirect("AdminHome.jsp");

            } else {

                response.setContentType("text/html");

                response.getWriter().println(
                        "<html><body style='font-family:Arial;text-align:center;padding-top:100px;'>"
                      + "<h2 style='color:red;'>Invalid Admin Username or Password!</h2>"
                      + "<br>"
                      + "<a href='AdminLogin.jsp'>Try Again</a>"
                      + "</body></html>");

            }

            rs.close();
            pst.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error : " + e.getMessage() + "</h2>");

        }

    }
}