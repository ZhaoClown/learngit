package com.shopcar.demo.controller;

import com.shopcar.demo.po.UserCustom;
import com.shopcar.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/login")
	public UserCustom login(HttpSession session, String username, String password) throws Exception{
		UserCustom userCustom=userService.findUserByUsernameAndPassword(username, password);
		session.setAttribute("user", userCustom);
		return userCustom;
	}

	@RequestMapping("/user")
	public UserCustom user(HttpSession session, String username, String password) throws Exception{
		UserCustom userCustom= (UserCustom) session.getAttribute("user");
		return userCustom;
	}
	
	@RequestMapping("/exit")
	public boolean exit(HttpSession session)throws Exception{
		session.removeAttribute("user");
		return true;
	}

}
