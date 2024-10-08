package ecom.app.dao;


import ecom.app.entities.CartItems;
import java.util.List;

public interface CartItemsDao {
   
    // Add a new item to the cart
    void addCartItem(CartItems cartItem);

    // Update an existing item in the cart
    void updateCartItem(CartItems cartItem);

    // Delete an item from the cart by product name
    void deleteCartItem(String productName); // Assuming productName is unique

    // Fetch a specific item from the cart by product name
    CartItems getCartItem(String productName); // Assuming productName is unique per user

 	List<CartItems> getAllCartItems();

	
}
