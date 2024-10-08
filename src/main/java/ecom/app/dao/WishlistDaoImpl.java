package ecom.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ecom.app.entities.view_wishlist;
@Repository
public class WishlistDaoImpl implements WishlistDao{


    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void addWishlistItem(view_wishlist wishlist) {
        String sql = "INSERT INTO wishlist (product_name, description, price, product_image) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, wishlist.getProductName(), wishlist.getDescription(), wishlist.getPrice(), wishlist.getProductImage());
    }

    @Override
    public void updateWishlistItem(view_wishlist wishlist) {
        String sql = "UPDATE wishlist SET description = ?, price = ?, product_image = ? WHERE product_name = ?";
        jdbcTemplate.update(sql, wishlist.getDescription(), wishlist.getPrice(), wishlist.getProductImage(), wishlist.getProductName());
    }

    @Override
    public void deleteWishlistItem(String productName) {
        String sql = "DELETE FROM wishlist WHERE product_name = ?";
        jdbcTemplate.update(sql, productName);
    }

    @Override
    public List<view_wishlist> getAllWishlistItems() {
        String sql = "SELECT * FROM wishlist";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            view_wishlist wishlist = new view_wishlist();
            wishlist.setProductName(rs.getString("product_name"));
            wishlist.setDescription(rs.getString("description"));
            wishlist.setPrice(rs.getInt("price"));
            wishlist.setProductImage(rs.getBytes("product_image"));
            return wishlist;
        });
    }

    @Override
    public view_wishlist getWishlistItem(String productName) {
        String sql = "SELECT * FROM wishlist WHERE product_name = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{productName}, (rs, rowNum) -> {
            view_wishlist wishlist = new view_wishlist();
            wishlist.setProductName(rs.getString("product_name"));
            wishlist.setDescription(rs.getString("description"));
            wishlist.setPrice(rs.getInt("price"));
            wishlist.setProductImage(rs.getBytes("product_image"));
            return wishlist;
        });
    }
}

