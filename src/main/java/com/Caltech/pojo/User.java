package com.Caltech.pojo;

public class User {

	private int userId;
	private String username;
	private String password;
	private int batchId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getBatchId() {
		return batchId;
	}
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public User(String username, String password, int batchId) {
		super();
		this.username = username;
		this.password = password;
		this.batchId = batchId;
	}
	public User(int userId, String username, String password, int batchId) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.batchId = batchId;
	}
}
