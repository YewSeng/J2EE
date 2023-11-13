package com.Caltech.pojo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class Batch {

	private int batchId;
	private Admin admin;
	private List<User> users;
	private TimeOfDay classTiming;
	private PreferenceDay preference;
	private LocalDateTime classStartTime;
    private LocalDateTime classEndTime;
    private int currentSize;
	private static final int MAX_CLASS_SIZE = 5;
	public Batch() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Batch(int batchId, Admin admin,TimeOfDay classTiming, PreferenceDay preference,
			LocalDateTime classStartTime, LocalDateTime classEndTime, int currentSize) {
		super();
		this.batchId = batchId;
		this.admin = admin;
		this.classTiming = classTiming;
		this.preference = preference;
		this.classStartTime = classStartTime;
		this.classEndTime = classEndTime;
		this.currentSize = currentSize;
	}
	
	public Batch(Admin admin, TimeOfDay classTiming, PreferenceDay preference,
			LocalDateTime classStartTime, LocalDateTime classEndTime, int currentSize) {
		super();
		this.admin = admin;
		this.classTiming = classTiming;
		this.preference = preference;
		this.classStartTime = classStartTime;
		this.classEndTime = classEndTime;
		this.currentSize = currentSize;
	}
	
	public int getBatchId() {
		return batchId;
	}
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public TimeOfDay getClassTiming() {
		return classTiming;
	}
	public void setClassTiming(TimeOfDay classTiming) {
		this.classTiming = classTiming;
	}
	public PreferenceDay getPreference() {
		return preference;
	}
	public void setPreference(PreferenceDay preference) {
		this.preference = preference;
	}
	public LocalDateTime getClassStartTime() {
		return classStartTime;
	}
	public void setClassStartTime(LocalDateTime classStartTime) {
		this.classStartTime = classStartTime;
	}
	public LocalDateTime getClassEndTime() {
		return classEndTime;
	}
	public void setClassEndTime(LocalDateTime classEndTime) {
		this.classEndTime = classEndTime;
	}
	public static int getMaxClassSize() {
		return MAX_CLASS_SIZE;
	}
	public int getCurrentSize() {
		return currentSize;
	}
	public void setCurrentSize(int currentSize) {
		this.currentSize = currentSize;
	}
}
