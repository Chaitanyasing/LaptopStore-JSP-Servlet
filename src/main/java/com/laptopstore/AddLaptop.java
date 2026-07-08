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

@WebServlet("/AddLaptop")
public class AddLaptop extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3307/LaptopStore";
    private static final String USER = "root";
    private static final String PASS = "rawal324";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        String Id = request.getParameter("id");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String processor = request.getParameter("processor");
        String ram = request.getParameter("ram");
        String ssd = request.getParameter("ssd");
        String graphics = request.getParameter("graphics");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO laptops(id,brand,model,processor,ram,ssd,graphics,price,image) VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, Id);
            pst.setString(2, brand);
            pst.setString(3, model);
            pst.setString(4, processor);
            pst.setString(5, ram);
            pst.setString(6, ssd);
            pst.setString(7, graphics);
            pst.setDouble(8, price);
            pst.setString(9, image);

            int row = pst.executeUpdate();

            pst.close();
            con.close();

            if (row > 0) {

                response.sendRedirect("ViewLaptop.jsp");

            } else {

                response.getWriter().println("<h2>Laptop Not Added!</h2>");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println("<h2>Error : " + e.getMessage() + "</h2>");

        }

    }
}