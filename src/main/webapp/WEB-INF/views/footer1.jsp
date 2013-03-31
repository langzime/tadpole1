<%@ page language="java" contentType="text/html; charset=UTF-8"%>
			<div id="right">
				<div class="sidebar">
					<h2>博客简介</h2>
					<ul>
						<li>${blog.description}</li>
					</ul>
					<h2>订阅博客</h2>
					<ul>	
						<li>订阅我的博客：</li>
						<a href="${ctx}/subscribe" target="_blank">
							<img align="absmiddle" src="${ctx}/images/sub_rss.gif" border="0" alt="订阅我的博客" /></a>
					</ul>
					<h2>分类</h2>
					<ul>
						<li><a href="${ctx}">全部</a></li>
						<c:forEach items="${categorys}" var="c">
							<li><a href="${ctx}/?cid=${c.id}">${c.name}</a></li>
						</c:forEach>
					</ul>
					<h2>最近发表</h2>
					<ul>
						<c:forEach items="${recentEntrys}" var="e">
							<li><a href="${ctx}/toEntry/${e.category.id}/${e.id}">${e.title}</a></li>
						</c:forEach>
					</ul>
					<h2>最新评论</h2>
					<ul>
						<c:forEach items="${recentComments}" var="c">
							<li><a href="${ctx}/toEntry/${c.entry.category.id}/${c.entry.id}">${c.content}</a></li>
						</c:forEach>
					</ul>
					<h2>链接</h2>
					<ul>
						<c:forEach items="${links}" var="link">
							<li><a href="${link.url}" target="_blank">${link.name}</a></li>
						</c:forEach>
					</ul>
					<div id="powered">		
					<h2>联系我们</h2>			 					        
						<ul>
							<li><a href="http://www.baidu.com" target="_blank">ssh2学习</a></li>
						</ul>
					</div>
				</div>				
			</div>
		</div>
	</body>
</html>