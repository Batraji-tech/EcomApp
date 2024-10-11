package ecom.app.controllers;

import ecom.app.entities.Order;
import ecom.app.entities.CartItems;
import ecom.app.entities.User;
import ecom.app.dao.CartDaoImpl;
import ecom.app.dao.OrderDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order") // Updated mapping to reflect order-related actions
public class OrderController {

	@Autowired
	private OrderDaoImpl orderDaoImpl;
  
	@Autowired
	private CartDaoImpl cartDaoImpl;
	
	
	@PostMapping("/confirm")
	public String confirmOrder(HttpSession session, Model model, @RequestParam String paymentMethod) {
		User user = (User) session.getAttribute("user");

		// Fetch cart items and buy now items
		List<CartItems> cartItems = (List<CartItems>) session.getAttribute("cartItems");
		List<CartItems> buyNowItems = (List<CartItems>) session.getAttribute("buyNowItems");

		// Handle order based on what items are present
		if (buyNowItems != null && !buyNowItems.isEmpty()) {
			// Process "Buy Now" items
			double totalAmount = buyNowItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
			Order order = new Order(user.getUserId(), buyNowItems, totalAmount, paymentMethod);

			try {
				orderDaoImpl.saveOrder(order); // Save the order in the database
				session.removeAttribute("buyNowItems"); // Clear buy now items after successful order
				return "order_successful"; // Redirect to order success page
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				model.addAttribute("error", "Error processing your order. Please try again.");
				return "checkout"; // Redirect back to checkout if there's an error
			}
		} else if (cartItems != null && !cartItems.isEmpty()) {
			// Process cart items if no buy now items are present
			double totalAmount = cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
			Order order = new Order(user.getUserId(), cartItems, totalAmount, paymentMethod);

			try {
				orderDaoImpl.saveOrder(order); // Save the order in the database
	            cartDaoImpl.removeCartProducts(user.getUserId());
				session.setAttribute("cartItems", new ArrayList<CartItems>());
				return "order_successful"; // Redirect to order success page
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				model.addAttribute("error", "Error processing your order. Please try again.");
				return "checkout"; // Redirect back to checkout if there's an error
			}
		} else {
			model.addAttribute("error", "Your cart is empty. Cannot proceed with the order.");
			return "checkout"; // Redirect back to checkout if no items are found
		}
	}

	@GetMapping("/displayOrders")
	public String viewOrders(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/user/login"; // Redirect to login if user is not logged in
		}

		try {
			List<Order> orders = orderDaoImpl.getOrdersByUserId(user.getUserId()); // Implement this method
			model.addAttribute("orders", orders);
		} catch (SQLException | IOException e) {
			e.printStackTrace();
			model.addAttribute("error", "Error fetching your orders.");
		}

		return "orders"; // Return to the my_orders.jsp page
	}

}
