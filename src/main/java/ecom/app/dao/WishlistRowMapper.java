package ecom.app.dao;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ecom.app.entities.view_wishlist;

public class WishlistRowMapper implements RowMapper<view_wishlist> {
    @Override
    public view_wishlist mapRow(ResultSet rs, int rowNum) throws SQLException {
        view_wishlist wishlist = new view_wishlist();
        wishlist.setProductName(rs.getString("product_name"));
        wishlist.setDescription(rs.getString("description"));
        wishlist.setProductImage(rs.getBytes("product_image")); // Store image as byte[]
        wishlist.setPrice(rs.getBigDecimal("price").intValue()); // Assuming price is stored as DECIMAL(10,2)
        return wishlist;
    }
}

