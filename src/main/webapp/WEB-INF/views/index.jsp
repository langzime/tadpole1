<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="./header.jsp"%>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">分类</li>
					<c:forEach items="${categorys}" var="c">
						<li><a href="#">${c.name}</a></li>
						<!-- <li class="active"><a href="#">Link</a></li> -->
					</c:forEach>
				</ul>
			</div>
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">最近发表</li>
					<c:forEach items="${recentEntrys}" var="c">
						<li><a href="#">${c.title}</a></li>
						<!-- <li class="active"><a href="#">Link</a></li> -->
					</c:forEach>
				</ul>
			</div>
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">最新评论</li>
					<c:forEach items="${recentComments}" var="c">
						<li><a href="#">${c.content}</a></li>
						<!-- <li class="active"><a href="#">Link</a></li> -->
					</c:forEach>
				</ul>
			</div>
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">链接</li>
					<c:forEach items="${links}" var="c">
						<li><a href="#">${c.name}</a></li>
						<!-- <li class="active"><a href="#">Link</a></li> -->
					</c:forEach>
				</ul>
			</div>

		</div>
		<div class="span9">
			<!-- <ul class="breadcrumb">
				<li><a href="#">首页</a> <span class="divider">/</span></li>
				<li><a href="#">Library</a> <span class="divider">/</span></li>
				<li class="active">Data</li>
			</ul> -->
			<c:forEach items="${page.list}" var="e">
				<div>
					<h2>${e.title}</h2>
					<div>
						作者：雾非雾的情思 分类：<a href="/catalog/catalog-28.html" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
						标签：<a href="/tag/tag-37.html" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
						时间：
						<fmt:formatDate value="${e.createdTime}"
							pattern="yyyy:MM:dd HH:mm:ss " />
						点击量：${e.hits} 转载自：道哥的黑板报
					</div>
					<br>
					<p>${fn:substring(e.content, 0, 200)}...</p>
					<p>
						<a class="btn btn-primary" href="#">详细查看 &raquo;</a>
					</p>
					<hr>
				</div>
			</c:forEach>
			<c:if test="${page.pageSize<page.maxElements}">
			<div class="pagination pull-right">
				<ul>
					<li><a href="${ctx}/?page=${page.pageNumber-1}">上一页</a></li>
					<li><a class="active" href="${ctx}/?page=${page.pageNumber}">${page.pageNumber}</a></li>
					<li><a href="${ctx}/?page=${page.pageNumber+1}">${page.pageNumber+1}</a></li>
					<li><a href="${ctx}/?page=${page.pageNumber+2}">${page.pageNumber+2}</a></li>
					<li><a href="${ctx}/?page=${page.pageNumber+3}">${page.pageNumber+3}</a></li>
					<li><a href="${ctx}/?page=${page.pageNumber+4}">${page.pageNumber+4}</a></li>
					<li><a href="${ctx}/?page=${page.pageNumber+1}">下一页</a></li>
				</ul>
			</div>
			</c:if>
		</div>
	</div>
	<hr>
	<footer>
		<p>&copy; 公司 2013</p>
	</footer>
</div>
<%@include file="./footer.jsp"%>