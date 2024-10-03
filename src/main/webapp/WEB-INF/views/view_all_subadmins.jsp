<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.User" %>
<html>
<head>
    <title>All SubAdmins</title>
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
    <h2>SubAdmins List</h2>

    <%
        List<User> subadmins = (List<User>) request.getAttribute("subadmins");
        if (subadmins != null && !subadmins.isEmpty()) {
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
                <% for (User subadmin : subadmins) { %>
                    <tr>
						<td><%=  subadmin.getUserId() %></td>
						                       <td><%= subadmin.getFirstName() %></td>
						                       <td><%= subadmin.getLastName() %></td>
						                       <td><%= subadmin.getEmailId() %></td>
						                       <td><%= subadmin.getMobileNo() %></td>
						                       <td><%= subadmin.getDateOfBirth() != null ?  subadmin.getDateOfBirth().toString() : "N/A" %></td>
						                       <td><%=  subadmin.getUsername() %></td>
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
