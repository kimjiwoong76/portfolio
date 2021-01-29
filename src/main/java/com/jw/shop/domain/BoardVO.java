package com.jw.shop.domain;

import java.sql.Date;

public class BoardVO {

	
//	create table board(  							게시판 테이블 생성
//	    b_no number(5) not null,					게시판 번호
//		private int b_depth;						게시판 뎁스
//	    user_id varchar2(255) not null,				유저 아이디
//	    user_pw varchar2(255) not null,				유저 패스워드
//	    b_subject varchar2(255) not null,			게시판 제목
//	    b_content varchar2(255),					게시판 내용
//	    b_date date default sysdate,				게시글 생성일
//	    b_modify date default sysdate,				게시글 수정일
//	    b_count number(5) not null,					게시판 조회수
//	    CONSTRAINT board_no PRIMARY KEY(b_no)		게시판 유일 키(게시판 번호)
//	);
	
	private int b_no;
	private int b_depth;
	private String user_id;
	private String user_pw;
	private String b_subject;
	private String b_content;
	private Date b_date;
	private Date b_modify;
	private int b_count;
	private int startIndex;
	private int cntPerPage;
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public Date getB_modify() {
		return b_modify;
	}
	public void setB_modify(Date b_modify) {
		this.b_modify = b_modify;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	
	
	
}
