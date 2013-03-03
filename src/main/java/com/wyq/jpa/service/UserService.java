package com.wyq.jpa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyq.jpa.dao.UserDao;
import com.wyq.jpa.model.User;

@Service
public class UserService {
	@Autowired
	private UserDao userdao;
	
	public boolean check(String userName,String password){
		User user=userdao.findByName(userName);
		if(user.getPassword().equals(password)){
			return true;
		}
		return false;
	}
}
