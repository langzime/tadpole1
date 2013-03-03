package com.wyq.jpa.model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the entry database table.
 * 
 */
@Entity
@Table(name="entry")
public class Entry implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="allow_comment", nullable=false)
	private int allowComment;

	
	@ManyToOne(cascade={},optional=false)  
    @JoinColumn(name="category_id")//设置外键的名称
	private Category category;
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name="comment_hit", nullable=false)
	private int commentHit;

	@Column(nullable=false, length=255)
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time", nullable=false)
	private Date createdTime;

	@Column(nullable=false)
	private int hits;

	@Column(nullable=false)
	private int status;

	@Column(nullable=false, length=45)
	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_time", nullable=false)
	
	private Date updatedTime;
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.REFRESH,CascadeType.REMOVE, CascadeType.MERGE},fetch = FetchType.LAZY,mappedBy="entry")
	private List<Comment> comments=new ArrayList<Comment>();
	public Entry() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAllowComment() {
		return this.allowComment;
	}

	public void setAllowComment(int allowComment) {
		this.allowComment = allowComment;
	}
	public int getCommentHit() {
		return this.commentHit;
	}

	public void setCommentHit(int commentHit) {
		this.commentHit = commentHit;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public int getHits() {
		return this.hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getUpdatedTime() {
		return this.updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

}