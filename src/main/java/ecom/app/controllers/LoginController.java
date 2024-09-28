package ecom.app.controllers;
 
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class LoginController {

 
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
}