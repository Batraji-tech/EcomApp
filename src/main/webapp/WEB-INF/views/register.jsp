<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Registration Page</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
	</head>
	<body>
	    <div class="container">  
	        <h2>Registration </h2>
	        <form>
	            <div class="form-group">
	                <label for="firstname">First Name:</label>
	                <input type="text" id="firstname" name="firstname" required>
	            </div>
	            <div class="form-group">
	                <label for="lastname">Last Name:</label>
	                <input type="text" id="lastname" name="lastname" required>
	            </div>
	            <div class="form-group">
	                <label for="username">Username:</label>
	                <input type="text" id="username" name="username" required>
	            </div>
	            <div class="form-group">
	                <label for="mobile">Mobile No:</label>
	                <input type="tel" id="mobile" name="mobile" required>
	            </div>
	            <div class="form-group">
	                <label for="email">Email:</label>
	                <input type="email" id="email" name="email" required>
	            </div>
	            <div class="form-group">
	                <label for="gender">Gender:</label>
	                <select id="gender" name="gender" required>
	                    <option value="">Select</option>
	                    <option value="male">Male</option>
	                    <option value="female">Female</option>
	                    <option value="other">Other</option>
	                </select>
	            </div>
	            <div class="form-group">
	                <label for="dob">Date of Birth:</label>
	                <input type="date" id="dob" name="dob" required>
	            </div>
	            <div class="form-group">
	                <label for="address">Address:</label>
	                <textarea id="address" name="address" rows="3" required></textarea>
	            </div>
	            <div class="form-group">
	                <label for="password">Password:</label>
	                <input type="password" id="password" name="password" required>
	            </div>
	            <div class="form-group">
	                <label for="confirm-password">Confirm Password:</label>
	                <input type="password" id="confirm-password" name="confirm-password" required>
	            </div>
	            <div class="form-group radio-group">
	                <label>
	                    <input type="radio" name="userType" value="Customer" required> Customer
	                </label>
	                <label>
	                    <input type="radio" name="userType" value="Retailer" required> Retailer
	                </label>
	            </div>
			<button type="submit" class="register-button"onclick="window.location.href='/login'">Register</button>
				
	        </form>
		
	    </div>
	</body>
	</html>
