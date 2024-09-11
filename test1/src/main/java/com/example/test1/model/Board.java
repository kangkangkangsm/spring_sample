package com.example.test1.model;

import lombok.Data;

@Data
public class Board {
	private String boardNo;
	private String TITLE;
	private String CONTENTS;
	private String USERID;
	private String HIT;
	private String CATEGORY;
	private String FAVORITE;
	private String TAG1;
	private String TAG2;
	private String NOTICEYN;
	private String CDATETIME;
	private String UDATETIME;
	private String userName;
	private String email;
	private int cnt;
	private int cnt2;
	private String pcommentNo;
	private String CDATETIME2;
	
	private String cname;
	private int price;
	private String pdate;
	
	//PAYMENT
	private String merchantUid;
	private String merchantUname;
	
	//AREA
	private String si;
	private String gu;
	private String dong;
	private int nx;
	private int ny;
	//TBL_BOADRFILE
	private String idx;
	private String fileName;
	private String fileOrgName;
	private String filePath;
	private String fileSize;
	private String fileExt;
	private String thumbnailYN;
	
	//TBL_CODE
	private String kind;
	private String codeName;
	private int code;
	
	//TBL_ITEM
	private int itemNo;
	private String itemName;
	private int category1;
	
	
	
}
