package com.wyq.jpa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyq.jpa.dao.BlogDao;
import com.wyq.jpa.model.Blog;

@Service
public class BlogService {
	@Autowired
	BlogDao blogDao;
	public Blog findById(Integer id){
		return blogDao.findOne(id);
	}
}
