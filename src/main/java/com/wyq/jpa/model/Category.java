package com.wyq.jpa.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreType;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonRawValue;
import org.codehaus.jackson.annotate.JsonTypeName;
import org.codehaus.jackson.annotate.JsonUnwrapped;
import org.codehaus.jackson.annotate.JsonValue;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonTypeIdResolver;

import com.wyq.jpa.util.BlogJsonSerializer;


/**
 * The persistent class for the category database table.
 * 
 */
@Entity
@Table(name="category")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@JsonProperty("blog.id")
	@JsonSerialize (using = BlogJsonSerializer.class)
	@ManyToOne(cascade={},optional=false)  
    @JoinColumn(name="blog_id")//设置外键的名称
	private Blog blog;
	
	@Column(nullable=false, length=255)
	private String description;

	@Column(name="display_order", nullable=false)
	private int displayOrder;

	@Column(nullable=false, length=45)
	private String name;
	
	@JsonIgnore
	@OneToMany(cascade={},fetch = FetchType.LAZY,mappedBy="category")
	List<Entry> list=new ArrayList<Entry>();
	public List<Entry> getList() {
		return list;
	}
	public void setList(List<Entry> list) {
		this.list = list;
	}

	public Category() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
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
	
	
	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

}