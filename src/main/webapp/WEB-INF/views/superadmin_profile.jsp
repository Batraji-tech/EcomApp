<%@page import="ecom.app.entities.SuperAdmin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SuperAdmin Profile</title>
    <link href="../css/styles.css" rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        .container {
            width: 40%; /* Reduced width */
            max-width: 500px; /* Maximum width for larger screens */
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        td {
            padding: 10px;
            vertical-align: top;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
		.success, .error {
		            text-align: center;
		            margin-top: 20px;
		        }
		        .success {
		            color: green;
		        }
		        .error {
		            color: red;
		        }
    </style>
</head>
<body>

    <div class="container">
        <h1>SuperAdmin Profile</h1>
        
        <form:form method="POST" action="/superAdmin/updateProfile" modelAttribute="superAdmin">
            <form:hidden path="id" />
            <table>
                <tr>
                    <td class="form-group">
                        <label for="firstName">First Name:</label>
                        <form:input path="firstName" cssClass="form-control" id="firstName"/>
                    </td>
                </tr>
                <tr>
                    <td class="form-group">
                        <label for="lastName">Last Name:</label>
                        <form:input path="lastName" cssClass="form-control" id="lastName"/>
                    </td>
                </tr>
                <tr>
                    <td class="form-group">
                        <label for="emailId">Email ID:</label>
                        <form:input path="emailId" cssClass="form-control" id="emailId"/>
                    </td>
                </tr>
                <tr>
                    <td class="form-group">
                        <label for="mobileNo">Mobile No:</label>
                        <form:input path="mobileNo" cssClass="form-control" id="mobileNo"/>
                    </td>
                </tr>
				<tr>
				                   <td class="form-group">
				                       <label for="username">Username</label>
				                       <form:input path="username" cssClass="form-control" id="username"/>
				                   </td>
				               </tr>
            </table>
            <button type="submit">Save Changes</button>
        </form:form>
		
		<c:if test="${not empty errors}">
		    <div class="alert error">
		        <ul>
		            <c:forEach var="error" items="${errors}">
		                ${errors}
		            </c:forEach>
		        </ul>
		    </div>
		</c:if>

		<c:if test="${not empty message}">
		    <div class="alert success">
		        ${message}
		    </div>
		</c:if>

    </div>

</body>
</html>
