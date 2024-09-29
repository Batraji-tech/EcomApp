package ecom.app.dao;

import ecom.app.dao.SuperAdminDao;
import ecom.app.entities.SuperAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class SuperAdminDaoImpl implements SuperAdminDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public SuperAdmin findByUsername(String username) {
        String sql = "SELECT * FROM super_admin WHERE username = ?";
        return jdbcTemplate.queryForObject(sql, new SuperAdminRowMapper(),username);
    }

    @Override
    public void updateSuperAdmin(SuperAdmin superAdmin) {
        String sql = "UPDATE super_admin SET first_name = ?, last_name = ?, email_id = ?, mobile_no = ?, username = ? WHERE id = ?";
        jdbcTemplate.update(sql, 
                            superAdmin.getFirstName(), 
                            superAdmin.getLastName(), 
                            superAdmin.getEmailId(), 
                            superAdmin.getMobileNo(), 
                            superAdmin.getUsername(), 
                            superAdmin.getId());
    }

    
    private final class SuperAdminRowMapper implements RowMapper<SuperAdmin> {
        @Override
        public SuperAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
            SuperAdmin superAdmin = new SuperAdmin();
            superAdmin.setId(rs.getInt("id"));
            superAdmin.setFirstName(rs.getString("first_name"));
            superAdmin.setLastName(rs.getString("last_name"));
            superAdmin.setEmailId(rs.getString("email_id"));
            superAdmin.setMobileNo(rs.getString("mobile_no"));;
            superAdmin.setUsername(rs.getString("username"));
            superAdmin.setPasswordSalt(rs.getString("password_salt"));
            superAdmin.setPasswordHash(rs.getString("password_hash"));
            return superAdmin;
        }
    }
}
