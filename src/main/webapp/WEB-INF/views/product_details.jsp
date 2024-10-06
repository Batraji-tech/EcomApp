<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ecom.app.entities.Product" %>
<%@ page import="java.util.Base64" %> 

<html>
<head>
    <title>Product Details</title>
</head>
<body>
    <h1>Product Details</h1>
    <table>
        <tr>
            <td><strong>Product Name:</strong></td>
            <td>${product.productName}</td>
        </tr>
        <tr>
            <td><strong>Description:</strong></td>
            <td>${product.description}</td>
        </tr>
        <tr>
            <td><strong>MRP:</strong></td>
            <td>${product.mrp}</td>
        </tr>
        <tr>
            <td><strong>Discount:</strong></td>
            <td>${product.discount}%</td>
        </tr>
        <tr>
            <td><strong>Final Price:</strong></td>
            <td>${product.finalPrice}</td>
        </tr>
        <tr>
            <td><strong>Stock:</strong></td>
            <td>${product.stock}</td>
        </tr>
        <tr>
            <td><strong>Status:</strong></td>
            <td><%= (product.getStatus() == 1) ? "Available" : "Not Available" %></td>
        </tr>
        <tr>
            <td colspan="2">
                <%
                    byte[] imageBytes = product.getProductImage();
                    if (imageBytes != null && imageBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" 
                         alt="<%= product.getProductName() %>" style="width:300px;height:auto;" />
                <%
                    } else {
                %>
                    <span>No Image Available</span>
                <%
                    }
                %>
            </td>
        </tr>
    </table>
</body>
</html>
