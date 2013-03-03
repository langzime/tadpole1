package com.wyq.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wyq.jpa.model.Blog;

public interface BlogDao extends JpaRepository<Blog, Integer>{

}
