package com.student.demo.po;

public class Score {
	private Integer id;
	private Integer number;
	private Double chinese;
	private Double math;
	private Double english;
	public Score() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Score(Integer id, Integer number, Double chinese, Double math, Double english) {
		super();
		this.id = id;
		this.number = number;
		this.chinese = chinese;
		this.math = math;
		this.english = english;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Double getChinese() {
		return chinese;
	}
	public void setChinese(Double chinese) {
		this.chinese = chinese;
	}
	public Double getMath() {
		return math;
	}
	public void setMath(Double math) {
		this.math = math;
	}
	public Double getEnglish() {
		return english;
	}
	public void setEnglish(Double english) {
		this.english = english;
	}
	

}
