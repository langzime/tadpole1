package com.wyq.jpa.util;

import java.util.List;

public class Pager {
	private int pageSize = 10;//每页的记录数
	private int pageNumber = 0;//第一页为0
	private int maxElements;//总条数
	private int cid;
	private List<?> list;//list

	public Pager() {

	}

	public Pager(int maxElements) {
		this.maxElements = maxElements;
	}

	public Pager(int pageSize, int pageNumber, int maxElements) {
		this.pageSize = pageSize;
		this.maxElements = maxElements;
		this.pageNumber = pageNumber;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		int total = (int) Math.ceil(maxElements / pageSize);
		if (pageNumber > total) {
			this.pageNumber = total;
		} else if (pageNumber <= 0) {
			pageNumber = 0;
		}else{
			this.pageNumber = pageNumber;
		}
	}

	public void setMaxElments(int maxElements) {
		this.maxElements = maxElements;
	}

	public int getMaxElements() {
		return maxElements;
	}


	public int getPageSize() {
		return pageSize;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public List<?> getList() {
		return list;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setMaxElements(int maxElements) {
		this.maxElements = maxElements;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
}
