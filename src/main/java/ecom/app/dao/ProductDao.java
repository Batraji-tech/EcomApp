package ecom.app.dao;

import java.util.List;

import ecom.app.entities.Product;

public interface ProductDao {
    List<Product> getAllProducts();
    Product getProductById(int productId);
}
