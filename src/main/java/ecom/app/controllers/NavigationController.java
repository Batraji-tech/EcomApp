package ecom.app.controllers;
 
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class NavigationController {

	@GetMapping("/")
	public String homepage() {
		return "homepage";
	}
	
	@GetMapping("/login")
	public String Login() {
		return "login";
	}

	@GetMapping("/homepageuser")
	public String homepageuser() {
		return "homepageuser";
	}
	
	// Profile will mapped after the dashboard
	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}

	
	@GetMapping("/login_superadmin")
	public String superadmin_login() {
		return "superadmin_login";
	}
	
 
	@GetMapping("/register")
	public String register() {
		return "register";
	}	
	
	
}