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
import com.Caltech.pojo.User;

public class BatchDao {

	public int insertBatch(Batch batch) {
	    String sql = "INSERT INTO Batch(adminUsername, classTiming, preference, "
	            + "classStartTime, classEndTime, currentSize) VALUES (?, ?, ?, ?, ?, ?)";
	    int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, batch.getAdmin().getAdminUsername());
	        ps.setString(2, batch.getClassTiming().name()); 
	        ps.setString(3, batch.getPreference().name()); 
	        ps.setTimestamp(4, java.sql.Timestamp.valueOf(batch.getClassStartTime()));
	        ps.setTimestamp(5, java.sql.Timestamp.valueOf(batch.getClassEndTime()));
	        ps.setInt(6, 0); 
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	public int updateBatch(Batch batch) {
	    String sql = "UPDATE Batch SET adminUsername = ?, classTiming = ?, preference = ?, "
	            + "classStartTime = ?, classEndTime = ?, currentSize = ? WHERE batchId = ?";
	    int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, batch.getAdmin().getAdminUsername());
	        ps.setString(2, batch.getClassTiming().name()); 
	        ps.setString(3, batch.getPreference().name()); 
	        ps.setTimestamp(4, java.sql.Timestamp.valueOf(batch.getClassStartTime()));
	        ps.setTimestamp(5, java.sql.Timestamp.valueOf(batch.getClassEndTime()));
	        ps.setInt(6, batch.getCurrentSize());
	        ps.setInt(7, batch.getBatchId()); 
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	public int increaseBatchSize(int batchId) {
	    String sql = "UPDATE Batch SET currentSize = currentSize + 1 WHERE batchId = ?";
	    int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, batchId);
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	public int decreaseBatchSize(int batchId) {
	    String sql = "UPDATE Batch SET currentSize = currentSize - 1 WHERE batchId = ?";
	    int result = 0;
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, batchId);
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	public List<Batch> retrieveBatches() {
	    List<Batch> batches = new ArrayList<>();
	    String sql = "SELECT * FROM BATCH";
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            Batch batch = new Batch();
	            int batchId = rs.getInt("batchId");
	            batch.setBatchId(batchId);
	            String adminUsername = rs.getString("adminUsername");
	            AdminDao adminDao = new AdminDao();
	            Admin admin = adminDao.getAdminByUsername(adminUsername); 
	            batch.setAdmin(admin);
	            String classTiming = rs.getString("classTiming");
	            batch.setClassTiming(TimeOfDay.valueOf(classTiming));
	            String preference = rs.getString("preference");
	            batch.setPreference(PreferenceDay.valueOf(preference));
	            LocalDateTime classStart = rs.getTimestamp("classStartTime").toLocalDateTime();
	            batch.setClassStartTime(classStart);
	            LocalDateTime classEnd = rs.getTimestamp("classEndTime").toLocalDateTime();
	            batch.setClassEndTime(classEnd);
	            int classSize = rs.getInt("currentSize");
	            batch.setCurrentSize(classSize);
	            batches.add(batch);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return batches;
	}

