<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Enter Email</title>

    <style>
		
		 
		body {
		    font-family: Arial, sans-serif;
		    background-color: #003366;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		    margin: 0;
			
		}
		 
		.login-container {
		    
			color:white;
		    padding: 50px;
		    border-radius: 8px;
			box-shadow: 0 0 10px #00ff00;
		    width: 300px;
		    text-align: center;
		 
		}
		 
		h2 {
		    margin-bottom: 20px;
		    color: #00ff00; /* Updated color */
		}
		 
		.input-group {
		    margin-bottom: 15px;
		    text-align: left;
		}
		 
		.input-group label {
		    display: block;
		    margin-bottom: 5px;
		    
		}
		 
		.input-group input {
		    width: 100%;
		    padding: 8px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}
		 
		button {
		    width: 100%;
		    padding: 10px;
		    background-color: #00ff00; /* Updated color */
		    border: none;
		    border-radius: 4px;
		    color: #fff;
		    font-size: 16px;
		    cursor: pointer;
		}
		 

		       input[type="email"] {
		           width: 100%;
		           padding: 10px;
		           border: 1px solid #ddd;
		           border-radius: 4px;
		           box-sizing: border-box;
		           font-size: 14px;
		       }
		       
		       
		       .error {
		           color: red;
		           margin-top: 10px;
		           text-align: center;
				   
       
        
       
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Forgot Password ?</h2>

        <%-- Display error if email is not found --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/superAdmin/verify_email" method="post">
            <div class="input-group">
				</br>
                <label for="email">Enter your email</label>
				
                <input type="email" id="email" name="email" required placeholder="example@gmail.com">
            </div>
			</br>
            <button type="submit">Verify Email</button>
        </form>
    </div>
</body>
</html>
