<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.view_wishlist" %>
<html>
<head>
    <title>Your Wishlist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css"><!-- Ensure the path is correct -->
</head>
<body>
    <h1>Your Wishlist</h1>
 
    <%
     List<view_wishlist> wishlistItems = (List<view_wishlist>) request.getAttribute("wishlistItems");
             if (wishlistItems != null && !wishlistItems.isEmpty()) {
     %>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (view_wishlist item : wishlistItems) {
                %>
                    <tr>
                        <td><%= item.getProductName() %></td> <!-- Product Name -->
                        <td><%= item.getDescription() %></td> <!-- Description -->
                        <td>Price: <%= item.getPrice() %></td> <!-- Price -->
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
                                <a href="/cart/view"/addToCart?productName=" + item.getProductName() %>">Add to Cart</a><br/>
                                <a href="<%= request.getContextPath() + "/DeleteFromWishlist?productName=" + item.getProductName() %>">Delete from Wishlist</a><br/>
                                <a href="<%= request.getContextPath() + "/buyNow?productName=" + item.getProductName() %>">Buy Now</a>
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
        <p>Your wishlist is empty.</p>
    <%
        }
    %>
 
    <a href="<%= request.getContextPath() + "/homepageuser" %>">Back to Home</a> <!-- Link to navigate back -->
</body>
</html>