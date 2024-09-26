package ecom.app.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	

	@GetMapping("/homepage")
	public String homepage() {
		return "homepage";
	}
	@GetMapping("/")
	public String Login() {
		return "login";
	}
	
	
	@GetMapping("/homepageuser")
	public String homepageuser() {
		return "homepageuser";
	}
	
	@GetMapping("/profile")
	public String Profile() {
		return "Profile";
	}
	

	@GetMapping("/register")
	public String register() {
		return "register";
	}

}
