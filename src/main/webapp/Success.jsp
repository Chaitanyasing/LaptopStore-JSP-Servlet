<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("Index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;

    background:linear-gradient(-45deg,#6a11cb,#2575fc,#ff416c,#ff4b2b);
    background-size:400% 400%;
    animation:bg 10s ease infinite;
}

@keyframes bg{

0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}

}

.box{

    width:500px;
    padding:45px;
    border-radius:20px;
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(15px);
    text-align:center;
    color:white;
    box-shadow:0 10px 30px rgba(0,0,0,.35);

}

.tick{

    width:120px;
    height:120px;
    margin:auto;
    border-radius:50%;
    background:#00c853;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:60px;
    animation:zoom .8s;

}

@keyframes zoom{

from{
transform:scale(0);
}

to{
transform:scale(1);
}

}

h1{

margin-top:25px;
font-size:34px;

}

p{

margin-top:15px;
font-size:18px;
line-height:30px;

}

.user{

color:#00ffd5;
font-weight:bold;

}

.buttons{

margin-top:35px;
display:flex;
justify-content:center;
gap:20px;

}

.buttons a{

text-decoration:none;

}

.btn{

padding:14px 28px;
border:none;
border-radius:30px;
font-size:17px;
font-weight:700;
cursor:pointer;
color:white;
background:linear-gradient(90deg,#00dbde,#fc00ff);
transition:.3s;

}

.btn:hover{

transform:translateY(-4px);
box-shadow:0 10px 20px rgba(0,255,213,.5);

}

.logout{

background:linear-gradient(90deg,#ff512f,#dd2476);

}

</style>

</head>

<body>

<div class="box">

<div class="tick">

✓

</div>

<h1>Order Placed Successfully!</h1>

<p>

Thank You,

<span class="user"><%=username%></span>

Your Laptop Order has been received successfully.

</p>

<div class="buttons">

<a href="Home.jsp">

<button class="btn">

Continue Shopping

</button>

</a>

<a href="Logout">

<button class="btn logout">

Logout

</button>

</a>

</div>

</div>

</body>
</html>