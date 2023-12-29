<%@page import="greensupermarket.connection.DBCon"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="greensupermarket.model.*"%>
<%@page import="java.util.*"%>
<%@page import="greensupermarket.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
    ProductDao pDao = new ProductDao(DBCon.getConnection());
    cartProduct = pDao.getCartProducts(cart_list);
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("cart_list", cart_list);
    request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <%@include file="Includes/Head.jsp"%>
    <style type="text/css">
        body {
            background-image: url("https://img.freepik.com/premium-photo/empty-metal-shopping-cart-isolated-pink-green-background-with-copy-space-your-text-design-top-view-flat-lay-supermarket-mall-market-shopping-sale-concept_248459-1048.jpg");
            /* Replace with your image URL */
            background-size: cover;
            background-position: center;
        }

        .table tbody td {
            vertical-align: middle;
        }

        .btn-incre,
        .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
    </style>
</head>
<body>
    <%@include file="Includes/navbar.jsp"%>

    <div class="container">
        <div class="d-flex py-3">
            <h3>Total Price: $ ${ (total > 0) ? dcf.format(total) : 0 }</h3>
            <a class="mx-3 btn btn-primary" href="checkout.html">Confirm</a>
        </div>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Buy Now</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%=c.getName()%></td>
                    <td><%=c.getCategory()%></td>
                    <td><%=dcf.format(c.getPrice())%></td>
                    <td>
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                            <div class="form-group d-flex justify-content-between w-50">
                                <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                <input type="text" name="quantity" class="form-control w-50 " value="<%=c.getQuantity()%>" readonly>
                                <a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                        </form>
                    </td>
                    <td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
                </tr>
                <%
                    }
                }
                %>
            </tbody>
        </table>

        <!-- PayPal Smart Payment Buttons -->
        <div id="paypal-button-container"></div>
        <script src="https://www.paypal.com/sdk/js?client-id=YOUR_PAYPAL_CLIENT_ID&currency=USD"></script>
        <script>
            paypal.Buttons({
                createOrder: function (data, actions) {
                    return fetch('/path/to/your/order/creation/endpoint', {
                        method: 'post'
                    }).then(function (res) {
                        return res.json();
                    }).then(function (orderData) {
                        return orderData.id;
                    });
                },
                onApprove: function (data, actions) {
                    return fetch('/path/to/your/order/capture/endpoint/' + data.orderID + '/capture/', {
                        method: 'post'
                    }).then(function (res) {
                        return res.json();
                    }).then(function (orderData) {
                        // Handle order completion as needed
                    });
                }
            }).render('#paypal-button-container');
        </script>
    </div>

    <%@include file="Includes/Footer.jsp"%>
</body>
</html>
