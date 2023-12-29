<%@page import="greensupermarket.connection.DBCon"%>
<%@page import="greensupermarket.dao.OrderDao" %>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="greensupermarket.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
 orders = new OrderDao(DBCon.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("Login.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>Orders</title>
<%@include file="Includes/Head.jsp"%>
<style type="text/css">
body {
    background-image: url("https://e0.pxfuel.com/wallpapers/607/94/desktop-wallpaper-green-background-green-pink-green-and-green-floral-light-green-plain.jpg"); /* Replace with your image URL */
    background-size: cover;
    background-position: center;
    
}
</style>
</head>
<body>

	<%@include file="Includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-striped">
		<thead class="thead-dark">
			
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
					<th scope="col">Payment</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(orders !=null){
				for(Order o:orders){%>
				<tr>
				<td><%= o.getDate() %></td>
				<td><%= o.getName() %></td>
				<td><%= o.getCategory() %></td>
				<td><%= o.getQuantity() %></td>
				<td><%= dcf.format(o.getPrice()) %></td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%= o.getOrderId() %>">Cancel</a></td>
				<td><a class="btn btn-sm btn-success" href="checkout.html" target="_blank" rel="noopener noreferrer">Pay Now</a></td>

				</tr>
				<%}
				
			}
			%>
			</tbody>
		</table>
	</div>


	<%@include file="Includes/Footer.jsp"%>
</body>
</html>
