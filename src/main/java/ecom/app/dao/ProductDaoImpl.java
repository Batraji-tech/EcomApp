 package ecom.app.dao;   
import ecom.app.entities.Products;
	import ecom.app.entities.User;
	 
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
	import org.springframework.stereotype.Repository;
	import org.springframework.web.multipart.MultipartFile;
	 
	import java.io.IOException;
	import java.sql.Blob;
	import java.sql.SQLException;
	import java.util.List;
	 
	import javax.sql.rowset.serial.SerialBlob;
	import javax.sql.rowset.serial.SerialException;
	 
	@Repository
	public class ProductDaoImpl implements ProductDao {
	    @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
		@Override
		public int insertProduct(Products product) throws IOException, SQLException {
			String query = "INSERT INTO product (product_name, description, mrp, discount, final_price, stock , delivery_charge, category_id,  product_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        return jdbcTemplate.update(query,
	            product.getProduct_name(),
	            product.getDescription(),
	            product.getMrp(),
	            product.getDiscount(),
	            product.getFinal_price(),
	            product.getStock(),
	            product.getDelivery_charge(),
	            product.getCategory_id(),
	            product.getProduct_image().getBytes()
	           );
	    }
	 
		private Blob getBlob(MultipartFile image) throws IOException, SerialException, SQLException {
			byte[] byteArr = image.getBytes();
			Blob imageBlob = new SerialBlob(byteArr);
			return imageBlob;
		}
		
		@Override
		public Products updateProduct(Products product) throws IOException, SQLException {
			Blob productImage = null;
			
	            productImage = getBlob(product.getProduct_image());
	      
	 
	        String query = "UPDATE product SET  description = ?, "
	                     + "mrp = ?, discount = ?, delivery_charge=?, final_price=? , stock =?, product_image = ? WHERE product_name =? ";
	 
	        
	        try {
	            int rowsAffected = jdbcTemplate.update(query,  product.getDescription(),
	            		product.getMrp() ,product.getDiscount(),product.getDelivery_charge(),product.getFinal_price() ,product.getStock()  , productImage, product.getProduct_name());
	            
	            System.out.println("Rows affected: " + rowsAffected);
	        } catch (Exception e) {
	            e.printStackTrace(); // Log the exception for debugging
	        }
	        
	        
	 
	        return getProductById(product.getProduct_id());
	    }
		
	 
		// Get a list of all products
	    @Override
	    public List<Products> getAllProducts() {
	        String sql = "SELECT * FROM product";
	        return jdbcTemplate.query(sql, new ProductRowMapper());
	    }
		
		
	 
//		@Override
//		public Products getProductById(int productId) {
//			String sql = "SELECT * FROM user WHERE user_id = ?";
//	 
//			return jdbcTemplate.queryForObject(sql, new ProductRowMapper(), productId);
//		}
	 
		public Products getProductById(int product_id) {
	        String sql = "SELECT * FROM product WHERE product_id = ?";
	        try {
	            return jdbcTemplate.queryForObject(sql, new Object[]{product_id}, new ProductRowMapper());
	        } catch (EmptyResultDataAccessException e) {
	            System.out.println("Product not found for ID: " + product_id); // Log the missing product
	            return null; // Return null or handle it as needed
	        }
	    }
	 
		@Override
		public void deleteProduct(int productId) throws IOException, SQLException {
	        String sql = "DELETE FROM product WHERE product_id = ?";
			jdbcTemplate.update(sql , productId);
		}
	 
	 
		@Override
		public List<Products> fetchAllProducts() throws IOException, SQLException {
		    String sql = "SELECT * FROM product";
		    List<Products> productsList = jdbcTemplate.query(sql, new ProductRowMapper());
		    System.out.println("Fetched Products: " + productsList); // Debug log
		    return productsList;
		}
	 
	 
		@Override
		public List<Products> fetchProductsByCategory(int category_id) throws IOException, SQLException {
	 
		    String sql = "SELECT * FROM product where category_id= ?";
		    List<Products> productsList = jdbcTemplate.query(sql, new ProductRowMapper(), category_id);
		    return productsList;
	 
		}
	 
		@Override
		public Products fetchProductById(int product_id) throws IOException, SQLException {
		   String sql = "SELECT * FROM product WHERE product_id = ?";
		    return jdbcTemplate.queryForObject(sql, new ProductRowMapper(),product_id);
		}
	 
		
	   
		
		}