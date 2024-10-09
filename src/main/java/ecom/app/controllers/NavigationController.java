package ecom.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ecom.app.dao.ProductDaoImpl;
import ecom.app.entities.Products;
@Controller
public class NavigationController {
	
	@Autowired
	private ProductDaoImpl productDaoImpl;
	public List<Products> products;
 
	@GetMapping("/")
	public String homepage(Model model) {
		
		List<Products> newArrivals = productDaoImpl.getAllNewArrivalProducts();
        List<Products> discountProducts = productDaoImpl.getAllDiscountProducts();
        List<Products> bestBrands = productDaoImpl.getAllBestBrandProducts();

        // Add these product lists to the model to be passed to the JSP
        model.addAttribute("newArrivals", newArrivals);
        model.addAttribute("discountProducts", discountProducts);
        model.addAttribute("bestBrands", bestBrands);
		        return "homepage"; // JSP page
	}
	
	@GetMapping("/expore-all")
	public String exploreall(Model model) {
		
		List<Products> newArrivals = productDaoImpl.getAllNewArrivalProducts();
        List<Products> discountProducts = productDaoImpl.getAllDiscountProducts();
        List<Products> bestBrands = productDaoImpl.getAllBestBrandProducts();

        // Add these product lists to the model to be passed to the JSP
        model.addAttribute("newArrivals", newArrivals);
        model.addAttribute("discountProducts", discountProducts);
        model.addAttribute("bestBrands", bestBrands);
		        return "homepage"; // JSP page
	}
	
	@GetMapping("/explore-new-arrivals")
	public String explorenewarrivals(Model model) {
		
		List<Products> newArrivals = productDaoImpl.getAllNewArrivalProducts1();
        model.addAttribute("newArrivals", newArrivals);
		        return "new_arrivals_products"; // JSP page
	}
	
	@GetMapping("/explore-discount-products")
	public String explorediscountproducts(Model model) {
		
		
        List<Products> discountProducts = productDaoImpl.getAllDiscountProducts1();
        model.addAttribute("discountProducts", discountProducts);
		        return "discount_products"; // JSP page
	}
	
	@GetMapping("/explore-best-brands")
	public String explorebestbrands(Model model) {
		
        List<Products> bestBrands = productDaoImpl.getAllBestBrandProducts1();
        model.addAttribute("bestBrands", bestBrands);
		        return "best_brand_products"; // JSP page
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

	@GetMapping("/cart")
	public String cart() {
		return "cart";
	}
 
	
	@GetMapping("/remove_product")
	public String removeproduct() {
		return "remove_product";
	}

}