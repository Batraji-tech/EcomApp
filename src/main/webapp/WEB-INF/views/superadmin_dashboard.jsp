<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Super Admin Dashboard</title>
    <style>
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}

		body {
		    font-family: 'Arial', sans-serif;
		    background-color: #f0f4f8;
		    color: #333;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		    margin: 0;
		}

		.dashboard-container {
		    background-color: white;
		    padding: 40px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    width: 100%;
		    max-width: 600px;
		    text-align: center;
		}

		h1 {
		    color: #4CAF50;
		    margin-bottom: 30px;
		}

		.dashboard-menu {
		    list-style-type: none;
		    padding: 0;
		}

		.menu-item {
		    margin-bottom: 15px;
		}

		.menu-item a {
		    display: block;
		    padding: 15px;
		    background-color: #4CAF50;
		    color: white;
		    text-decoration: none;
		    font-size: 18px;
		    border-radius: 5px;
		    transition: background-color 0.3s;
		    border: 2px solid transparent; /* Add border for box effect */
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Shadow for depth */
		}

		.menu-item a:hover {
		    background-color: #45a049;
		    border-color: #4CAF50; /* Show border on hover */
		}

		.logout-button {
		    background-color: #f44336; /* Red color */
		    color: white;
		    padding: 10px 20px; /* Increased padding for better size */
		    text-decoration: none;
		    border-radius: 5px;
		    font-size: 16px;
		    border: none;
		    cursor: pointer;
		    margin-top: 20px;
		    transition: background-color 0.3s, transform 0.2s; /* Add transform for animation */
		    font-weight: bold; /* Make the text bold */
		}

		.logout-button:hover {
		    background-color: #e53935; /* Darker red on hover */
		    transform: scale(1.05); /* Slightly increase size on hover */
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

    <div class="dashboard-container">
        <h1>Super Admin Dashboard</h1>

        <div class="dashboard-menu">
            <div class="menu-item">
                <a href="/superadmin/profile">View Profile</a>
            </div>
            <div class="menu-item">
                <a href="/superadmin/resetPassword">Reset Password</a>
            </div>
            <div class="menu-item">
                <a href="/superadmin/viewAllSubAdmins">View All Sub Admins</a>
            </div>
            <div class="menu-item">
                <a href="/superadmin/viewAllCustomers">View All Customers</a>
            </div>
            <div class="menu-item">
                <a href="/superadmin/analysisReport">Analysis Report</a>
            </div>
        </div>
        

		
		
		<!-- Logout Button -->
		        <form action="/superadmin/logout" method="POST">
		            <button type="submit" class="logout-button">Logout</button>
		        </form>
    </div>

</body>
</html>
