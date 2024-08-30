package com.example.test1.model;

import lombok.Data;

@Data
public class User {
	

	
	public String getUserId() {
		return userId;
	}
	public String getPwd() {
		return pwd;
	}
	public String getUserName() {
		return userName;
	}
	public String getStatus() {
		return status;
	}
	public String getEmail() {
		return email;
	}
	private String userId;
	private String pwd;
	private String userName;
	private String email;
	private String phone;
	private String gender;
	private String status;
}
