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

	//check
	
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
		return "login_superadmin";
	}
	

	@GetMapping("/payments")
	public String payments() {
		return "payments";
	}
 
	@GetMapping("/order_successful")
	public String order_successful() {
		return "order_successful";

	
	}
	@GetMapping("/editprofile")
	public String editprofile() {
		return "editprofile";
	}
	
	@GetMapping("/subadmin")
	public String subadmin() {
		return "subadmin";
	}
	
	@GetMapping("/wishlist")
	public String wishlist() {
		return "wishlist";
	}
	@GetMapping("/cart")
	public String cart() {
		return "cart";
	}
	@GetMapping("/orders")
	public String orders() {
		return "orders";
	}
	
	
}