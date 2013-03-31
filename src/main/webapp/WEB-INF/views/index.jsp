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
			<!--/.well -->
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="#">首页</a> <span class="divider">/</span></li>
				<li><a href="#">Library</a> <span class="divider">/</span></li>
				<li class="active">Data</li>
			</ul>
			<div  class="span9 ">
			<h2>北京二手房交易新旧政策按网上签约时间为准</h2>
			<p>本市2013年的房价控制目标确定为“全市新建商品住房价格与2012年价格相比保持稳定，进一步降低自住型、改善型商品住房的价格，逐步将其纳入限价房序列管理。</p>
			<p>
				<a class="btn" href="#">详细查看 &raquo;</a>
			</p>
			</div>
		</div>
	</div>
	<hr>
	<footer>
		<p>&copy; 公司 2013</p>
	</footer>
</div>
<%@include file="./footer.jsp"%>