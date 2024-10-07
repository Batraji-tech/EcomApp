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
	
	@GetMapping("/orders")
	public String orders() {
		return "orders";
	}
	
	@GetMapping("/products")
	public String products() {
		return "products";
	}
	
	@GetMapping("/update_table")
	public String updatetable() {
		return "update_table";
	}
	
	@GetMapping("/remove_product")
	public String removeproduct() {
		return "remove_product";
	}
	
	@GetMapping("/view_product")
	public String viewproduct() {
		return "view_product";
	}
	
	
	@GetMapping("/view_productbycategoryname")
	public String viewproductbycategoryname() {
		return "view_productbycategoryname";
	}
	
	
	
	@GetMapping("/update_product")
	public String updateproduct() {
		return "update_product";
	}
	
	
	
	
	
}