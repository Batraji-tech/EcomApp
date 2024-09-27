<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Registration Form</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
	</head>
	<body>
	    <div class="form-container">
	        <form action="register" method="post">
	            <h2>Registration Form</h2>


	            <label for="firstname">First Name:</label>
	            <input type="text" id="firstname" name="firstname" required>
	 
	            <label for="lastname">Last Name:</label>
	            <input type="text" id="lastname" name="lastname" required>
	 
	            <label for="username">Username:</label>
	            <input type="text" id="username" name="username" required>
	 
	            <label for="mobileno">Mobile No:</label>
	            <input type="text" id="mobileno" name="mobileno" required>
	 
	            <label for="email">Email:</label>
	            <input type="email" id="email" name="email" required>
				
				<label for="Gender">Gender:</label>
			    <input type="Gender" id="Gender" name="Gender" required>
	 
	            <label for="address">Address:</label>
	            <textarea id="address" name="address" required></textarea>
	 
	            <label for="password">Password:</label>
	            <input type="password" id="password" name="password" required>
	 
	            <label for="confirmpassword">Confirm Password:</label>
	            <input type="password" id="confirmpassword" name="confirmpassword" required>
	 
	           
			   <button onclick="window.location.href='/'">Register</button>
			
	        </form>
		
	    </div>
	</body>
	</html>