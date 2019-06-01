package com.student.demo.service.impl;

import com.student.demo.mapper.UserMapper;
import com.student.demo.po.UserCustom;
import com.student.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserCustom findUserByUsernameAndPassword(String username, String password) throws Exception {
		return userMapper.findUserByUsernameAndPassword(username, password);
	}

}
