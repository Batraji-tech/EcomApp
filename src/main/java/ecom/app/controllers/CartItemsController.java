package ecom.app.controllers;


import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
import ecom.app.dao.CartItemsDaoImpl;
import ecom.app.entities.CartItems;
 
@Controller
@RequestMapping("/cart")
public class CartItemsController {
 
    @Autowired
    private CartItemsDaoImpl cartItemsDaoImpl;
 
    // View all cart items
    @GetMapping("/view")
    public String viewCart(Model model) {
        List<CartItems> cartItems = cartItemsDaoImpl.getAllCartItems();
        model.addAttribute("cartItems", cartItems);
        return "view_cart"; // Make sure you create this view
    }
 
    // Show the form to add a new item to the cart
    @GetMapping("/addForm")
    public String showAddForm(Model model) {
        model.addAttribute("cartItem", new CartItems());
        return "add_to_cart"; // Make sure you create this view
    }
 
    // Add an item to the cart
    @PostMapping("/add")
    public String addToCart(@ModelAttribute CartItems cartItem, RedirectAttributes redirectAttributes) {
        try {
            cartItemsDaoImpl.addCartItem(cartItem);
            redirectAttributes.addFlashAttribute("message", "Product added to cart successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error adding product to cart: " + e.getMessage());
        }
        return "redirect:/cart/view";
    }
 
 
    // Show the form to update an existing item in the cart
    @GetMapping("/updateForm")
    public String showUpdateForm(@RequestParam("productName") String productName, Model model) {
        CartItems cartItem = cartItemsDaoImpl.getCartItem(productName);
        model.addAttribute("cartItem", cartItem);
        return "update_cart"; // Make sure you create this view
    }
 
    // Update an existing item in the cart
    @PostMapping("/update")
    public String updateCartItem(@ModelAttribute CartItems cartItem, RedirectAttributes redirectAttributes) {
        cartItemsDaoImpl.updateCartItem(cartItem);
        redirectAttributes.addFlashAttribute("message", "Product updated successfully!");
        return "redirect:/cart/view";
    }
 
    // Remove an item from the cart
    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("productName") String productName, RedirectAttributes redirectAttributes) {
        cartItemsDaoImpl.deleteCartItem(productName);
        redirectAttributes.addFlashAttribute("message", "Product removed from cart successfully!");
        return "redirect:/cart/view";
    }
 
   
}
 
 

 