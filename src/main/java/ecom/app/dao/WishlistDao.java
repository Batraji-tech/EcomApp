package ecom.app.dao;
import ecom.app.entities.view_wishlist;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
public interface WishlistDao {
   
	    // Add a new item to the Wishlist
	    void addWishlistItem(view_wishlist wishlist);

	    // Update an existing item in the wishlist
	    void updateWishlistItem(view_wishlist wishlist);

	    // Delete an item from the wishlist by product name
	    void deleteWishlistItem(String productName); // Assuming productName is unique

	    // Fetch all items from the wishlist
	    List<view_wishlist> getAllWishlistItems();

	    // Fetch a specific item from the wishlist by product name
	    view_wishlist getWishlistItem(String productName);

		
	}


