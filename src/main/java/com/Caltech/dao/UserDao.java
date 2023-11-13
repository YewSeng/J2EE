package com.Caltech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.Caltech.dbUtil.DbUtil;
import com.Caltech.pojo.Admin;
import com.Caltech.pojo.User;

public class UserDao {

	public boolean verifyUser(String username, String password) {
		String sql = "SELECT password FROM USER WHERE username = ?";
	    boolean validUser = false;
	    
	    try (Connection con = DbUtil.getDbConnection();
	    		PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, username);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                // Retrieve the hashed password from the database
	                String hashedPasswordFromDb = rs.getString("password");

	                // Compare the provided password with the hashed password from the database
	                validUser = BCrypt.checkpw(password, hashedPasswordFromDb);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return validUser;
	}
	
	public int insertUser(User user) {
		String sql = "INSERT INTO USER(username, password, batchId) VALUES (?,?,?)";
		int result = 0;
		try (Connection con = DbUtil.getDbConnection();
		             PreparedStatement ps = con.prepareStatement(sql);) {
		            ps.setString(1, user.getUsername());
		            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		            ps.setString(2, hashedPassword);
		            ps.setInt(3, user.getBatchId());
		            result = ps.executeUpdate();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return result;
	}
	
	public int updateUser(User user) {
		String sql = "UPDATE USER SET username = ?, password = ?, batchId = ? WHERE userId = ?";
		int result = 0;
		try (Connection con = DbUtil.getDbConnection();
		             PreparedStatement ps = con.prepareStatement(sql);) {
		            ps.setString(1, user.getUsername());
		            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		            ps.setString(2, hashedPassword);
		            ps.setInt(3, user.getBatchId());
		            ps.setInt(4, user.getUserId());
		            result = ps.executeUpdate();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return result;
	}

	public List<User> retrieveUsers() {
		List<User> userList = new ArrayList<>();
		String sql = "SELECT * FROM USER";
	    try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql);
		         ResultSet rs = ps.executeQuery()) {
		        while (rs.next()) {
		            User user = new User();
		            int userId = rs.getInt("userId");
		            user.setUserId(userId);
		            String username = rs.getString("username");
		            user.setUsername(username);
		            int batchId = rs.getInt("batchId");
		            user.setBatchId(batchId);
		            userList.add(user);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return userList;
	}
	
	public int deleteUser(int userId) {
		String sql = "DELETE FROM USER WHERE userId = ?";
		int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql);) {
		    ps.setInt(1, userId);     
	    	result = ps.executeUpdate();	
		
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		    return result;
	}
	
	public User getUser(int userId) {
		String sql = "SELECT * FROM USER WHERE userId = ?";
		User user = null;
		try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, userId);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		            	user = new User();
		                String username = rs.getString("username");
		                user.setUserId(userId);
		                user.setUsername(username);
		                user.setBatchId(rs.getInt("batchId"));
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return user;
	}
	
	public User getUserByBatchId(int batchId) {
		String sql = "SELECT * FROM USER WHERE batchId = ?";
		User user = null;
		try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, batchId);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		            	user = new User();
		                String username = rs.getString("username");
		                int userId = rs.getInt("userId");
		                user.setBatchId(batchId);
		                user.setUsername(username);
		                user.setUserId(userId);
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return user;
	}
	
	 public User getUserByUsername(String username) {
	        String sql = "SELECT * FROM USER WHERE username = ?";
	        User user = null;

	        try (Connection con = DbUtil.getDbConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setString(1, username);

	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    user = new User();
	                    int userId = rs.getInt("userId");
	                    int batchId = rs.getInt("batchId");

	                    user.setUserId(userId);
	                    user.setUsername(username);
	                    user.setBatchId(batchId);
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }
	
	public List<User> getUsersByBatch(int batchId) {
	    List<User> users = new ArrayList<>();
	    String sql = "SELECT * FROM User WHERE batchId = ?";
	    
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, batchId);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                User user = new User();
	                user.setUserId(rs.getInt("userId"));
	                user.setUsername(rs.getString("username"));
	                // Set other user properties as needed
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return users;
	}
}
