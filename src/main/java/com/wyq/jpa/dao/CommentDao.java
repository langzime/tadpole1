package com.wyq.jpa.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.wyq.jpa.model.Comment;

public interface CommentDao extends JpaRepository<Comment, Integer>,JpaSpecificationExecutor<Comment> {
	@Query("select c from Comment c where c.entry.id=?1")
	public Page<Comment> getPage(Integer entryid,Pageable pageable);

}
