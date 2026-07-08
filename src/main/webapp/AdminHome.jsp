<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 1. Role check karna
    String role = (String) session.getAttribute("userRole");
    if (role == null || !"admin".equalsIgnoreCase(role)) {
        response.sendRedirect("Index.jsp?msg=unauthorized");
        return; 
    }

    // 2. Variable declare karna (Isline ko dhyan se dekhein)
    String admin = (String) session.getAttribute("username"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/adminhome.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>

<header>

    <h2>💻 Laptop Store Admin</h2>

    <div>
        Welcome, 
        <b><%= admin %></b>

        <a href="Logout">Logout</a>
    </div>

</header>

<div class="container">

    <h1>Admin Dashboard</h1>

    <div class="cards">

        <div class="card">
            <h2>➕</h2>
            <h3>Add Laptop</h3>

            <a href="AddLaptop.jsp">Open</a>
        </div>

        <div class="card">
            <h2>🖥</h2>
            <h3>View Laptops</h3>

            <a href="ViewLaptop.jsp">Open</a>
        </div>

        <div class="card">
            <h2>✏</h2>
            <h3>Update Laptop</h3>

            <a href="UpdateLaptop.jsp">Open</a>
        </div>

        <div class="card">
            <h2>🗑</h2>
            <h3>Delete Laptop</h3>

            <a href="DeleteLaptop.jsp">Open</a>
        </div>

        <div class="card">
            <h2>📦</h2>
            <h3>Orders</h3>

            <a href="ViewOrders.jsp">Open</a>
        </div>

        <div class="card">
            <h2>👥</h2>
            <h3>Users</h3>

            <a href="ViewUsers.jsp">Open</a>
        </div>

    </div>

</div>

</body>
</html>