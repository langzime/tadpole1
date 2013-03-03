<%@ page language="java" import="com.wyq.jpa.model.*" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String base=request.getContextPath();
request.getSession().setAttribute("base", base);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=base%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=base%>/jqueryUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=base%>/jqueryUI/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=base%>/jqueryUI/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=base%>/jqueryUI/themes/icon.css">
<script type="text/javascript">
	$(document).ready(function(){
		init();
	});
	function init(){
		$("#login").parent().css({
			  position:'absolute',
			  left: ($(window).width() - $("#login").outerWidth())/2,
			   top: ($(window).height() - $("#login").outerHeight())/2-100
		});
	}
	function submitForm(){
		if(validate()){
			$('#ff').submit(); 
		};
	}
	function clearForm(){
		$("#username").val("");
		$("#password").val("");
	}
	function msgShow(title, msgString, msgType) {
		$.messager.alert(title, msgString, msgType);
	}
	function validate(){
		if($("#username").val()==""){
			msgShow('系统提示', '请输入用户名！', 'warning');
			return false;
		}
		if($("#password").val()==""){
			msgShow('系统提示', '请输入密码！', 'warning');
			return false; 
		}
		return true;
	}
</script>
</head>
<body>  
    <div id="login" class="easyui-panel" title="用户登录" style="width:400px">  
        <div style="padding:10px 0 10px 60px">  
        <form id="ff" action="<c:url value="/admin/login"/>" method="post">  
            <table>  
                <tr>  
                    <td>用户名:</td>  
                    <td><input class="easyui-validatebox" id="username" type="text" name="username" data-options="required:true"></input></td>  
                </tr>  
                <tr>  
                    <td>密码:</td>  
                    <td><input class="easyui-validatebox" id="password" type="password" name="password" data-options="required:true"></input></td>  
                </tr>
            </table>  
        </form>  
        </div>  
        <div style="background:#fafafa;text-align:center;padding:5px">  
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>  
        </div>   
</body>
</html>