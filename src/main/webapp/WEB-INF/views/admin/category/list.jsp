<%@ page language="java" import="com.wyq.jpa.model.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
<style type="text/css">
.ftitle{  
            font-size:14px;  
            font-weight:bold;  
            color:#666;  
            padding:5px 0;  
            margin-bottom:10px;  
            border-bottom:1px solid #ccc;  
}  
</style>
<body>
	<table id="dg" class="easyui-datagrid" fit="true" title="类别列表"
		data-options="
				rownumbers:true,  
                iconCls: 'icon-edit',  
                singleSelect: true,  
                toolbar: '#tb',
                pagination:true,  
                url: '<%=base%>/category/getAjaxList'
            ">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,editor:'numberbox'">编号</th>
				<th data-options="field:'name',width:100,editor:'text'">类别名称</th>
				<th data-options="field:'displayOrder',width:80,editor:'numberbox'">显示顺序</th>
				<th data-options="field:'description',width:80,editor:'text'">描述</th>
				<th data-options="field:'blog.id',width:250,editor:'numberbox'">博客编号</th>
			</tr>
		</thead>
	</table>
	<div id="tb">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCategory()">添加</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCategory()">编辑</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyCategory()">删除</a>  
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
        <div class="ftitle">分类信息</div>  
        <form id="fm" method="post" novalidate>
            <input id="categoryid" name="id" type="hidden">    
            <div class="fitem">  
                <label>类别名称</label>  
                <input name="name" class="easyui-validatebox" required="true">  
            </div>  
            <div class="fitem">  
                <label>分类描述</label>  
                <input name="description" class="easyui-validatebox" required="true">  
            </div>  
            <div class="fitem">  
                <label>分类顺序</label>  
                <input name="displayOrder">  
            </div>  
            <div class="fitem">  
                <label>博客编号</label>  
                <input name="blog.id" class="easyui-validatebox">  
            </div>  
        </form>  
    </div>  
    <div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveCategory()">保存</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
    </div>   
	<script type="text/javascript"> 
		var pager = $('#dg').datagrid().datagrid('getPager');
		var url;  
        function newCategory(){
            $('#dlg').dialog('open').dialog('setTitle','添加分类信息');  
            $('#fm').form('clear');  
            url = '<%=base%>/category/ajaxUpdateOne';
            $('#categoryid').val(0);
        }  
        function editCategory(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $('#dlg').dialog('open').dialog('setTitle','编辑分类信息');  
                $('#fm').form('load',row);  
                url = '<%=base%>/category/ajaxUpdateOne?id='+row.id;
            }  
        }  
        function saveCategory(){  
            $('#fm').form('submit',{  
                url: url,  
                onSubmit: function(){  
                    return $(this).form('validate');  
                },  
                success: function(result){  
                    var result = eval('('+result+')');  
                    if (result.errorMsg=='true'){  
                        $.messager.show({  
                            title: result.title,  
                            msg: result.errorMsg  
                        });  
                    } else {
                    	$.messager.show({  
                            title: result.title, 
                            msg: result.errorMsg  
                        });
                        $('#dlg').dialog('close');      // close the dialog  
                        $('#dg').datagrid('reload');    // reload the user data  
                    }  
                }  
            });  
        }  
        function destroyCategory(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $.messager.confirm('确认','你确认要删除此类别吗?',function(r){  
                    if (r){  
                        $.post('<%=base%>/category/ajaxDelOne',{id:row.id},function(result){  
                            if (result.success){
                            	$.messager.show({  
                                    title: result.title,  
                                    msg: result.errorMsg  
                                });
                                $('#dg').datagrid('reload');    // reload the user data  
                            } else {  
                                $.messager.show({   // show error message  
                                    title: 'Error',  
                                    msg: result.errorMsg  
                                });  
                            }  
                        },'json');  
                    }  
                });  
            }  
        } 
	</script>
</body>
</html>