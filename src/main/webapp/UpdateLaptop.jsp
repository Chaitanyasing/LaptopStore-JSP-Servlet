<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("AdminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Laptop</title>

<link rel="stylesheet" href="css/updatelaptop.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">

<div class="box">

<h1>✏ Update Laptop</h1>

<p>Update Laptop Information</p>

<form action="UpdateLaptop" method="post">

<div class="inputBox">
<input type="number" name="id" required>
<label>Laptop ID</label>
</div>

<div class="inputBox">
<input type="text" name="brand" required>
<label>Brand</label>
</div>

<div class="inputBox">
<input type="text" name="model" required>
<label>Model</label>
</div>

<div class="inputBox">
<input type="text" name="processor" required>
<label>Processor</label>
</div>

<div class="inputBox">
<input type="text" name="ram" required>
<label>RAM</label>
</div>

<div class="inputBox">
<input type="text" name="ssd" required>
<label>SSD</label>
</div>

<div class="inputBox">
<input type="text" name="graphics" required>
<label>Graphics Card</label>
</div>

<div class="inputBox">
<input type="number" name="price" required>
<label>Price</label>
</div>

<div class="inputBox">
<input type="text" name="image" required>
<label>Image URL</label>
</div>

<input type="submit" value="Update Laptop" class="btn">

</form>

<div class="bottom">

<a href="AdminHome.jsp">⬅ Back to Dashboard</a>

</div>

</div>

</div>

</body>
</html>