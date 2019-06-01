package com.shopcar.demo.mapper;

import com.shopcar.demo.po.UserCustom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapperCustom {
	
	public UserCustom findUserByUsernameAndPassword(@Param("username") String username,
													@Param("password") String password)throws Exception;

}
