<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<% pageContext.setAttribute("ctx",request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>${blog.name}</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="xxx" />
	</head>
	<body>
		<div id="container">
			<div id="banner">
				<h1><a href="${ctx}">${blog.name}</a></h1>
			</div>