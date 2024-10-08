package ecom.app.dao;
 
 
import ecom.app.dao.CartItemsDao;
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
        String sql = "INSERT INTO cart_items (product_name, description, price, product_image, quantity) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, cartItem.getProduct_name(), cartItem.getDescription(), cartItem.getPrice(),
            cartItem.getProduct_name(), cartItem.getQuantity());
    }
 
    @Override
    public void updateCartItem(CartItems cartItem) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE product_name = ? ";
        jdbcTemplate.update(sql, cartItem.getQuantity(), cartItem.getProductName());
    }
 
    @Override
    public void deleteCartItem(String productName) {
        String sql = "DELETE FROM cart_items WHERE product_name = ?";
        jdbcTemplate.update(sql, productName);
    }
 
 
 
	@Override
	public List<CartItems> getAllCartItems() {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public CartItems getCartItem(String productName) {
		 String sql = "SELECT * FROM cart_items WHERE product_name = ?";
	        return (CartItems) jdbcTemplate.query(sql, (rs, rowNum) -> {
	            CartItems cartItem = new CartItems();
	            cartItem.setProductName(rs.getString("product_name"));
	            cartItem.setDescription(rs.getString("description"));
	            cartItem.setPrice(rs.getInt("price"));
	            cartItem.setProductImage(rs.getBytes("product_image"));
	            cartItem.setQuantity(rs.getInt("quantity"));
	           return cartItem;
	
	        });
 
	}
	
	public class CartItemsRowMapper implements RowMapper<CartItems> {
	    @Override
	    public CartItems mapRow(ResultSet rs, int rowNum) throws SQLException {
	        CartItems cartItem = new CartItems();
	        cartItem.setProductName(rs.getString("product_name"));
	        cartItem.setDescription(rs.getString("description"));
	        cartItem.setProductImage(rs.getBytes("product_image")); // Store image as byte[]
	        cartItem.setPrice(rs.getBigDecimal("price").intValue()); // Assuming price is stored as DECIMAL(10,2)
	        cartItem.setQuantity(rs.getInt("quantity")); // Assuming quantity is an integer    
	        return cartItem;
	    }
	}
 
	
	
}