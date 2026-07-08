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

<title>Customer Orders</title>

<link rel="stylesheet" href="css/adminorders.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>

<body>

<div class="container">

<h1>📦 Customer Orders</h1>

<div class="top">

<a href="AdminHome.jsp" class="back">⬅ Dashboard</a>

</div>

<table>

<tr>

<th>Order ID</th>
<th>Username</th>
<th>Customer Name</th>
<th>Mobile</th>
<th>Address</th>
<th>Brand</th>
<th>Model</th>
<th>Quantity</th>
<th>Price</th>
<th>Total</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(DB_URL,USER,PASS);

pst=con.prepareStatement("SELECT * FROM orders ORDER BY order_id DESC");

rs=pst.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("order_id")%></td>

<td><%=rs.getString("username")%></td>

<td><%=rs.getString("customer_name")%></td>

<td><%=rs.getString("mobile")%></td>

<td><%=rs.getString("address")%></td>

<td><%=rs.getString("brand")%></td>

<td><%=rs.getString("model")%></td>

<td><%=rs.getInt("quantity")%></td>

<td>₹ <%=rs.getDouble("price")%></td>

<td><b>₹ <%=rs.getDouble("total")%></b></td>

</tr>

<%

}

}catch(Exception e){

out.println("<h2>"+e.getMessage()+"</h2>");

}

finally{

try{

if(rs!=null) rs.close();
if(pst!=null) pst.close();
if(con!=null) con.close();

}catch(Exception e){}

}

%>

</table>

</div>

</body>
</html>