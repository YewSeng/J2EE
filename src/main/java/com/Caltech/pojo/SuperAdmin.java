package com.Caltech.pojo;

public class SuperAdmin {
	private int superAdminId;
	private String superAdminUsername;
	private String superAdminPassword;
	public int getSuperAdminId() {
		return superAdminId;
	}
	public void setSuperAdminId(int superAdminId) {
		this.superAdminId = superAdminId;
	}
	public String getSuperAdminUsername() {
		return superAdminUsername;
	}
	public void setSuperAdminUsername(String superAdminUsername) {
		this.superAdminUsername = superAdminUsername;
	}
	public String getSuperAdminPassword() {
		return superAdminPassword;
	}
	public void setSuperAdminPassword(String superAdminPassword) {
		this.superAdminPassword = superAdminPassword;
	}
	public SuperAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SuperAdmin(int superAdminId, String superAdminUsername, String superAdminPassword) {
		super();
		this.superAdminId = superAdminId;
		this.superAdminUsername = superAdminUsername;
		this.superAdminPassword = superAdminPassword;
	}
	public SuperAdmin(String superAdminUsername, String superAdminPassword) {
		super();
		this.superAdminUsername = superAdminUsername;
		this.superAdminPassword = superAdminPassword;
	}	
}
