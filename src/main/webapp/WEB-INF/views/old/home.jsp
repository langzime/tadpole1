<%@ page language="java" contentType="text/html; charset=UTF-8"%>
			<div id="center">
				<div class="content">
					<c:forEach items="${page.list}" var="e">				
						<h2><fmt:formatDate value="${e.createdTime}" pattern="yyyy年MM月dd日 "/></h2>
						<div class="entry">
							<a id="6"></a>
							<h3><a href="${ctx}/toEntry/${e.category.id}/${e.id}">${e.title}</a></h3>
								 <!-- ${fn:substring(e.content,0,200)}...... -->
								 ${e.content}
							<p>
							<h3><a href="${ctx}/toEntry/${e.category.id}/${e.id}">点击查看原文</a></h3>
							<p class="posted">
							    |<a href="${ctx}/toEntry/${e.category.id}/${e.id}">阅读(${e.hits})</a>
								|<a href="${ctx}/toEntry/${e.category.id}/${e.id}">评论(${e.commentHit})</a>
								|<a href="${ctx}/?cid=${e.category.id}">${e.category.name}</a>
								|<fmt:formatDate value="${e.createdTime}" pattern="HH:mm:ss"/>
							</p>
						</div>
					</c:forEach>
					<!--分页的链接,开始-->
					<!--分页的链接,开始-->
   				<pg:pager url="${ctx}/" id="pagination" items="${page.maxElements}" maxPageItems="${page.pageSize}"  maxIndexPages="3">
						<pg:index>
							<pg:prev>
								<a href="${pageUrl}&page=${pageNumber-1}&cid=${page.cid}">&lt;上一页</a>
							</pg:prev>
							<pg:pages>
								<a href="${pageUrl}&page=${pageNumber-1}&cid=${page.cid}">${pageNumber}</a>				
							</pg:pages>
							<pg:next>
								<a href="${pageUrl}&page=${pageNumber-1}&cid=${page.cid}">下一页&gt;</a>
							</pg:next>
						</pg:index>
					</pg:pager>		
					<!--分页的链接,结束-->					
					<br clear="all" />
				</div>
			</div>