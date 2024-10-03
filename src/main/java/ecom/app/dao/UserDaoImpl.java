package ecom.app.dao;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import ecom.app.dao.UserDao;
import ecom.app.entities.User;
import ecom.app.dao.UserRowMapper;
import ecom.app.dao.RolesRowMapper;
import ecom.app.entities.Role;



	@Repository
	public class UserDaoImpl implements UserDao {

		@Autowired
		private JdbcTemplate jdbcTemplate;

		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}

		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}

	
		@Override
		public int insertUser(User user) throws IOException, SerialException, SQLException {

			Blob profileImage = getBlob(user.getProfileImage());
	
			String query = "INSERT INTO user " + "(`first_name`, `last_name`, `email_id`, `mobile_no`, "
					+ "`date_of_birth`, `username`, `passwordSalt`, `passwordHash`, "
					+ "`role_id`, `profile_image`) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			return jdbcTemplate.update(query, user.getFirstName(), user.getLastName(), user.getEmailId(),
					user.getMobileNo(), user.getDateOfBirth(), user.getUsername(), user.getPasswordSalt(),
					user.getPasswordHash(),  user.getRole().getRoleId(), profileImage);
		}
		
		private Blob getBlob(MultipartFile image) throws IOException, SerialException, SQLException {
			byte[] byteArr = image.getBytes();
			Blob imageBlob = new SerialBlob(byteArr);
			return imageBlob;
		}	
			
		
		@Override
		public List<Role> fetchAllRoles() {
			String sql = "SELECT * FROM roles WHERE role_id > 1 ORDER BY role_id";
			return jdbcTemplate.query(sql, new RolesRowMapper());
		}




		@Override
		public User fetchUser(String username) {
			String sql = "SELECT * FROM user WHERE username = ?";
			return jdbcTemplate.queryForObject(sql, new UserRowMapper(), username);

		}
		
		 @Override
		    public List<User> findAllCustomers() {
		        String sql = "SELECT * FROM user WHERE role_id = 3";
		        return jdbcTemplate.query(sql, new UserRowMapper());
		    }

		    @Override
		    public List<User> findAllSubAdmins() {
		        String sql = "SELECT * FROM user WHERE role_id = 2";
		        return jdbcTemplate.query(sql, new UserRowMapper());
		    }

		    public String getRoleName(int roleId) {
		        String sql = "SELECT role_name FROM roles WHERE role_id = ?";
		        return jdbcTemplate.queryForObject(sql, String.class, roleId);
		    }
		

	}

			
		
	
	
		
	

