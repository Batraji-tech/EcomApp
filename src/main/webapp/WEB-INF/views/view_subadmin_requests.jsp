<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Super Admin Dashboard</title>
<style>
/* Add your CSS styling here */
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
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h2>Super Admin Dashboard</h2>
	<h3>Manage Pending Subadmin Requests</h3>

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
					<form
						action="${pageContext.request.contextPath}/superAdmin/approveUser"
						method="post" style="display: inline;">
						<input type="hidden" name="userId" value="<%=user.getUserId()%>" />
						<button type="submit">Approve</button>
					</form>
					<form
						action="${pageContext.request.contextPath}/superAdmin/deleteUser"
						method="post" style="display: inline;">
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
				<td colspan="5">No pending subadmin requests found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<h3>Manage Inactive Subadmin Requests</h3>

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
					<form
						action="${pageContext.request.contextPath}/superAdmin/approveUser"
						method="post" style="display: inline;">
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
				<td colspan="5">No inactive subadmin requests found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	<h3>Active Subadmins</h3>

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
                <td colspan="5">No active subadmins found.</td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>
	
</body>
</html>
