package com.student.demo.service;


import com.student.demo.po.UserCustom;

public interface UserService {
	public UserCustom findUserByUsernameAndPassword(String username, String password)
			throws Exception;

}
