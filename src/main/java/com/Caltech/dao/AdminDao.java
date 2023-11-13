package com.Caltech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.Caltech.dbUtil.DbUtil;
import com.Caltech.pojo.Admin;
import com.Caltech.pojo.Batch;
import com.Caltech.pojo.PreferenceDay;
import com.Caltech.pojo.TimeOfDay;

public class AdminDao {

	public boolean verifyAdmin(String adminUsername, String adminPassword) {
		String sql = "SELECT adminPassword FROM ADMIN WHERE adminUsername = ?";
	    boolean validAdmin = false;
	    
	    try (Connection con = DbUtil.getDbConnection();
	    		PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, adminUsername);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                // Retrieve the hashed password from the database
	                String hashedPasswordFromDb = rs.getString("adminPassword");

	                // Compare the provided password with the hashed password from the database
	                validAdmin = BCrypt.checkpw(adminPassword, hashedPasswordFromDb);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return validAdmin;
	}

	public Admin getAdminByUsername(String adminUsername) {
	    String sql = "SELECT * FROM ADMIN WHERE adminUsername = ?";
	    Admin admin = null;

	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, adminUsername);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	            	admin = new Admin();
	                int adminId = rs.getInt("adminId");
	                String username = rs.getString("adminUsername");
	                admin.setAdminId(adminId);
	                admin.setAdminUsername(username);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return admin;
	}
	public Admin getAdminById(int adminId) {
		 String sql = "SELECT * FROM ADMIN WHERE adminId = ?";
		    Admin admin = null;

		    try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, adminId);

		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		            	admin = new Admin();
		                String username = rs.getString("adminUsername");
		                admin.setAdminId(adminId);
		                admin.setAdminUsername(username);
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return admin;
	}
	
	public int insertAdmin(Admin admin) {
		  String sql = "INSERT INTO ADMIN(adminUsername, adminPassword) VALUES (?,?)";
		  int result = 0;
		  try (Connection con = DbUtil.getDbConnection();
		             PreparedStatement ps = con.prepareStatement(sql);) {
		            ps.setString(1, admin.getAdminUsername());
		            String hashedPassword = BCrypt.hashpw(admin.getAdminPassword(), BCrypt.gensalt(12));
		            ps.setString(2, hashedPassword);
		            result = ps.executeUpdate();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return result;
	}
	
	public List<Admin> retrieveAdmin() {
		List<Admin> adminList = new ArrayList<>();
		String sql = "SELECT * FROM ADMIN";
	    try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql);
		         ResultSet rs = ps.executeQuery()) {
		        while (rs.next()) {
		            Admin admin = new Admin();
		            int adminId = rs.getInt("adminId");
		            admin.setAdminId(adminId);
		            String adminUsername = rs.getString("adminUsername");
		            admin.setAdminUsername(adminUsername);
		            adminList.add(admin);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return adminList;
	}
	
	public int updateAdmin(Admin admin) {
		String sql = "UPDATE ADMIN SET adminUsername = ?, adminPassword = ? WHERE adminId = ?";
		int result = 0;
		try (Connection con = DbUtil.getDbConnection();
		       PreparedStatement ps = con.prepareStatement(sql);) {
		    ps.setString(1, admin.getAdminUsername());
		    String hashedPassword = BCrypt.hashpw(admin.getAdminPassword(), BCrypt.gensalt(12));
		    ps.setString(2, hashedPassword);
		    ps.setInt(3, admin.getAdminId());
		    result = ps.executeUpdate();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		    return result;		
	}
	
	public int deleteAdmin(int adminId) {
		String sql = "DELETE FROM ADMIN WHERE adminId = ?";
		int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql);) {
		    ps.setInt(1, adminId);     
	    	result = ps.executeUpdate();	
		
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		    return result;
	}
	
	public Admin getAdmin(int adminId) {
		String sql = "SELECT * FROM ADMIN WHERE adminId = ?";
		Admin admin = null;
		try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, adminId);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		            	admin = new Admin();
		            	admin.setAdminId(adminId);
		            	admin.setAdminUsername(rs.getString("adminUsername"));
		            	admin.setAdminPassword(rs.getString("adminPassword"));
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return admin;
	}
}
