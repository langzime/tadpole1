package com.wyq.jpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wyq.jpa.dao.CommentDao;
import com.wyq.jpa.model.Comment;
import com.wyq.jpa.util.Pager;

@Service
@Transactional
public class CommentService {
	@Autowired
	CommentDao commentdao;
	public Page<Comment> getCommentsPage(Integer page,Integer size){
		PageRequest request=new PageRequest(page, size,new Sort(Direction.DESC, "id"));
		return commentdao.findAll(request);
	}
	public List<Comment> getCommentsList(Integer page,Integer size){
		return getCommentsPage(page, size).getContent();
	}
	
	public Page<Comment> getPage(Integer entryid,Integer page,Integer size){
		PageRequest request=new PageRequest(page, size,new Sort(Direction.DESC, "id"));
		return commentdao.getPage(entryid, request);
	}
	public Pager getPager(Integer entryid,Integer page,Integer size){
		Page<Comment> pages=getPage(entryid, page, size);
		Pager pager=new Pager();
		pager.setList(pages.getContent());
		pager.setMaxElments((int)pages.getTotalElements());
		pager.setPageNumber(pages.getNumber());
		pager.setPageSize(size);
		return pager;
	}
	
	public void save(Comment comment){
		commentdao.save(comment);
	}
}
