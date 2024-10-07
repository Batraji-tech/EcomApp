package ecom.app.dao;

import ecom.app.entities.CartItems;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CartItemsDaoImpl implements CartItemsDao {

	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	 @Override
	    public void addCartItem(CartItems cartItem) {
	        String sql = "INSERT INTO cart_item (product_id, product_name, description, price, quantity) VALUES (?, ?, ?, ?, ?)";
	        jdbcTemplate.update(sql, cartItem.getProductId(), cartItem.getProductName(),
	                cartItem.getDescription(), cartItem.getPrice(), cartItem.getQuantity());
	    }
	 @Override
	    public void removeCartItem(int id) {
	        String sql = "DELETE FROM cart_item WHERE id = ?";
	        jdbcTemplate.update(sql, id);
	    }

    @Override
    public List<CartItems> getAllCartItems() {
        String sql = "SELECT * FROM cart_item"; // Query to fetch all cart items
        return jdbcTemplate.query(sql, new CartItemRowMapper());
    }

    // Custom RowMapper for CartItems
    public class CartItemRowMapper implements RowMapper<CartItems> {
        @Override
        public CartItems mapRow(ResultSet rs, int rowNum) throws SQLException {
            CartItems cartItem = new CartItems();
            
            // Set the properties of CartItems from the ResultSet
           // cartItem.setId(rs.getInt("id")); // Assuming you have an ID column
            cartItem.setProductId(rs.getInt("product_id")); // Set product ID
            cartItem.setProductName(rs.getString("product_name")); // Set product name
            cartItem.setDescription(rs.getString("description")); // Set description
            cartItem.setProductImage(rs.getBytes("product_image"));
            cartItem.setPrice(rs.getDouble("price")); // Set price
            cartItem.setQuantity(rs.getInt("quantity")); // Set quantity
            
            return cartItem; // Return the mapped CartItems object
        }
    }
}
