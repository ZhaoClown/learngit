package com.student.demo.service.impl;

import com.student.demo.mapper.StudentMapper;
import com.student.demo.po.StudentCustom;
import com.student.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;

	@Override
	public StudentCustom findStudentById(Integer number) throws Exception {
		return studentMapper.findStudentById(number);
	}

}
