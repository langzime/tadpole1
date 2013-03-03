package com.wyq.jpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wyq.jpa.dao.LinkDao;
import com.wyq.jpa.model.Link;
@Service
@Transactional
public class LinkService {
	@Autowired
	LinkDao linkdao;
	public List<Link> getLinks(){
		return linkdao.findAll();
	}
	
}
