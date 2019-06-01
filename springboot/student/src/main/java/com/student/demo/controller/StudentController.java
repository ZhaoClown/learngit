package com.student.demo.controller;

import com.student.demo.po.StudentCustom;
import com.student.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/viewStudent")
	public StudentCustom viewStudent(Integer number) throws Exception{
		StudentCustom studentCustom=studentService.findStudentById(number);
		return studentCustom;
	}

}
