package com.student.demo.service;


import com.student.demo.po.StudentCustom;

public interface StudentService {
	public StudentCustom findStudentById(Integer number) throws Exception;

}
