package com.wyq.jpa.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.wyq.jpa.dao.EntryDao;
import com.wyq.jpa.model.Entry;
import com.wyq.jpa.util.Pager;

@Service
public class EntryService {
	@Autowired
	private EntryDao entryDao;
	
	public Pager getPager(int cid,int page,int size){
		Pager pager=new Pager();
		pager.setPageSize(size);
		pager.setMaxElments(entryDao.findAll().size());
		pager.setPageNumber(page);
		Page<Entry> pages=getPage(cid,pager.getPageNumber(), size);
		pager.setList(pages.getContent());
		pager.setCid(cid);
		return pager;
	}
	public Page<Entry> getPage(final int cid,int page,int size){
		Page<Entry> pages=null;
		PageRequest request=null;
		request=new PageRequest(page, size, new Sort(Sort.Direction.DESC, new String[]{"id"}));
		if(cid==-1){
			pages=entryDao.findAll(request);
		}else{
			pages=entryDao.findAll(new Specification<Entry>() {
				public Predicate toPredicate(Root<Entry> root, CriteriaQuery<?> query,
						CriteriaBuilder cb) {
					Path<String> idExp=root.get("category");
					return cb.equal(idExp,cid);
				}
			}, request);
		}
		return pages;
	}
	public List<Entry> getEntrys(int cid,int page,int size){
		return getPage(cid,page, size).getContent();
	}
	public Entry getEntryById(Integer id){
		return entryDao.findOne(id);
	}
}
