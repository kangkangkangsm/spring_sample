package com.example.test1.model;

import lombok.Data;

@Data
public class Test {
	//TEST_USERS
	private String userId; // 사용자 id (기본키)
	private String userName; // 사용자 이름
	private String password; // 사용자 비밀번호 
	private String email; // 사용자 이메일 (유니크)
	private String createdat; // 생성일 
	
	//TEST_POSTS 
	private String postId; // 게시글 id (기본키)
	private String pUserId; // 작성자 id (외래키)
	private String title; // 게시글 제목
	private String contents; // 게시글 내용 
	private String pCreatedat; // 생성일시 
	
	//TEST_COMMENTS 
	private String commentId; //댓글 id 
	private String cPostId; // 게시글 id
	private String cUserId; // 작성자 id
	private String cContents; // 댓글 내용 
	private String parentCommentId; // 상위 댓글 ID (대댓글의 경우)
	private String cCreatedat; // 생성일시 
	
}
