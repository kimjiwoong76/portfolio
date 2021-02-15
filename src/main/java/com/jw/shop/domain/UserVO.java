package com.jw.shop.domain;

public class UserVO {

//	create table shop_member( 
//	    shop_id        VARCHAR2(50) PRIMARY KEY not null,
//	    shop_pwd       VARCHAR2(50) not null,
//	    shop_name      VARCHAR2(20) not null,
//	    shop_nickname  VARCHAR2(20) not null,
//	    shop_email     VARCHAR2(50) not null,
//	    shop_number    VARCHAR2(20) not null,
//	    shop_gender    VARCHAR2(20) not null,
//		regdate date default SYSDATE
//	);
	
	private String shop_id;
	private String shop_pwd;
	private String shop_name;
	private String shop_nickname;
	private String shop_email;
	private String shop_number;
	private String shop_gender;
	private String regdate;
	private String sql_ok;
	private int grade;
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getSql_ok() {
		return sql_ok;
	}
	public void setSql_ok(String sql_ok) {
		this.sql_ok = sql_ok;
	}
	public String getShop_id() {
		return shop_id;
	}
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	public String getShop_pwd() {
		return shop_pwd;
	}
	public void setShop_pwd(String shop_pwd) {
		this.shop_pwd = shop_pwd;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_nickname() {
		return shop_nickname;
	}
	public void setShop_nickname(String shop_nickname) {
		this.shop_nickname = shop_nickname;
	}
	public String getShop_email() {
		return shop_email;
	}
	public void setShop_email(String shop_email) {
		this.shop_email = shop_email;
	}
	public String getShop_number() {
		return shop_number;
	}
	public void setShop_number(String shop_number) {
		this.shop_number = shop_number;
	}
	public String getShop_gender() {
		return shop_gender;
	}
	public void setShop_gender(String shop_gender) {
		this.shop_gender = shop_gender;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "UserVO [shop_id=" + shop_id + ", shop_pwd=" + shop_pwd + ", shop_name=" + shop_name + ", shop_nickname="
				+ shop_nickname + ", shop_email=" + shop_email + ", shop_number=" + shop_number + ", shop_gender="
				+ shop_gender + ", regdate=" + regdate + ", sql_ok=" + sql_ok + "]";
	}
}