	public int deleteBatch(int batchId) {
		String sql = "DELETE FROM BATCH WHERE batchId = ?";
		int result = 0;
		try (Connection con = DbUtil.getDbConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, batchId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return result;
	}
	
	public List<Batch> retrieveOpenBatches() {
	    List<Batch> openBatches = new ArrayList<>();
	    String sql = "SELECT * FROM BATCH WHERE currentSize < 5";
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            Batch batch = new Batch();
	            int batchId = rs.getInt("batchId");
	            batch.setBatchId(batchId);
	            String adminUsername = rs.getString("adminUsername");
	            AdminDao adminDao = new AdminDao();
				Admin admin = adminDao.getAdminByUsername(adminUsername); 
	            batch.setAdmin(admin);
	            String classTiming = rs.getString("classTiming");
	            batch.setClassTiming(TimeOfDay.valueOf(classTiming));
	            String preference = rs.getString("preference");
	            batch.setPreference(PreferenceDay.valueOf(preference));
	            LocalDateTime classStart = rs.getTimestamp("classStartTime").toLocalDateTime();
	            batch.setClassStartTime(classStart);
	            LocalDateTime classEnd = rs.getTimestamp("classEndTime").toLocalDateTime();
	            batch.setClassEndTime(classEnd);
	            int classSize = rs.getInt("currentSize");
	            batch.setCurrentSize(classSize);
	            openBatches.add(batch);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return openBatches;
	}
	
	public List<Batch> retrieveOpenBatches(String timeOfDay, String preferences) {
	    List<Batch> openBatches = new ArrayList<>();
	    String sql = "SELECT * FROM Batch WHERE currentSize < 5 AND classTiming = ? AND preference = ?";
	    
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, timeOfDay);
	        ps.setString(2, preferences);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Batch batch = new Batch();
	                int batchId = rs.getInt("batchId");
	                batch.setBatchId(batchId);
	                String adminUsername = rs.getString("adminUsername");
	                AdminDao adminDao = new AdminDao();
	                Admin admin = adminDao.getAdminByUsername(adminUsername);
	                batch.setAdmin(admin);
	                String classTiming = rs.getString("classTiming");
	                batch.setClassTiming(TimeOfDay.valueOf(classTiming));
	                String preference = rs.getString("preference");
	                batch.setPreference(PreferenceDay.valueOf(preference));
		            LocalDateTime classStart = rs.getTimestamp("classStartTime").toLocalDateTime();
		            batch.setClassStartTime(classStart);
		            LocalDateTime classEnd = rs.getTimestamp("classEndTime").toLocalDateTime();
		            batch.setClassEndTime(classEnd);
	                int classSize = rs.getInt("currentSize");
	                batch.setCurrentSize(classSize);
	                openBatches.add(batch);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return openBatches;
	}

	public Batch getBatch(int batchId) {
		String sql = "SELECT * FROM BATCH WHERE batchId = ?";
		Batch batch = null;
		try (Connection con = DbUtil.getDbConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, batchId);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		            	batch = new Batch();
		            	batch.setBatchId(rs.getInt("batchId"));
		            	String adminUsername = rs.getString("adminUsername");
		                AdminDao adminDao = new AdminDao();
		                Admin admin = adminDao.getAdminByUsername(adminUsername);
		                batch.setAdmin(admin);
		                String classTiming = rs.getString("classTiming");
		                batch.setClassTiming(TimeOfDay.valueOf(classTiming));
		                String preference = rs.getString("preference");
		                batch.setPreference(PreferenceDay.valueOf(preference));
			            LocalDateTime classStart = rs.getTimestamp("classStartTime").toLocalDateTime();
			            batch.setClassStartTime(classStart);
			            LocalDateTime classEnd = rs.getTimestamp("classEndTime").toLocalDateTime();
			            batch.setClassEndTime(classEnd);
		                int classSize = rs.getInt("currentSize");
		                batch.setCurrentSize(classSize);		                
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return batch;
	}
	
	public List<Batch> retrieveBatchesByAdmin(String adminUsername) {
	    List<Batch> batches = new ArrayList<>();
	    String sql = "SELECT * FROM BATCH WHERE adminUsername = ?";
	    try (Connection con = DbUtil.getDbConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, adminUsername);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Batch batch = new Batch();
	                int batchId = rs.getInt("batchId");
	                batch.setBatchId(batchId);
	                String batchAdminUsername = rs.getString("adminUsername");
	                AdminDao adminDao = new AdminDao();
	                Admin admin = adminDao.getAdminByUsername(batchAdminUsername);
	                batch.setAdmin(admin);
	                String classTiming = rs.getString("classTiming");
	                batch.setClassTiming(TimeOfDay.valueOf(classTiming));
	                String preference = rs.getString("preference");
	                batch.setPreference(PreferenceDay.valueOf(preference));
	                LocalDateTime classStart = rs.getTimestamp("classStartTime").toLocalDateTime();
	                batch.setClassStartTime(classStart);
	                LocalDateTime classEnd = rs.getTimestamp("classEndTime").toLocalDateTime();
	                batch.setClassEndTime(classEnd);
	                int classSize = rs.getInt("currentSize");
	                batch.setCurrentSize(classSize);
	                batches.add(batch);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return batches;
	}

}
