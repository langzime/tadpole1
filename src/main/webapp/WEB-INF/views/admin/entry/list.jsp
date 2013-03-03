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
</head>
<body>  
    <table id="dg" class="easyui-datagrid" title="文章列表"  fit="true" style="width:700px;height:auto"  
            data-options="  
                iconCls: 'icon-edit',  
                singleSelect: true,  
                toolbar: '#tb',  
                url: '../datagrid/datagrid_data1.json',  
                onClickRow: onClickRow  
            ">  
        <thead>  
            <tr>  
                <th data-options="field:'itemid',width:80">文章编号</th>  
                <th data-options="field:'productid',width:100,  
                        formatter:function(value,row){  
                            return row.productname;  
                        },  
                        editor:{  
                            type:'combobox',  
                            options:{  
                                valueField:'productid',  
                                textField:'productname',  
                                url:'../datagrid/products.json',  
                                required:true  
                            }  
                        }">Product</th>  
                <th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">分组编号</th>  
                <th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">是否允许评论</th>  
                <th data-options="field:'attr1',width:250,editor:'text'">点击量</th>  
                <th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">内容</th>  
            </tr>  
        </thead>  
    </table>  
  
    <div id="tb" style="height:auto">  
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">增加</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="remove()">编辑</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="accept()">删除</a>  
    </div>  
      
    <script type="text/javascript">  
        var editIndex = undefined;  
        function endEditing(){  
            if (editIndex == undefined){return true}  
            if ($('#dg').datagrid('validateRow', editIndex)){  
                var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});  
                var productname = $(ed.target).combobox('getText');  
                $('#dg').datagrid('getRows')[editIndex]['productname'] = productname;  
                $('#dg').datagrid('endEdit', editIndex);  
                editIndex = undefined;  
                return true;  
            } else {  
                return false;  
            }  
        }  
        function onClickRow(index){  
            if (editIndex != index){  
                if (endEditing()){  
                    $('#dg').datagrid('selectRow', index)  
                            .datagrid('beginEdit', index);  
                    editIndex = index;  
                } else {  
                    $('#dg').datagrid('selectRow', editIndex);  
                }  
            }  
        }  
        function append(){  
            if (endEditing()){  
                $('#dg').datagrid('appendRow',{status:'P'});  
                editIndex = $('#dg').datagrid('getRows').length-1;  
                $('#dg').datagrid('selectRow', editIndex)  
                        .datagrid('beginEdit', editIndex);  
            }  
        }  
        function remove(){  
            if (editIndex == undefined){return}  
            $('#dg').datagrid('cancelEdit', editIndex)  
                    .datagrid('deleteRow', editIndex);  
            editIndex = undefined;  
        }  
        function accept(){  
            if (endEditing()){  
                $('#dg').datagrid('acceptChanges');  
            }  
        }  
        function reject(){  
            $('#dg').datagrid('rejectChanges');  
            editIndex = undefined;  
        }  
        function getChanges(){  
            var rows = $('#dg').datagrid('getChanges');  
            alert(rows.length+' rows are changed!');  
        }  
    </script>
</body>
</html>