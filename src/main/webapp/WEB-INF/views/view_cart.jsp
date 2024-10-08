<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.CartItems" %>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"> <!-- Ensure the path is correct -->
</head>
<body>
    <h1>Your Cart</h1>
 
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
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartItems item : cartItems) {
                %>
                    <tr>
                        <td><%= item.getProductName() %></td> <!-- Product Name -->
                        <td><%= item.getDescription() %></td> <!-- Description -->
                        <td>Price: <%= item.getPrice() %></td> <!-- Price -->
                        <td><%= item.getQuantity() %></td> <!-- Quantity -->
                        <td>
                            <%
                                byte[] imageBytes = item.getProductImage();
                                if (imageBytes != null) {
                                    String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
                            %>
                                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= item.getProductName() %>" style="width:100px;height:auto;"/>
                            <%
                                } else {
                            %>
                                <p>No Image Available</p>
                            <%
                                }
                            %>
                        </td>
                        <td>
                            <div>
                                <a href="<%= request.getContextPath() + "/cart/updateForm?productName=" + item.getProductName() %>">Update</a><br/>
                                <a href="<%= request.getContextPath() + "/cart/remove?productName=" + item.getProductName() %>">Remove</a>
                            </div>
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
 
    <a href="<%= request.getContextPath() + "/homepageuser" %>">Back to Home</a> <!-- Link to navigate back -->
</body>
</html>