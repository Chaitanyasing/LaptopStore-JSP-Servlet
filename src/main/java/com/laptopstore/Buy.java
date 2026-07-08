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

@WebServlet("/Buy")
public class Buy extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database Details
    private static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    private static final String USER = "root";
    private static final String PASS = "YOUR_DATABASE_PASSWORD";

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String customerName = request.getParameter("customerName");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        String brand = request.getParameter("brand");
        String model = request.getParameter("model");

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        double total = quantity * price;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO orders(username,customer_name,mobile,address,brand,model,quantity,price,total) VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, username);
            pst.setString(2, customerName);
            pst.setString(3, mobile);
            pst.setString(4, address);
            pst.setString(5, brand);
            pst.setString(6, model);
            pst.setInt(7, quantity);
            pst.setDouble(8, price);
            pst.setDouble(9, total);

            int row = pst.executeUpdate();

            pst.close();
            con.close();

            if (row > 0) {

                response.sendRedirect("Success.jsp");

            } else {

                response.getWriter().println("<h2>Order Failed!</h2>");

            }

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("<h2>" + e.getMessage() + "</h2>");

        }

    }
}
