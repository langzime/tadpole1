<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="./header.jsp"%>
		<div class="span9">
			<c:if test="${page.cid!=-1}">
			<ul class="breadcrumb">
				<li><a href="${ctx}/">首页</a> <span class="divider">/</span></li>
				<li class="active">${cname}<span class="divider">/</span></li>
			</ul>
			</c:if>
			<c:forEach items="${page.list}" var="e">
				<div>
					<h2>${e.title}</h2>
					<div>
						作者：雾非雾的情思 分类：<a href="${ctx}/?cid=${e.category.id}" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
						标签：<a href="${ctx}/?cid=${e.category.id}" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
						时间：
						<fmt:formatDate value="${e.createdTime}"
							pattern="yyyy:MM:dd HH:mm:ss " />
						点击量：${e.hits} 转载自：道哥的黑板报
					</div>
					<br>
					<p>${fn:substring(e.content, 0, 200)}...</p>
					<p>
						<a class="btn btn-primary" href="${ctx}/toEntry/${e.category.id}/${e.id}">详细查看 &raquo;</a>
					</p>
					<hr>
				</div>
			</c:forEach>
			<c:if test="${page.pageSize<page.maxElements}">
			<div class="pagination pull-right">
				<ul>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber-1}">Prev</a></li>
					<li class="active"><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber}">${page.pageNumber+1}</a></li>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber+1}">${page.pageNumber+1+1}</a></li>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber+2}">${page.pageNumber+2+1}</a></li>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber+3}">${page.pageNumber+3+1}</a></li>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber+4}">${page.pageNumber+4+1}</a></li>
					<li><a href="${ctx}/?cid=${page.cid}&page=${page.pageNumber+1}">Next</a></li>
				</ul>
			</div>
			</c:if>
		</div>
<%@include file="./footer.jsp"%>