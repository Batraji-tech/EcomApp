<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.Wishlist"%>
<%@ page import="ecom.app.entities.Products"%>
<html>
<head>
    <title>Your Wishlist</title>
</head>
<body>
    <h1>Your Wishlist</h1>

    <%
    // Display messages from RedirectAttributes
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");

    if (error != null) {
    %>
        <div class="error" style="color:red;"><%= error %></div>
    <%
    }
    if (message != null) {
    %>
        <div class="message" style="color:green;"><%= message %></div>
    <%
    }

    List<Wishlist> wishlistItems = (List<Wishlist>) request.getAttribute("wishlistItems");
    List<Products> products = (List<Products>) request.getAttribute("products");

    if (wishlistItems != null && !wishlistItems.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            for (int i = 0; i < wishlistItems.size(); i++) {
                Wishlist item = wishlistItems.get(i);
                Products product = products.get(i);
            %>
            <tr>
                <td><%= product != null ? product.getProduct_name() : "Product not found" %></td>
                <td><%= product != null ? product.getDescription() : "Description not available" %></td>
                <td><%= product != null ? product.getFinal_price() : "Price not available" %></td>
                <td>
                    <form action="${pageContext.request.contextPath}/wishlist/moveToCart" method="post" style="display:inline;">
                        <input type="hidden" name="wishlistId" value="<%= item.getWishlistId() %>">
                        <button type="submit">Move to Cart</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/wishlist/remove" method="post" style="display:inline;">
                        <input type="hidden" name="wishlistId" value="<%= item.getWishlistId() %>">
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
    <p>Your wishlist is empty.</p>
    <%
    }
    %>

    <a href="<%=request.getContextPath() + "/homepageuser"%>">Back to Home</a>
</body>
</html>
