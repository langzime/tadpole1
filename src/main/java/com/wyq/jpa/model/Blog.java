package com.wyq.jpa.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


/**
 * The persistent class for the blog database table.
 * 
 */
@Entity
@Table(name="blog")
public class Blog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="backend_page_size")
	private int backendPageSize;
	
	@Column(name="backend_comment_size")
	private int backendCommentSize;
	
	@Column(name="comment_audit")
	private int commentAudit;

	@Column(length=255)
	private String description;

	@Column(name="entry_number")
	private int entryNumber;

	@Column(nullable=false, length=45)
	private String name;

	@Column(name="recent_comment_number")
	private int recentCommentNumber;

	@Column(name="recent_entry_number")
	private int recentEntryNumber;
	
	@OneToMany(cascade={},fetch = FetchType.LAZY,mappedBy="blog")
	List<Category> list=new ArrayList<Category>();
	
	@OneToMany(cascade={},fetch = FetchType.LAZY,mappedBy="blog")
	List<Link> links=new ArrayList<Link>();
	
	@OneToOne(mappedBy="blog")
	private User user;
	
	private int status;

	public Blog() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBackendPageSize() {
		return this.backendPageSize;
	}

	public void setBackendPageSize(int backendPageSize) {
		this.backendPageSize = backendPageSize;
	}

	public int getCommentAudit() {
		return this.commentAudit;
	}

	public void setCommentAudit(int commentAudit) {
		this.commentAudit = commentAudit;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getEntryNumber() {
		return this.entryNumber;
	}

	public void setEntryNumber(int entryNumber) {
		this.entryNumber = entryNumber;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRecentCommentNumber() {
		return this.recentCommentNumber;
	}

	public void setRecentCommentNumber(int recentCommentNumber) {
		this.recentCommentNumber = recentCommentNumber;
	}

	public int getRecentEntryNumber() {
		return this.recentEntryNumber;
	}

	public void setRecentEntryNumber(int recentEntryNumber) {
		this.recentEntryNumber = recentEntryNumber;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<Category> getList() {
		return list;
	}

	public void setList(List<Category> list) {
		this.list = list;
	}

	public int getBackendCommentSize() {
		return backendCommentSize;
	}

	public void setBackendCommentSize(int backendCommentSize) {
		this.backendCommentSize = backendCommentSize;
	}

	public List<Link> getLinks() {
		return links;
	}

	public void setLinks(List<Link> links) {
		this.links = links;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}