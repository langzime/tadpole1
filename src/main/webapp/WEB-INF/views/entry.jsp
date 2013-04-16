<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="./header.jsp"%>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="${ctx}/">首页</a> <span class="divider">/</span></li>
				<li><a href="${ctx}/?cid=${e.category.id}">${e.category.name}</a> <span class="divider">/</span></li>
				<li class="active">${e.title}</li>
			</ul>
			<div>
				<h2>${e.title}</h2>
				<div>
					作者：雾非雾的情思 分类：<a href="${ctx}/?cid=${e.category.id}" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
					标签：<a href="${ctx}/?cid=${e.category.id}" rel="tag">${e.category.name}</a>&nbsp;&nbsp;
					时间：
					<fmt:formatDate value="${e.createdTime}" pattern="yyyy:MM:dd HH:mm:ss " />
					点击量：${e.hits} 转载自：道哥的黑板报
					</div>
					<br>
					<p>${e.content}</p>
				<!-- <hr> -->
			</div>
			<div class="row-fluid">
					<div class="well span4">
					欢迎大家的光临！！！！！！！！！！！！！！！
					</div>
					<div class="well span5">
					欢迎大家的光临！！！！！！！！！！！！！！！
					</div>
			</div>
			<div class="row-fluid">
				<div class="span9 alert alert-info">
  					欢迎大家的光临！！！！！！！！！！！！！！！
				</div>
			</div>
		</div>
<%@include file="./footer.jsp"%>