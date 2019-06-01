package com.shopcar.demo.service;


import com.shopcar.demo.po.UserCustom;

public interface UserService {
	
	public UserCustom findUserByUsernameAndPassword(String username, String password)throws Exception;
	
}
