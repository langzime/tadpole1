package com.wyq.jpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyq.jpa.dao.CategoryDao;
import com.wyq.jpa.model.Category;

@Service
public class CategoryService {
	
	@Autowired
	CategoryDao categoryDao;
	public List<Category> getCategorysByBlogid(Integer id){
		return categoryDao.getCategorysByBlogid(id);
	}
	
	public List<Category> getCategorys(){
		return categoryDao.findAll();
	}
	
	public Category getCategoryById(Integer id){
		return categoryDao.findOne(id);
	}
	public void update(Category category){
		categoryDao.save(category);
	}
	
	public void delCategoryById(Integer id){
		categoryDao.delete(id);
	}
}
