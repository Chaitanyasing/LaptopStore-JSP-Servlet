<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account | Laptop Store</title>

<link rel="stylesheet" href="css/register.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">

    <div class="register-box">

        <h1>Create Account</h1>
        <p>Register to Buy Your Dream Laptop</p>

        <form action="Register" method="post">

            <div class="inputBox">
                <input type="text"
                       name="full_name"
                       placeholder=" "
                       required>
                <label>Full Name</label>
            </div>

            <div class="inputBox">
                <input type="text"
                       name="username"
                       placeholder=" "
                       required>
                <label>Username</label>
            </div>

            <div class="inputBox">
                <input type="email"
                       name="email"
                       placeholder=" "
                       required>
                <label>Email Address</label>
            </div>

            <div class="inputBox">
                <input type="password"
                       name="password"
                       placeholder=" "
                       required>
                <label>Password</label>
            </div>

            <div class="inputBox">
                <input type="password"
                       name="confirmPassword"
                       placeholder=" "
                       required>
                <label>Confirm Password</label>
            </div>

            <input type="submit"
                   value="CREATE ACCOUNT"
                   class="btn">

        </form>

        <div class="bottom">
            Already have an account?
            <a href="Index.jsp">Login</a>
        </div>

    </div>

</div>

</body>
</html>