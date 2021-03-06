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
/* 		var column = $("#column").val();
		
		var param;		
		if (param == "请输入查询值") {
			param="";
		} */
		
		var fileGroup = $("#fileGroup").val();	
		
    /*  var managerno = $("#managerno").val(); */
		
/* 		var fieldName;		
		if (fieldName == "请输入查询值") {
			fieldName=managerNo;
		} */ 
		
/* 		var filePeople = $("#filePeople").val(); */
		
		  $('#dg').datagrid('load',{  
/* 			  column: column, 
			  param: param,  */
			  fileGroup : fileGroup,
			 /*  managerno : managerno,   */
/* 			  filePeople : filePeople, */
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
			
/* 			$("#search").click(function(){
				doSearch();
	        });
			
			$("#search0").click(function(){
				doSearch();
	        });
			
			$("#search1").click(function(){
				doSearch();
	        });
			
			$("#search2").click(function(){
				doSearch();
	        });
			
			$("#search3").click(function(){
				doSearch();
	        });
			
			$("#search4").click(function(){
				doSearch();
	        });
			
			$("#search5").click(function(){
				doSearch();
	        });
			
			$("#search6").click(function(){
				doSearch();
	        });
			
			$("#search7").click(function(){
				doSearch();
	        });
			
			$("#search8").click(function(){
				doSearch();
	        });
			
			$("#search9").click(function(){
				doSearch();
	        });
			
			$("#search10").click(function(){
				doSearch();
	        });
						
			$("#searchpeo0").click(function(){
				doSearch();
	        });
			
			$("#searchpeo1").click(function(){
				doSearch();
	        });
			
			$("#searchpeo2").click(function(){
				doSearch();
	        });
			
			$("#searchpeo3").click(function(){
				doSearch();
	        });
			
			$("#searchpeo4").click(function(){
				doSearch();
	        });
			
			$("#searchpeo5").click(function(){
				doSearch();
	        });
			
			$("#searchpeo6").click(function(){
				doSearch();
	        }); */
			
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
					width : 200,
					formatter: function(value,row,index){
						var url = "${pageContext.request.contextPath}/down?name="+encodeURIComponent(encodeURIComponent(value));  
						return "<a href='"+url+"'>"+value+"</a>"
					}
				},  {
					title : '分组',
					field : 'fileGroupName',
					width : 50
				},  { 
					field:'opt',
					title:'操作',
					width:50,
					/* align:'center',   */
                    formatter:function(value,row,index){  
                        var content = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
                        return content;  
                    }  
                }
/* 				,  {
					title : '校对人',
					field : 'filePeopleName',
					width : 50,
					align:'center' 
				} */
                ,  {
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
/* 				,{
					title : '状态',
					field : 'filePeopleName',
					width : 50,
					align:'center', 
                    formatter:function(value,row,index){  
                        var content = '<select name="filePeople" id="filePeople"> <option  value="0">上传</option> <option  value="1">校对</option> <option  value="2">审核</option> <option  value="3">批准</option> </select>';  
                        return content;  
                    }
				    }  */ 
				]],
				fitColumns:true,
				pagination:true,
				toolbar: '#toolbar',
				onLoadSuccess:function(){  
		          $('#dg').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题  
		       } 
			});
		});
	
	
	function upload(){					
			$('#uploadExcel').form('submit',{
				url : '${pageContext.request.contextPath}/upload/',
				onSubmit : function() {
					var fileName = $("#uploadFile").val();
					if(fileName == ""){
						$.messager.alert('错误',"请选择上传文件！",'error');
						return false;
					}
					var fileGroup = $("#fileGroupCode").val();
					
					if(fileGroup == null || fileGroup == ""){
						$.messager.alert('错误',"请选择文件组！",'error');
						return false;
					}
					
/* 					var filePeople = $("#filePeopleCode").val();
					
					if(filePeople == null || filePeople == ""){
						$.messager.alert('错误',"请选择审核者！",'error');
						return false;
					}		 */			
				},
				success : function(result) {
					var obj = jQuery.parseJSON(result);
					if (obj.result == "success") {
						$('#dlgForUpload').dialog('close');
						$('#dg').datagrid('reload');
					} else {
						$.messager.alert('错误',obj.errorMsg,'error');
					}
				}
			});
		}
	
	function del(id){
		console.log(id)
 		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg)==true){ 
		$.ajax({
	  		  type: 'POST',
	  		  async:true,
	  		  url: '${pageContext.request.contextPath}/delFile/',
	  		  data: {'ids':id},
	  		  beforeSend:function(xhr){
	  			console.log("beforeSend")
	  		  },
	  		  error: function(XMLHttpRequest, textStatus, errorThrown) {
		  			$("#errMsg").html("请求异常！请联系管理人员");
			  	},
	  		  success: function(data){
	  			  	if(data != null && data.code == 0){
	  			  		doSearch();
	  			  		$.messager.alert('Info', data.msg, 'info');
	  			  	}else{
	  			  		$.messager.alert('错误',data.msg,'error');
	  			  	}
	  		  },
	  		  dataType: 'json',
	  		  complete:function(xhr){ 
	  			 console.log("complete")
	  		  }  
	  		});
	 	}else
	 		{
	 		return false;
	 		}		
	}
	
	function uploadFile(){
			
			$('#dlgForUpload').dialog('open').dialog('setTitle', '上传文件');
			$('#uploadExcel').form('clear');
		}
	
	function exportUser(){
			  var url="${pageContext.request.contextPath}/exportExcel";
		      window.open(url);
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

	<div>
		检索条件
		<p>
		分组：<select name="fileGroup" id="fileGroup" onchange="doSearch()"> 
			<option id="search" value="">全部</option>
          	<option id="search0" value="0">MN10-1 纳卫星</option> 
        <!--   	<option id="search1" value="1">MS-2-6U立方星</option>  -->
          	<option id="search2" value="2">HN-1微小卫星</option> 
        <!--   	<option id="search3" value="3">MS-3小卫星</option> -->
          	<option id="search4" value="4">Ka通信微小卫星</option>
          	<option id="search5" value="5">聚划算微小卫星</option>
          	<option id="search6" value="6">FN-600P-A卫通便携站</option> 
          	<option id="search7" value="7">FN-1000Z-A双频便携站</option> 
          	<option id="search8" value="8">Ku机载动中通</option>
          	<option id="search9" value="9">sPhone-F1天通卫星手机</option>
          	<option id="search10" value="10">舒拉亚数据终端</option>
          	</select>
<!--           	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       	审核者：<select name="filePeople" id="filePeople"> 
          	<option id="searchpeo0" value="0">孔令波</option> 
          	<option id="searchpeo1" value="1">郭立业</option> 
          	<option id="searchpeo2" value="2">刁占林</option> 
          	<option id="searchpeo3" value="3">林见杰</option>
          	<option id="searchpeo4" value="4">常武军</option>
          	<option id="searchpeo5" value="5">刘断尘</option>
          	<option id="searchpeo6" value="6">梁军民</option> 
          	</select>   --> 	
        <!--   	<button id="search">检索</button> -->
	</div>
	
	<table id="dg" title="文件列表">
		
	</table>
	
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="uploadFile()">上传文件</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="checkFile('1')">校对文件</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="checkFile('2')">审核文件</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="checkFile('3')">批准文件</a>
	</div>
	<div id="dlgForUpload" class="easyui-dialog"
		style="width: 410px; height: 250px; padding: 10px 20px" closed="true" buttons="#dlg-buttonsdlgForUpload">
		<form method="post" enctype="multipart/form-data" id="uploadExcel" style="margin-top:20px">
     		  <input type="file" name="fileUpload" style="width:100%" id="uploadFile"/>
     		
     		<label>选择分组列表：    </label> 
          	<select name="fileGroup" id="fileGroupCode"> 
          	<option value="0">MN10-1 纳卫星</option> 
       <!--    	<option value="1">MS-2-6U立方星</option>  -->
          	<option value="2">HN-1微小卫星</option> 
       <!--    	<option value="3">MS-3小卫星</option> -->
          	<option value="4">Ka通信微小卫星</option>
          	<option value="5">聚划算微小卫星</option>
          	<option value="6">FN-600P-A卫通便携站</option> 
          	<option value="7">FN-1000Z-A双频便携站</option> 
          	<option value="8">Ku机载动中通</option>
          	<option value="9">sPhone-F1天通卫星手机</option>
          	<option value="10">舒拉亚数据终端</option>
          	</select> 	
          	
<!--           	<br>
          	<label>选择校对人：&nbsp&nbsp &nbsp </label> 
          	<select name="filePeople" id="filePeopleCode"> 
          	<option value="0">孔令波</option> 
          	<option value="1">郭立业</option> 
          	<option value="2">刁占林</option> 
          	<option value="3">林见杰</option>
          	<option value="4">常武军</option>
          	<option value="5">刘断尘</option>
          	<option value="6">梁军民</option> 
          	</select> 	
          	<br/> -->
          	  	<br>
          	<label>校对文件者：&nbsp&nbsp &nbsp </label> 
          	<select name=checkPeople id="manager"> 
          	</select> 	
          	<br/>	  
        </form>
     
	</div>
	<div id="dlg-buttonsdlgForUpload">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="upload()">Upload</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlgForUpload').dialog('close')">Cancel</a>
	</div>
</body>
</html>
