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

@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database Details
    static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    static final String USER = "root";
    static final String PASS = "rawal324";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connection
            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            // SQL Query for role to switch
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                // Create Session
                HttpSession session = request.getSession();

                session.setAttribute("username", username);
                session.setAttribute("full_name", rs.getString("full_name"));
                
             // Badlav: Database se role nikalna (admin ya customer)
                String role = rs.getString("role");
                session.setAttribute("userRole", role);

                // Redirect to Home Page based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("AdminHome.jsp"); // Admin dashboard par bhejo
                } else {
                    response.sendRedirect("Home.jsp"); // Normal user home page par bhejo
                }

            } else {

                response.sendRedirect("Index.jsp?msg=invalid");

            }

            rs.close();
            pst.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println("<h2>" + e.getMessage() + "</h2>");

        }

    }

}