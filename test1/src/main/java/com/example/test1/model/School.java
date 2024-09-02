package com.example.test1.model;

import lombok.Data;

@Data
public class School {
	
	//학생 테이블(STU)
	private String stuNo;
	private String name;
	private String id;
	private String grade;
	private String jumin;
	private String birthday;
	private String tel;
	private String height;
	private String weight;
	private String deptNo1;
	private String deptNo2;
	private String profNo;
	
	//교수 테이블(PROFESSOR)
	private String pProfNo;
	private String pName;
	private String pId;
	private String pPosition;
	private String pPay;
	private String pHiredate;
	private String pBouns;
	private String pDeptNo;
	private String pEmail;
	private String pHpage;
	
	//학부 테이블(DEPARTMENT)
	
	private String dDeptNo;
	private String dDName;
	private String d2DName;
	private String dPart;
	private String dBuild;
	
	// 리스트 개수 
	private String CNT;
	
}
