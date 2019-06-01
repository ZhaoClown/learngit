package com.student.demo.mapper;

import com.student.demo.po.StudentCustom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StudentMapper {
	public StudentCustom findStudentById(@Param("number") Integer number) throws Exception;

}
