package com.wyq.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wyq.jpa.model.Category;

public interface CategoryDao extends JpaRepository<Category, Integer> {
	
	@Query("select c from Category c where c.blog.id=?1")
	public List<Category> getCategorysByBlogid(Integer id);
}
