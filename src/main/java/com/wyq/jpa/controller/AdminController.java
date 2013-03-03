package com.wyq.jpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wyq.jpa.service.UserService;

@RequestMapping(value="admin")
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String username,String password){
		if(userService.check(username, password)){
			return "admin/main";
		}
		return "admin/login";
	}
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String login1(){
		return "admin/login";
	}
}
