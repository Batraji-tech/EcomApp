package ecom.app.controllers;

import ecom.app.entities.CartItems;
import ecom.app.dao.CartItemsDaoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CartItemsController {

    @Autowired
    private CartItemsDaoImpl cartItemDaoImpl;

    // Method to display all cart items
    @GetMapping("/cart")
    public String viewCart(Model model) {
        List<CartItems> cartItems = cartItemDaoImpl.getAllCartItems();
        model.addAttribute("cartItems", cartItems);
        return "cart"; // JSP page name for displaying cart
    }

    // Method to add an item to the cart
    @PostMapping("/cart/add")
    public String addToCart(@RequestParam int productId, 
                            @RequestParam String productName,
                            @RequestParam String description,
                            @RequestParam double price,
                            @RequestParam int quantity,
                            Model model) {
        CartItems cartItem = new CartItems();
        cartItem.setProductId(productId);
        cartItem.setProductName(productName);
        cartItem.setDescription(description);
        cartItem.setPrice(price);
        cartItem.setQuantity(quantity);

        // Add the item to the cart
        cartItemDaoImpl.addCartItem(cartItem);

        // Set success message
        model.addAttribute("message", "Product added to cart successfully!");
        
        // Redirect to cart view (can also return to product detail view or any other page)
        return "redirect:/cart"; 
    }

    // Method to remove an item from the cart
    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam int id, Model model) {
        cartItemDaoImpl.removeCartItem(id);
        
        // Set success message
        model.addAttribute("message", "Product removed from cart successfully!");

        // Redirect to cart view
        return "redirect:/cart";
    }
}
