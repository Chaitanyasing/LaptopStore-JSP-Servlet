<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("Index.jsp");
    return;
}

String brand = request.getParameter("brand");
String model = request.getParameter("model");
String price = request.getParameter("price");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Laptop</title>

<link rel="stylesheet" href="css/buy.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">

    <div class="buy-box">

        <h1>🛒 Confirm Your Order</h1>

        <form action="Buy" method="post">

            <!-- Hidden Values -->
            <input type="hidden" name="username" value="<%=username%>">
            <input type="hidden" name="brand" value="<%=brand%>">
            <input type="hidden" name="model" value="<%=model%>">
            <input type="hidden" name="price" value="<%=price%>">

            <div class="product">

                <h2>Laptop Details</h2>

                <p><strong>Brand :</strong> <%=brand%></p>

                <p><strong>Model :</strong> <%=model%></p>

                <p><strong>Price :</strong> ₹<%=price%></p>

            </div>

            <div class="inputBox">
                <input type="text" name="customerName" placeholder="Enter name" required>
                <label>Customer Name</label>
            </div>

            <div class="inputBox">
                <input type="text" name="mobile" maxlength="10" placeholder="+91xxxxxx" required>
                <label>Mobile Number</label>
            </div>

            <div class="inputBox">
                <input type="number" name="quantity" min="1" value="1" placeholder="00" required>
                <label>Quantity</label>
            </div>

            <div class="inputBox">
                <textarea name="address" rows="4" placeholder="Address"  required></textarea>
                <label>Delivery Address</label>
            </div>

            <input type="submit" value="Place Order" class="btn">

        </form>

        <div class="bottom">
            <a href="Home.jsp">⬅ Back to Store</a>
        </div>

    </div>

</div>

</body>
</html>