<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">角色管理</a> <span class="divider">/</span></li>
		<li class="active">修改信息</li>
	</ul>
	<!-- 提示信息窗口 -->
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	<!-- 主窗口（表单） -->
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/admin/role?cmd=edit"
				method="post">
				<div class="control-group">
					<label class="control-label" for="gtname">角色姓名</label>
					<div class="controls">
						<input id="rolename" type="text" name="rolename"
							value="${role.rolename}" /> 
						<input type="hidden" name="roleid"
							value="${role.roleid}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtname">角色说明</label>
					<div class="controls">
						<input id="roledesc" type="text" name="roledesc"
							value="${role.roledesc}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtstate">角色状态</label>
					<div class="controls">
						<select id="rolestate" name="rolestate">
							<c:choose>
								<c:when test="${role.rolestate==1}">
									<option value="1" selected="selected">正常</option>
									<option value="0">不正常</option>
								</c:when>
								<c:otherwise>
									<option value="1">正常</option>
									<option value="0">不正常</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" />
						<button class="btn btn-primary" type="button" 
						onclick="window.location.href='${pageContext.request.contextPath}/admin/role?cmd=list';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>				
</body>
</html>