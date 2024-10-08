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

import ecom.app.dao.WishlistDaoImpl;
import ecom.app.entities.view_wishlist;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {

    @Autowired
    private WishlistDaoImpl wishlistDaoImpl;

    // View all wishlist items
    @GetMapping("/view")
    public String viewWishlist(Model model) {
        List<view_wishlist> wishlistItems = wishlistDaoImpl.getAllWishlistItems();
        model.addAttribute("wishlistItems", wishlistItems);
        return "view_wishlist"; // Make sure you create this view
    }

    // Show the form to add a new item to the wishlist
    @GetMapping("/addForm")
    public String showAddForm(Model model) {
        model.addAttribute("wishlist", new view_wishlist());
        return "add_to_wishlist"; // Make sure you create this view
    }

    // Add an item to the wishlist
    @PostMapping("/add")
    public String addToWishlist(@ModelAttribute view_wishlist wishlist, RedirectAttributes redirectAttributes) {
        wishlistDaoImpl.addWishlistItem(wishlist);
        redirectAttributes.addFlashAttribute("message", "Product added to wishlist successfully!");
        return "redirect:/wishlist/view";
    }

    // Show the form to update an existing item in the wishlist
    @GetMapping("/updateForm")
    public String showUpdateForm(@RequestParam("productName") String productName, Model model) {
        view_wishlist wishlistItem = wishlistDaoImpl.getWishlistItem(productName);
        model.addAttribute("wishlist", wishlistItem);
        return "update_wishlist"; // Make sure you create this view
    }

    // Update an existing item in the wishlist
    @PostMapping("/update")
    public String updateWishlistItem(@ModelAttribute view_wishlist wishlist, RedirectAttributes redirectAttributes) {
        wishlistDaoImpl.updateWishlistItem(wishlist);
        redirectAttributes.addFlashAttribute("message", "Product updated successfully!");
        return "redirect:/wishlist/view";
    }

    // Remove an item from the wishlist
    @PostMapping("/remove")
    public String removeFromWishlist(@RequestParam("productName") String productName, RedirectAttributes redirectAttributes) {
        wishlistDaoImpl.deleteWishlistItem(productName);
        redirectAttributes.addFlashAttribute("message", "Product removed from wishlist successfully!");
        return "redirect:/wishlist/view";
    }
  

	}

