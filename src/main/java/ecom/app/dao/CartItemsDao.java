package ecom.app.dao;
 
import ecom.app.entities.CartItems;
import java.util.List;
 
public interface CartItemsDao {
   
    
	void addCartItem(CartItems cartItem);
    List<CartItems> getAllCartItems();
    void removeCartItem(int id);
 
	
}
 