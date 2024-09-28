package ecom.app.controllers;
 
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
<<<<<<< HEAD:src/main/java/ecom/app/controllers/NavigationController.java
public class NavigationController {
=======
public class LoginController {
>>>>>>> 958b0dda5d2a4b250206c332ff12d6ae2b6b0c5a:src/main/java/ecom/app/controllers/LoginController.java

 
	@GetMapping("/")
	public String homepage() {
		return "homepage";
	}
<<<<<<< HEAD:src/main/java/ecom/app/controllers/NavigationController.java
	
=======
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
>>>>>>> 958b0dda5d2a4b250206c332ff12d6ae2b6b0c5a:src/main/java/ecom/app/controllers/LoginController.java

	@GetMapping("/homepageuser")
	public String homepageuser() {
		return "homepageuser";
	}
<<<<<<< HEAD:src/main/java/ecom/app/controllers/NavigationController.java
	
	// Profile will mapped after the dashboard
	@GetMapping("/profile")
	public String Profile() {
		return "profile";
	}

	
	@GetMapping("/login_superadmin")
	public String superadmin_login() {
		return "superadmin_login";
	}
	
	
		
	
	
	
=======
	@GetMapping("/profile")
	public String Profile() {
		return "profile";
	}

 
	@GetMapping("/register")
	public String register() {
		return "register";
	}	
	
	
	@GetMapping("/login_superadmin")
	public String login_superadmin() {
		return "login_superadmin";
	}
>>>>>>> 958b0dda5d2a4b250206c332ff12d6ae2b6b0c5a:src/main/java/ecom/app/controllers/LoginController.java
}