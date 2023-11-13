package com.Caltech.pojo;

public class Contact {

	private int responseId;
	private String name;
	private String email;
	private String enquiries;
	public int getResponseId() {
		return responseId;
	}
	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEnquiries() {
		return enquiries;
	}
	public void setEnquiries(String enquiries) {
		this.enquiries = enquiries;
	}
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Contact(String name, String email, String enquiries) {
		super();
		this.name = name;
		this.email = email;
		this.enquiries = enquiries;
	}
	public Contact(int responseId, String name, String email, String enquiries) {
		super();
		this.responseId = responseId;
		this.name = name;
		this.email = email;
		this.enquiries = enquiries;
	}
}
