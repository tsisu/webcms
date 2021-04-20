<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统功能管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>

<style type="text/css">
dl{
	margin-left: 30px;
}
dd,dt{
	line-height: 30px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
/* $(function(){
	$("dt").click(function(e){
		var id = $(e.currentTarget).attr("data");
		//操作id对应的div进行收缩
		$("#"+id).slideToggle("fast");
	});
}) */
//点击增加根节点按钮事件
function addparent(){
	$("#funpid").val("-1");
	$("#funpname").val("无");
	$("#funid").val("");
	$("#funname").val("");
	$("#funurl").val("");
	$("#save").removeAttr("disabled");
	$("#addchild").attr("disabled","disabled");
}
//点击树节点事件
function nodeclick(funpid,funpname,funid,funname,funurl,funstate){
	$("#funpid").val(funpid);
	$("#funpname").val(funpname);
	$("#funid").val(funid);
	$("#funname").val(funname);
	$("#funurl").val(funurl);
	$("#funstate").val(funstate);
	//保存按钮可用
	$("#save").removeAttr("disabled");
	//如果是根节点，那么增加子节点按钮可用
	if(funpid=="-1"){
		$("#addchild").removeAttr("disabled");
	}else{
		$("#addchild").attr("disabled","disabled");
	}
}
//添加子节点按钮事件
function addchild(){
	$("#funpid").val($("#funid").val());
	$("#funpname").val($("#funname").val());
	$("#funid").val("");
	$("#funname").val("");
	$("#funurl").val("");
	$("#save").removeAttr("disabled");
	$("#addchild").attr("disabled","disabled");
}
//保存按钮事件
function save(){
	//从表单获取数据
	var funid = $("#funid").val();
	var funname = $("#funname").val();
	var funurl = $("#funurl").val();
	var funpid=$("#funpid").val();
	var funstate = $("#funstate").val();
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/admin/fun?cmd=save",
		   data: "funid="+funid+"&funname="+funname+"&funurl="+funurl+"&funpid="+funpid+"&funstate="+funstate,
		   dataType:"json",
		   success: function(msg){
		     var code = msg.code;
		     if(code==0){
		    	 alert(msg.msg+"失败");
		     }else{
		    	 alert(msg.msg+"成功");
		    	 $("body").load("${pageContext.request.contextPath}/admin/fun?cmd=init");
		     }
		   }
		});
}
</script>
</head>
<body>
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">文章类型管理</a> <span class="divider">/</span></li>
		<li class="active">增加文章类型</li>
	</ul>
	<!-- 提示信息窗口 -->
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	
	<div class="row-fluid">
		<div class="span4">
			<dl>
				<c:forEach items="${list}" var="p">
					<c:if test="${p.funpid==\"-1\"}">
						<dt onclick="nodeclick('-1','无','${p.funid}','${p.funname}','${p.funurl}','${p.funstate}');">${p.funname}</dt>
							<c:forEach items="${list}" var="c">
								<c:if test="${c.funpid==p.funid}">
									<dd onclick="nodeclick('${c.funpid}','${p.funname}','${c.funid}','${c.funname}','${c.funurl}','${c.funstate}');">${c.funname}</dd>
								</c:if>
							</c:forEach>
					</c:if>
				</c:forEach>
			</dl>	
		</div>
		<div class="span8">
			<div class="control-group">
				<label class="control-label" for="funpname">父功能</label>
				<div class="controls">
					<input type="text" id="funpname" readonly="readonly">
					<input type="hidden" id="funpid">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funname">功能名称</label>
				<div class="controls">
					<input type="text" id="funname">
					<input type="hidden" id="funid">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funurl">功能地址</label>
				<div class="controls">
					<input type="text" id="funurl">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funstate">功能状态</label>
				<div class="controls">
					<select id="funstate">
						<option value="1">正常</option>
						<option value="0">不可用</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="button" id="addparent" onclick="addparent();" value="增加根节点"  class="btn btn-large btn-primary">
					<input type="button" id="addchild" onclick="addchild();" value="增加子节点" disabled="disabled" class="btn btn-large btn-info">
					<input type="button" id="save" value="保存" disabled="disabled" class="btn btn-large btn-success" onclick="save();">					
				</div>
			</div>
		</div>
	</div>
</body>
</html>