package com.jw.shop.domain;

import java.sql.Date;

public class ReplyVO {

//	create table reply (
//	    re_no      number        not null,
//	    bo_no      number        not null,
//	    re_content varchar2(255) not null,
//	    user_id    varchar2(255) not null,
//	    re_date    DATE          not null,
//	    CONSTRAINT re_no primary key (re_no)
//	);
	
	
	private int re_no;
	private int bo_no;
	private String re_content;
	private String user_id;
	private Date re_date;
	
	
	
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", bo_no=" + bo_no + ", re_content=" + re_content + ", user_id=" + user_id
				+ "]";
	}
	
	
	
	
}
