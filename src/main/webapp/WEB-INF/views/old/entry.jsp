<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%String base=request.getContextPath();
request.getSession().setAttribute("base", base); %>
			<div id="center">
				<div class="content">					
					<h2><fmt:formatDate value="${entry.createdTime}" pattern="yyyy年MM月dd日 "/></h2>
					<div class="entry">
						<h3>${entry.title}</h3>
							${entry.content}
							<p class="posted">
							    <a href="#">阅读(${entry.hits})</a>
								|<a href="#">评论(${entry.commentHit})</a>
								|<a href="${ctx}/?cid=${entry.category.id}">${entry.category.name}</a>
								|<fmt:formatDate value="${entry.createdTime}" pattern="HH:mm:ss"/>
						</p>
					</div>
					<h2><a id="comments"></a>评论</h2>
					<c:forEach items="${page.list}" var="c">										
						<p class=posted>
							<a href="mailto:${c.email}" target="_blank">${c.author}</a>
							|<fmt:formatDate value="${c.createdTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>						
						</p>
						<p>${c.content}</p>
					</c:forEach>
					<pg:pager url="${ctx}/toEntry/${entry.category.id}/${entry.id}" id="pagination" items="${page.maxElements}" maxPageItems="${page.pageSize}"  maxIndexPages="3">
						<pg:index>
							<pg:prev>
								<a href="${pageUrl}&p=${pageNumber-1}">&lt;上一页</a>
							</pg:prev>
							<pg:pages>
								<a href="${pageUrl}&p=${pageNumber-1}">${pageNumber}</a>				
							</pg:pages>
							<pg:next>
								<a href="${pageUrl}&p=${pageNumber-1}">下一页&gt;</a>
							</pg:next>
						</pg:index>
					</pg:pager>	
      				<!--判断博文是否允许评论  -->			
					<c:if test="${entry.allowComment==1}">
						<!--判断评论是否需要审核  -->
						<c:if test="${blog.commentAudit==1}">
	       				  	 （评论需要审核）
       					</c:if> 
						<form action="${ctx}/saveComment" method="post">
							<input type="hidden" name="entry.category.id" value="${entry.category.id}"/>
							<input type="hidden" name="entry.id" value="${entry.id}" /><br/>
							作者<input type="text" name="author"/><br/>
							邮件<input type="text" name="email"/><br/>
							内容<input type="text" name="content"/><br/>
							<input type="submit" value="提交"/>
						</form>
					</c:if>
				</div>				
			</div>
