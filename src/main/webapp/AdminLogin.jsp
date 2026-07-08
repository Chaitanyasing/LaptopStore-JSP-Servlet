<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | Laptop Store</title>

<link rel="stylesheet" href="css/adminlogin.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>

<body>

<div class="container">

    <div class="login-box">

        <h1>👨‍💼 Admin Panel</h1>

        <p>Login to Manage Laptop Store</p>

        <form action="AdminLogin" method="POST">

            <div class="inputBox">
                <input type="text"
                       name="username"
                       placeholder=" "
                       required>
                <label>Admin Username</label>
            </div>

            <div class="inputBox">
                <input type="password"
                       name="password"
                       placeholder=" "
                       required>
                <label>Password</label>
            </div>

            <input type="submit"
                   value="LOGIN"
                   class="btn">

        </form>

        <div class="bottom">

            <a href="Index.jsp">⬅ Back to User Login</a>

        </div>

    </div>

</div>

</body>
</html>