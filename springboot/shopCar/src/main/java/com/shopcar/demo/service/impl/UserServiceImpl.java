package com.shopcar.demo.service.impl;

import com.shopcar.demo.mapper.UserMapperCustom;
import com.shopcar.demo.po.UserCustom;
import com.shopcar.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapperCustom userMapperCustom;
	@Override
	public UserCustom findUserByUsernameAndPassword(String username, String password) throws Exception {
		return userMapperCustom.findUserByUsernameAndPassword(username, password);
	}

}
