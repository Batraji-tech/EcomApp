package ecom.app.dao;

import java.util.List;
import java.io.IOException;
import java.sql.SQLException;
import ecom.app.entities.Products;
import ecom.app.entities.User;

public interface ProductDao {

	  int insertProduct(Products product) throws IOException, SQLException;

	   Products updateProduct(Products product) throws IOException, SQLException;
  

	    List<Products> fetchAllProducts() throws IOException, SQLException;
	
	    void deleteProduct(int productId) throws IOException, SQLException;

	    List<Products> fetchProductsByCategory(int category_id) throws IOException, SQLException;

	    Products fetchProductById(int id) throws IOException, SQLException;

		Products getProductById(int productId);
		
		
}
