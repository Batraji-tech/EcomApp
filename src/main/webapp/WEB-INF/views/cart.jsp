<%-- cart.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.CartItems" %>

<html>
<head>
    <title>Your Cart</title>
</head>
<body>
    <h1>Your Cart</h1>

    <% 
        // Display success message if it exists
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div style="color: green;"><%= message %></div>
    <% 
        }
    %>

    <%
        List<CartItems> cartItems = (List<CartItems>) request.getAttribute("cartItems");
        if (cartItems != null && !cartItems.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartItems item : cartItems) {
                %>
                    <tr>
                        <td><%= item.getProductName() %></td>
                        <td><%= item.getDescription() %></td>
                        <td>$<%= item.getPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/cart/remove" method="post">
                                <input type="hidden" name="id" value="<%= item.getId() %>">
                                <button type="submit">Remove</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <% 
        } else {
    %>
        <p>Your cart is empty.</p>
    <% 
        }
    %>
</body>
</html>
