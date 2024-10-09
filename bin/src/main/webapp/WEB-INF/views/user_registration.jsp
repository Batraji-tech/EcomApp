<%@page import="ecom.app.entities.Role"%>
<%@page import="java.util.List"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Registration Page</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
	   <script src="../js/registerPageValidation.js"></script>
	     
	</head>
	<body>
		
		<%!
				String getUserFriendlyRoles(String technicalName){
					if(technicalName.equals("sub_admin")) return "Retailer";
					else return "Customer";
				}
			%>
		
			<%
				List<Role> rolesList = (List<Role>) request.getAttribute("listOfRoles");
				%>
		
	    <div class="container">
	        <h2>Registration </h2>
			<form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="return validateRegisterForm()">
	            <div class="form-group">
	                <label for="firstName">First Name:</label>
	                <input type="text" id="firstname" name="firstName" required>
	            </div>
	            <div class="form-group">
	                <label for="lastName">Last Name:</label>
	                <input type="text" id="lastname" name="lastName" required>
	            </div>
	            <div class="form-group">
	                <label for="mobile">Mobile No:</label>
	                <input type="tel" id="mobileNo" name="mobileNo" required>
	            </div>
	            <div class="form-group">
	                <label for="email">Email:</label>
	                <input type="email" id="email" name="emailId" required>
	            </div>
	            <div class="form-group">
	                <label for="dob">Date of Birth:</label>
	                <input type="date" id="dob" name="dateOfBirth" required>
	            </div>
				<div class="form-group">
			    <label for="username">Username:</label>
		         <input type="text" id="username" name="username" required>
			     </div>
	            <div class="form-group">
	                <label for="password">Password:</label>
	                <input type="password" id="password" name="password" required>
	            </div>
				<div>
					
				<input type="file" name="profileImage" accept=".jpg, .jpeg, .png, .pdf" required>
 
				</div>
						<% for (Role role : rolesList) {%>
							<input type="radio" name="role.roleId" value="<%=role.getRoleId()%> " /><%= getUserFriendlyRoles(role.getRoleName())%>
     
							
		<%
			}
				%>
				
		
				
								
	       
				<button type="submit" class="register-button">Register</button>
   
				<%@include file="message.jsp" %>
 
				
	        </form>
		
	    </div>
	</body>
	</html>