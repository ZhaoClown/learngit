package com.student.demo.po;

import java.util.Date;

public class Student {
	private Integer number;
	private String name;
	private String sex;
	private Date birthday;
	private String callphone;
	private String address;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(Integer number, String name, String sex, Date birthday, String callphone, String address) {
		super();
		this.number = number;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.callphone = callphone;
		this.address = address;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getCallphone() {
		return callphone;
	}
	public void setCallphone(String callphone) {
		this.callphone = callphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
