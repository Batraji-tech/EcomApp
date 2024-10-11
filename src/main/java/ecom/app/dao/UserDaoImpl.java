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
	
			String queryForInsertUser = "INSERT INTO user " + "(`first_name`, `last_name`, `email_id`, `mobile_no`, "
					+ "`date_of_birth`, `username`, `passwordSalt`, `passwordHash`, "
					+ "`role_id`, `profile_image`) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			String queryForCreateCart = "INSERT INTO cart (user_id) VALUES (LAST_INSERT_ID())";
			
			int res1 = jdbcTemplate.update(queryForInsertUser, user.getFirstName(), user.getLastName(), user.getEmailId(),
					user.getMobileNo(), user.getDateOfBirth(), user.getUsername(), user.getPasswordSalt(),
					user.getPasswordHash(),  user.getRole().getRoleId(), profileImage);
			
			int res2 = jdbcTemplate.update(queryForCreateCart);
			
			return res1 + res2;
			
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
		

		    @Override
		    public User modifyUser(User user) throws SerialException, IOException, SQLException {
		            System.out.println();
		    	
		    	Blob profileImage = null;
		        if (user.getProfileImage() != null) {
		            profileImage = getBlob(user.getProfileImage());
		        } else {
		            // Handle the case where there is no new image (optional)
		        }

		        String query = "UPDATE user SET first_name = ?, last_name = ?, "
		                     + "mobile_no = ?, date_of_birth = ?, profile_image = ? , username=? , email_id = ? WHERE username =? ";

		        
		        System.out.println("Updating user: " + user);

		        
		        
		        try {
		            int rowsAffected = jdbcTemplate.update(query, user.getFirstName(), user.getLastName(), 
		                                                   user.getMobileNo(), user.getDateOfBirth(), profileImage,  user.getUsername(),user.getEmailId(), user.getUsername());
		            System.out.println("Rows affected: " + rowsAffected);
		        } catch (Exception e) {
		            e.printStackTrace(); // Log the exception for debugging
		        }
		        
		        

		        return getUserById(user.getUserId());
		    }


			

			@Override
			public User getUserById(int userId) {
				String sql = "SELECT * FROM user WHERE user_id = ?";
				return jdbcTemplate.queryForObject(sql, new UserRowMapper(), userId);
			}

		
		    


			 
			@Override
			 public  int resetUserPassword(String username, String passwordHash, String passwordSalt) {
			        String sql = "UPDATE user SET passwordHash = ?, passwordSalt = ? WHERE username = ?";
			        return jdbcTemplate.update(sql, passwordHash, passwordSalt, username);
			        
			        
			    }
		    
	}

			
		
	
	
		
	

