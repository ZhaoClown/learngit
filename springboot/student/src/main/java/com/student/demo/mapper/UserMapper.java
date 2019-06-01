package com.student.demo.mapper;

import com.student.demo.po.UserCustom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
	public UserCustom findUserByUsernameAndPassword(@Param("username") String username,
													@Param("password") String password) throws Exception;

}
