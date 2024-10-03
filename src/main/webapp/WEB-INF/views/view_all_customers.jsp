<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.User" %>
<html>
<head>
    <title>All Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: #fff;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #45a049;
        }

        .no-customers {
            text-align: center;
            color: #555;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>

    <%
        List<User> customers = (List<User>) request.getAttribute("customers");
        if (customers != null && !customers.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile No</th>
                    <th>Date of Birth</th>
                    <th>Username</th>
                </tr>
            </thead>
            <tbody>
                <% for (User customer : customers) { %>
                    <tr>
                        <td><%= customer.getUserId() %></td>
                        <td><%= customer.getFirstName() %></td>
                        <td><%= customer.getLastName() %></td>
                        <td><%= customer.getEmailId() %></td>
                        <td><%= customer.getMobileNo() %></td>
                        <td><%= customer.getDateOfBirth() != null ? customer.getDateOfBirth().toString() : "N/A" %></td>
                        <td><%= customer.getUsername() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p class="no-customers">No customers found.</p>
    <% } %>

    <a href="/superadmin/dashboard">Back to Dashboard</a>
</body>
</html>
