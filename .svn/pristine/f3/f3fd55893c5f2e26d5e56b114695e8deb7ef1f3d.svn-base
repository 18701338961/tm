<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>上传下载</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyUI/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyUI/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyUI/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyUI/locale/easyui-lang-zh_CN.js"></script>
	
	<style>
		html,body{margin:0;padding:0}
		.panel{
			font-size: 14px!important;
		}
	</style>
	<script>
	
	$.ajaxSetup({
		   contentType:"application/x-www-form-urlencoded;charset=utf-8",
		   complete:function(XMLHttpRequest,textStatus){
		      //通过XMLHttpRequest取得响应结果
		      var res = XMLHttpRequest.responseText;
		      try{
		        var jsonData = JSON.parse(res);
		        if(jsonData.code == -1){
		          //如果超时就处理 ，指定要跳转的页面(比如登陆页)
		          window.location.replace("/admin/login.jsp");
		        }else{
		          //正常情况就不统一处理了
		        }
		      }catch(e){
		      }
		    },
		    statusCode: {
		        404: function() {
		            alert('数据获取/输入失败，没有此服务。404');
		        },
		        504: function() {
		            alert('数据获取/输入失败，服务器没有响应。504');
		        },
		        500: function() {
		            alert('服务器有误。500');
		        }
		      }
		 });
		
	function myformatter(date) {
		 var y = date.getFullYear();  
         var m = date.getMonth()+1;  
         var d = date.getDate();  
         var h = date.getHours();  
         var min = date.getMinutes();  
         var sec = date.getSeconds();  
         var str = y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d)+'/'+' '+(h<10?('0'+h):h)+':'+(min<10?('0'+min):min)+':'+(sec<10?('0'+sec):sec);  
         return str; 
		
	}
	function myparser(s) {
		 if (!s) return new Date();  
         var y = s.substring(0,4);  
         var m =s.substring(5,7);  
         var d = s.substring(8,10);  
         var h = s.substring(11,14);  
         var min = s.substring(15,17);  
         var sec = s.substring(18,20);  
         if (!isNaN(y) && !isNaN(m) && !isNaN(d) && !isNaN(h) && !isNaN(min) && !isNaN(sec)){  
             return new Date(y,m-1,d,h,min,sec);  
         } else {  
             return new Date();  
         }  
	}
	
	function doSearch() {
		var column = $("#column").val();
		
		var param;		
		if (param == "请输入查询值") {
			param="";
		}
		
		var fileGroup = $("#fileGroup").val();		
		var filePeople = $("#filePeople").val();
		
		  $('#dg').datagrid('load',{  
			  column: column, 
			  param: param, 
			  fileGroup : fileGroup,	
			  filePeople : filePeople,
	       });  
	}
	
/* 	function doSearchpeo() {
		var column = $("#column").val();		
		var param;		
		if (param == "请输入查询值") {
			param="";
		}				
		var filePeople = $("#filePeople").val();		
		  $('#dg').datagrid('load',{  
			  column: column, 
			  param: param, 			
			  filePeople : filePeople
	       });  
	} */
	
	
		$(function(){			
			
			$('#dg').datagrid({
				nowrap: false,
				idField:'id',
				striped: true,
				fit: false,
				singleSelect:true,
				rownumbers:true,
				url:'${pageContext.request.contextPath}/fileList',
				pageSize:20,
		        pageList:[15,20,25],
				columns : [ [{
					title : '上传者',
					field : 'managerNo',
					width : 50,
				},  {
					title : '上传时间',
					field : 'uploadTime',
					width : 50,
				},  {
					title : '内容',
					field : 'fileName',
					width : 100,
					formatter: function(value,row,index){
						var url = "${pageContext.request.contextPath}/down?name="+encodeURIComponent(encodeURIComponent(value));  
						return "<a href='"+url+"'>"+value+"</a>"
					}
				}
				,{
					title : '校对者',
					field : 'checkPeople',
					width : 50,
				}
				,{
					title : '审核者',
					field : 'reviewPeople',
					width : 50,
				},
				{
					title : '批准者',
					field : 'makeSurePeople',
					width : 50,
				} ,  {
					title : '状态',
					field : 'status',
					width : 50,
					formatter: function(value,row,index){
						if(value=="0"){
							return "已上传";
						}else if(value=="1"){
							return "已校对";
						}else if(value=="2"){
							return "已审核";
						}else if(value=="3"){
							return "已批准";
						}						
					}
				}

				]],
				fitColumns:true,
				pagination:true,
				toolbar: '#toolbar',
				onLoadSuccess:function(){  
		          $('#dg').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题  
		       } 
			});
		});
	
	function cancel() {
		$('#fm').form('clear');
		$('#dlg').dialog('close');
	}
	function saveFile() {
		
		$('#fm').form('submit',{
					url : url,
					onSubmit : function() {
						var flag = $(this).form('validate');
						return flag;
					},
					success : function(result) {
						var obj = jQuery.parseJSON(result);
						if (obj.result == "success") {
							alert("操作成功！")
							$('#dlg').dialog('close');
							$('#dg').datagrid('reload');
						} else {
							$.messager.show({
								title: 'Error',
								msg: obj.errorMsg
							});
						}
					}
				});
	}
	function submitFile(type) {
		var title ="";
		if(type=="1"){
			title = "校对文件";
		}else if(type=="2"){
			title = "审核文件";
		}else if(type=="3"){
			title = "批准文件";
		}
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', title);
			$('#fm').form('clear');
			$('#fm').form('load', row);
			url = "${pageContext.request.contextPath}/updateFileStatus"
		}
	}
	function checkFile(type){
		  var url="${pageContext.request.contextPath}/check?type="+type;
	      window.location.href=url;
	}
	$(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/getManagers',
			type : 'post',
			async : false, //默认为true 异步   
			success : function(objs) {
				objs = jQuery.parseJSON(objs)
				$("#manager").empty();
				for(var i =0;i<objs.length;i++) {
					$("#manager").append("<option value='"+objs[i].managerno+"'>"+objs[i].managerno+"</option>");
				}
			}
		});
	})
	</script>
</head>
<body>
	<table id="dg" title="文件列表">
		
	</table>
	
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="checkFile('0')">返回</a>
		<c:if test="${type=='1'}">
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="submitFile('1')">提交校对</a>
		</c:if>
		<c:if test="${type=='2'}">
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="submitFile('2')">提交审核</a>
		</c:if>
		<c:if test="${type=='3'}">
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="submitFile('3')">提交批准</a>
		</c:if>
	</div>
		<div id="dlg" class="easyui-dialog"
		style="width: 380px; height: 160px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		
		<form id="fm" method="post">
			<input id=id name=id  style="display:none">
			<table>
				<c:if test="${type==1}">
					<tr>
						<td style="height: 28px" width=120>审核者：</td>
						<td style="height: 28px" width=210>
						<select style="width:200px"  class="scinput" id="manager" name="reviewPeople">
	          				</select>
	          				</td>
					</tr>
				</c:if>
				<c:if test="${type==2}">
					<tr>
						<td style="height: 28px" width=120>批准者：</td>
						<td style="height: 28px" width=210>
						<select style="width:200px"  class="scinput" id="manager" name="makeSurePeople">
	          				</select>
	          				</td>
					</tr>
				</c:if>
				<c:if test="${type==3}">
					确定批准文件
				</c:if>
			</table>
		</form>
		
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveFile()">Save</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="cancel();">Cancel</a>
	</div>
</body>
</html>
