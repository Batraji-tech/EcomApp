package ecom.app.dao;

import java.util.Base64;
import java.util.List;
import ecom.app.entities.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;	


@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get a list of all products
    @Override
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM product";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapProduct(rs));
    }

    // Get a product by its ID
    @Override
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> mapProduct(rs), productId);
        } catch (Exception e) {
            return null; // Handle the case when product is not found
        }
    }

    // Helper method to map the result set to a Product object
    private Product mapProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setProductId(rs.getInt("product_id"));
        product.setCategoryId(rs.getInt("category_id"));
        product.setProductName(rs.getString("product_name"));
        product.setDescription(rs.getString("description"));
        product.setMrp(rs.getDouble("mrp"));
        product.setDiscount(rs.getDouble("discount"));
        product.setFinalPrice(rs.getDouble("final_price"));
        product.setStock(rs.getInt("stock"));
        product.setProductImage(rs.getBytes("product_image"));
        product.setStatus(rs.getInt("status"));
        return product;
    }
}
