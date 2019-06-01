package com.student.demo.controller;


import com.student.demo.po.UserCustom;
import com.student.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
public class LoginController {
	
	@Autowired
	private UserService userService;
	@RequestMapping("/login")
	public UserCustom login(HttpServletRequest request, String username, String password)throws Exception{
		UserCustom userCustom=userService.findUserByUsernameAndPassword(username, password);
		request.getSession().setAttribute("userCustom", userCustom);
		return userCustom;
	}

}
