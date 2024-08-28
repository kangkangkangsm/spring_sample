package com.example.test1.model;

import lombok.Data;

@Data
public class Loan {
	//books
	private String bookId;
	private String title;
	private String author;
	private String publisher;
	private String price;
	private String stockQuantity;
	
	//Members
	private String memberId;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String joinDate;
	
}
