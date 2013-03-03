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
<script type="text/javascript" src="<%=base%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=base%>/jqueryUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=base%>/jqueryUI/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=base%>/jqueryUI/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=base%>/jqueryUI/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=base%>/css/main.css">
<style type="text/css">
a{ color:Black; text-decoration:none;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	InitLeftMenu();
});
var _menus = {
		"menus": [{
			"menuid": "1",
			"icon": "icon-sys",
			"menuname": "类别管理",
			"menus": [{
				"menuid": "12",
				"menuname": "增加类别",
				"icon": "icon-add",
				"url": "http://www.baidu.com"
			},
			{
				"menuid": "13",
				"menuname": "编辑类别",
				"icon": "icon-edit",
				"url": "demo2.html"
			},
			{
				"menuid": "14",
				"menuname": "删除类别",
				"icon": "icon-delete",
				"url": "demo2.html"
			},
			{
				"menuid": "15",
				"menuname": "查询类别",
				"icon": "icon-select",
				"url": "<%=base%>/category/"
			}]
		},
		{
			"menuid": "8",
			"icon": "icon-sys",
			"menuname": "文章管理",
			"menus": [{
				"menuid": "21",
				"menuname": "员工列表",
				"icon": "icon-nav",
				"url": "demo.html"
			},
			{
				"menuid": "22",
				"menuname": "文章管理",
				"icon": "icon-select",
				"url": "<%=base%>/entry/"
			}]
		},
		{
			"menuid": "56",
			"icon": "icon-sys",
			"menuname": "评论管理",
			"menus": [{
				"menuid": "31",
				"menuname": "添加部门",
				"icon": "icon-nav",
				"url": "demo1.html"
			},
			{
				"menuid": "321",
				"menuname": "部门列表",
				"icon": "icon-nav",
				"url": "demo2.html"
			}]
		}]
	};
//初始化左侧
function InitLeftMenu() {
	$("#nav").accordion({animate:false,fit:true,border:false});
	var selectedPanelname = '';
    $.each(_menus.menus, function(i, n) {
		var menulist ='';
		menulist +='<ul class="navlist">';
        $.each(n.menus, function(j, o) {
			menulist += '<li><div ><a ref="'+o.menuid+'" href="#" rel="' + o.url + '" ><span class="icon '+o.icon+'" >&nbsp;</span><span class="nav">' + o.menuname + '</span></a></div> ';

			if(o.child && o.child.length>0)
			{
				//li.find('div').addClass('icon-arrow');

				menulist += '<ul class="third_ul">';
				$.each(o.child,function(k,p){
					menulist += '<li><div><a ref="'+p.menuid+'" href="#" rel="' + p.url + '" ><span class="icon '+p.icon+'" >&nbsp;</span><span class="nav">' + p.menuname + '</span></a></div> </li>'
				});
				menulist += '</ul>';
			}

			menulist+='</li>';
        })
		menulist += '</ul>';

		$('#nav').accordion('add', {
            title: n.menuname,
            content: menulist,
				border:false,
            iconCls: 'icon ' + n.icon
        });

		if(i==0)
			selectedPanelname =n.menuname;

    });
	$('#nav').accordion('select',selectedPanelname);



	$('.navlist li a').click(function(){
		var tabTitle = $(this).children('.nav').text();
		var url = $(this).attr("rel");
		var icon = $(this).find('.icon').attr('class');
		addTab(tabTitle,url,icon);
		$('.navlist li div').removeClass("selected");
		$(this).parent().addClass("selected");
		
	}).hover(function(){
		$(this).parent().addClass("hover");
	},function(){
		$(this).parent().removeClass("hover");
	});
}
function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			icon:icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
		$('#mm-tabupdate').click();
	}
	tabClose();
}
function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}
function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}
</script>
<title>后台管理</title>
</head>
<body class="easyui-layout" >
	<div region="north"  border="false"
		style=" height: 30px; background: <%--url(images/layout-browser-hd-bg.gif)--%> #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;" class="head">欢迎
			独家记忆 <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a>
		</span> 
		<span style="padding-left: 10px; font-size: 16px;"><%--<img src="images/blocks.gif" width="20" height="20" align="absmiddle" />--%>
			后台管理
		</span>
	</div>
	<div region="south" 
		style="height: 30px; background: #D2E0F2;">
		<div class="footer">By 独家记忆 Email:dujiajiyi@gmail.com</div>
	</div>
	<div region="west"  title="导航菜单" style="width:178px;"
		id="west">
		<div id="nav" fit="true" border="false">
			<!--  导航内容 -->
		</div>

	</div>
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y: hidden">
		  <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
				欢迎光临我的博客
			</div>
		</div>
	</div>
</body>
</html>