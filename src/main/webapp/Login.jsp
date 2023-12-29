<%@page import="greensupermarket.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("Index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <%@include file="Includes/Head.jsp"%>
    <style>
        body {
            background-image: url("https://media.istockphoto.com/vectors/simple-abstract-green-and-yellow-color-background-vector-id1206564525?k=20&m=1206564525&s=612x612&w=0&h=sjKdWDDhI1CjlThRV5q7MnzWa1qCUhip3e-u2ln9iJ4=");
            background-size: cover;
        }

        .container {
            background-color: rgba(0, 128, 0, 0.8); /* Green background color with some transparency */
            border-radius: 30px;
            padding: 20px;
            margin-top: 1px;
            color: black; /* Text color */
        }

        .card-header {
            background-color: #008000; /* Dark green header color */
            color: white;
        }

        .btn-primary {
            background-color: #008000; /* Green button color */
            border-color: #008000;
        }

        .btn-primary:hover {
            background-color: #006400; /* Darker green on hover */
            border-color: #006400;
        }
    </style>
</head>
<body>

<%@include file="Includes/navbar.jsp" %>
 
    <div class="container">
        <div class="card w-50 mx-auto">
            <div class="card-header text-center">User Login</div>
            <div class="card-body">
                <form action="user-login" method="post">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="login-email" placeholder="Enter your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="login-password" placeholder="**********" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                    
                   <div class="text-center">
    <a href="Registration.jsp" class="btn btn-link">Register</a>
</div>
                   
                </form>
            </div>
        </div>
    </div>

    <%@include file="Includes/Footer.jsp"%>
</body>
</html>
