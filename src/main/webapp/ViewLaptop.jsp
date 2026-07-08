<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

String admin = (String)session.getAttribute("admin");



if(admin == null){

response.sendRedirect("AdminLogin.jsp");

return;

}



String DB_URL="jdbc:mysql://localhost:3307/LaptopStore";

String USER="root";

String PASS="rawal324";



Connection con=null;

PreparedStatement pst=null;

ResultSet rs=null;

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>View Laptops</title>

<link rel="stylesheet" href="css/viewlaptop.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>

<body>

<div class="container">

<h1>💻 Laptop Inventory</h1>

<a href="AdminHome.jsp" class="back">⬅ Dashboard</a>

<table>

<tr>

<th>ID</th>

<th>Brand</th>

<th>Model</th>

<th>Processor</th>

<th>RAM</th>

<th>SSD</th>

<th>Graphics</th>

<th>Price</th>

<th>Image</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(DB_URL,USER,PASS);

pst=con.prepareStatement("select * from laptops");

rs=pst.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("brand")%></td>

<td><%=rs.getString("model")%></td>

<td><%=rs.getString("processor")%></td>

<td><%=rs.getString("ram")%></td>

<td><%=rs.getString("ssd")%></td>

<td><%=rs.getString("graphics")%></td>

<td>₹ <%=rs.getDouble("price")%></td>

<td>
    <img src="laptop_images/<%= rs.getString("image") %>" width="100" height="70" alt="Laptop Photo">
</td>

</tr>

<%

}

}catch(Exception e){

out.println(e);

}

finally{

try{

if(rs!=null)rs.close();
if(pst!=null)pst.close();
if(con!=null)con.close();

}catch(Exception e){}

}

%>

</table>

</div>

</body>

</html>