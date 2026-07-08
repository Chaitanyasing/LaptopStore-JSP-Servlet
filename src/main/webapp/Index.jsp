<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Laptop Store | Login</title>

<link rel="stylesheet" href="css/login.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">

    <div class="login-box">

        <h1>💻 Laptop Store</h1>
        <p>Login to Buy Your Favorite Laptop</p>

        <% String msg = request.getParameter("msg"); %>

        <% if("invalid".equals(msg)){ %>
            <div class="error">
                Invalid Username or Password!
            </div>
        <% } %>

        <% if("logout".equals(msg)){ %>
            <div class="success">
                Logout Successful.
            </div>
        <% } %>

        <form action="Login" method="POST">

            <div class="inputBox">
                <input type="text"
                       name="username"
                       placeholder=" "
                       required>
                <label>Username</label>
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
            New Customer?
            <a href="Register.jsp">Create Account</a>
        </div>

    </div>

</div>

</body>
</html>