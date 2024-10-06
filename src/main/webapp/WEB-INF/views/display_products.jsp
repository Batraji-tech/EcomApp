<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Product" %> <!-- Ensure this path is correct -->
<%@ page import="java.util.Base64" %> <!-- Import Base64 class for encoding -->
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table border="1">
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>More Details</th>
        </tr>

        <%
            // Fetch the product list from the request scope
            List<Product> products = (List<Product>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
                    byte[] imageBytes = product.getProductImage(); 
                    
                    // Debugging output to check the image byte length
                    int imageLength = (imageBytes != null) ? imageBytes.length : 0;
                    out.println("<!-- Image byte length: " + imageLength + " -->"); // Debugging line
        %>
                    <tr>
                        <td>
                            <% if (imageBytes != null && imageLength > 0) { %>
                                <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>" 
                                     alt="<%= product.getProductName() %>" style="width:100px;height:auto;"/>
                            <% } else { %>
                                <span>No Image Available</span>
                            <% } %>
                        </td>
                        <td><%= product.getProductName() %></td>
                        <td><%= product.getFinalPrice() %></td>
                        <td><a href="<%= request.getContextPath() %>/products/<%= product.getProductId() %>">More Details</a></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="4">No products available</td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
