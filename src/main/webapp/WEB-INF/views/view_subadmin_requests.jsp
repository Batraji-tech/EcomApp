<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Manage Requests</title>
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #FF9874; /* Soft orange */
			text-align:center;
			margin-bottom:60px;
        }
        h3 {
            color: #FF9874; /* Soft orange */
			text-align:center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* Add margin for spacing */
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #295F98; /* Dark blue */
            color: white; /* White text for headers */
        }
        button {
            background-color: #295F98; /* Dark blue */
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #1a3a6e; /* Darker blue on hover */
        }
        tr:nth-child(even) {
            background-color: #f9f9f9; /* Alternate row color */
        }
    </style>
</head>
<body>
    <h1>Manage Requests </h1>
    <h3>Manage Pending Retails Requests</h3>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
            %>
            <tr>
                <td><%=user.getUserId()%></td>
                <td><%=user.getFirstName()%></td>
                <td><%=user.getLastName()%></td>
                <td><%=user.getEmailId()%></td>
                <td>
                    <form action="${pageContext.request.contextPath}/superAdmin/approveUser" method="post" style="display: inline;">
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>" />
                        <button type="submit">Approve</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/superAdmin/deleteUser" method="post" style="display: inline;">
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>" />
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No pending retailer requests found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <h3>Manage Inactive Retailer Requests</h3>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<User> inactiveUserList = (List<User>) request.getAttribute("inactiveUserList");
            if (inactiveUserList != null && !inactiveUserList.isEmpty()) {
                for (User user : inactiveUserList) {
            %>
            <tr>
                <td><%=user.getUserId()%></td>
                <td><%=user.getFirstName()%></td>
                <td><%=user.getLastName()%></td>
                <td><%=user.getEmailId()%></td>
                <td>
                    <form action="${pageContext.request.contextPath}/superAdmin/approveUser" method="post" style="display: inline;">
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>" />
                        <button type="submit">Activate</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No inactive retailer requests found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
    
    <h3>Active Retailer</h3>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<User> activeUserList = (List<User>) request.getAttribute("activeUserList");
            if (activeUserList != null && !activeUserList.isEmpty()) {
                for (User user : activeUserList) {
            %>
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmailId() %></td>
                <td>
                    <form action="${pageContext.request.contextPath}/superAdmin/deleteUser" method="post" style="display:inline;">
                        <input type="hidden" name="userId" value="<%= user.getUserId() %>"/>
                        <button type="submit">Revoke Access</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No active retailer found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</body>
</html>
