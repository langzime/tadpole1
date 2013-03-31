<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<% pageContext.setAttribute("ctx",request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>${blog.name}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link href="${ctx}/css/bootstrap.css" rel="stylesheet">
<link href="${ctx}/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">${blog.name}</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">主页</a></li>
              <li><a href="#about">博客</a></li>
              <li><a href="#about">相册</a></li>
              <li><a href="#contact">管理</a></li>
              <li><a href="#"">关于</a></li>
            </ul>
            <form class="navbar-search pull-right">
              <input class="text" type="search-query" placeholder="搜索">
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>