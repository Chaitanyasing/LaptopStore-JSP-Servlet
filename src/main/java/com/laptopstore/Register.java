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

@WebServlet("/Register")
public class Register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database Details
    private static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    private static final String USER = "root";
    private static final String PASS = "rawal324";

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("full_name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check Password
        if (!password.equals(confirmPassword)) {

            response.getWriter().println(
                "<h2 style='color:red;text-align:center;'>Passwords do not match!</h2>"
                + "<center><a href='Register.jsp'>Try Again</a></center>"
            );
            return;
        }

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            // Insert Query
            String sql = "INSERT INTO users(full_name, username, email, password) VALUES(?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, fullname);
            pst.setString(2, username);
            pst.setString(3, email);
            pst.setString(4, password);

            int row = pst.executeUpdate();

            pst.close();
            con.close();

            if (row > 0) {

                // Registration Successful
                response.sendRedirect("Index.jsp");

            } else {

                response.getWriter().println("<h2>Registration Failed!</h2>");

            }

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("<h2>Error : " + e.getMessage() + "</h2>");

        }

    }
}