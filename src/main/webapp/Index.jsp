<%@page import="greensupermarket.dao.ProductDao" %>
<%@page import="java.util.*"%>
<%@page import="greensupermarket.connection.DBCon"%>
<%@page import="greensupermarket.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    ProductDao pd = new ProductDao(DBCon.getConnection());
    List<Product> products = pd.getAllProducts();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Your meta description goes here. It should be a concise summary of your page content.">
    <!-- Other head elements like title, styles, scripts, etc. -->
    <title>Products</title>
    <%@include file="Includes/Head.jsp"%>
    <style>
        body {
            background-image: url("https://static.vecteezy.com/system/resources/previews/024/675/760/non_2x/green-background-hd-wallpaperss-free-download-free-vector.jpg");
            background-size: cover;
        }

        /* Set a fixed height for the images */
        .card-img-top {
            height: 200px; /* Adjust the height as needed */
            object-fit: fit ; /* Maintain aspect ratio and cover the container */
            
        }
    </style>
</head>
<body>

    <%@include file="Includes/navbar.jsp"%>
    
    <div class="container">
        <div class="card-header my-3">All Products</div>
        <div class="row">
            <%
            if (!products.isEmpty()) {
                for (Product p : products) {
            %>
            <div class="col-md-3 my-3">
                <div class="card w-100" style="width: 18rem;">
                    <img class="card-img-top" src="Product-Images/<%= p.getImage() %> " alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%= p.getName() %></h5>
                        <h6 class="price"> Price: $<%= p.getPrice() %></h6>
                        <h6 class="category"> Category: <%=p.getCategory() %></h6>
                        <div class="mt-3 d-flex justify-content-between"></div>
                        <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
                        <a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <% }
            }
            %>		     
        </div>
    </div>

    <%@include file="Includes/Footer.jsp"%>
</body>
</html>