package ecom.app.dao;

import ecom.app.entities.Order;
import ecom.app.entities.Products;
import jakarta.servlet.http.HttpSession;
import ecom.app.entities.CartItems;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ProductDaoImpl productDaoImpl;
    
    @Override
    public void saveOrder(Order order) throws IOException, SQLException {
    	String sql = "INSERT INTO orders (user_id, total_amount, payment_method, status, order_date) VALUES (?, ?, ?, ?, ?)";
    	Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
    	int rowsAffected = jdbcTemplate.update(sql, order.getUserId(), order.getTotalAmount(), order.getPaymentMethod(), order.getStatus(), currentTimestamp);

        
        System.out.println("Rows affected when saving order: " + rowsAffected);

        if (rowsAffected > 0) {
            // Get the generated order ID
            String orderIdSql = "SELECT LAST_INSERT_ID()";
            int orderId = jdbcTemplate.queryForObject(orderIdSql, Integer.class);
            
            // Insert order items into order_items table
            for (CartItems item : order.getOrderItems()) {
                String orderItemSql = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
                jdbcTemplate.update(orderItemSql, orderId, item.getProductId(), item.getQuantity());
            }
        } else {
            throw new SQLException("Failed to insert order");
        }
    }

    
    @Override
    public List<Order> getOrdersByUserId(int userId) throws SQLException, IOException {
        String sql = "SELECT * FROM orders WHERE user_id = ?";
        List<Order> orders = jdbcTemplate.query(sql, new Object[]{userId}, (rs, rowNum) -> {
            int orderId = rs.getInt("order_id");
            double totalAmount = rs.getDouble("total_amount");
            String paymentMethod = rs.getString("payment_method");
            String status = rs.getString("status");
            Timestamp orderDate = rs.getTimestamp("order_date");

            // Fetch order items for this order
            List<CartItems> orderItems = getOrderItems(orderId);
            return new Order(orderId, userId, orderItems, totalAmount, paymentMethod, status, orderDate);
        });

        System.out.println("Fetched orders for user ID " + userId + ": " + orders);
        return orders;
    }



    // Method to fetch items for a specific order
    public List<CartItems> getOrderItems(int orderId) throws SQLException {
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        return jdbcTemplate.query(sql, new Object[]{orderId}, (rs, rowNum) -> {
            int product_id = rs.getInt("product_id");
            int quantity = rs.getInt("quantity");
            // Fetch product details to create CartItems object
            Products product = productDaoImpl.getProductById(product_id); // Implement getProductById in ProductDao
            return new CartItems(product_id, product.getProduct_name(), product.getDescription(), product.getFinal_price(), quantity, product.getDelivery_charge());
        });
    }

    public void clearCart(HttpSession session) {
        session.setAttribute("cartItems", new ArrayList<CartItems>()); // Reset cart to empty list
    }
    
    @Override
    public void removeCartProducts(int userId) throws SQLException {
        // Step 1: Get the cart_id for the user
        String getCartIdSql = "SELECT cart_id FROM cart WHERE user_id = ?";
        Integer cartId = jdbcTemplate.queryForObject(getCartIdSql, new Object[]{userId}, Integer.class);
        
        // Check if cartId is found
        if (cartId != null) {
            // Step 2: Delete items from cart_items using the cart_id
            String deleteItemsSql = "DELETE FROM cart_items WHERE cart_id = ?";
            jdbcTemplate.update(deleteItemsSql, cartId);
            System.out.println("Deleted items from cart with cart_id: " + cartId);
        } else {
            System.out.println("No cart found for user_id: " + userId);
        }
    }



}
