package com.wyq.jpa.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the link database table.
 * 
 */
@Entity
@Table(name="link")
public class Link implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int id;
	
	@ManyToOne(cascade={CascadeType.REFRESH},optional=false)  
    @JoinColumn(name="blog_id")//设置外键的名称
	private Blog blog;

	@Column(name="display_order", nullable=false)
	private int displayOrder;

	@Column(nullable=false, length=45)
	private String name;

	@Column(nullable=false, length=45)
	private String url;

	public Link() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDisplayOrder() {
		return this.displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

}