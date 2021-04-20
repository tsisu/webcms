<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="#">角色管理</a> <span class="divider">/</span></li>
		<li class="active">角色列表</li>
	</ul>
	
	<div class="row-fluid">
		<input type="button" value="增加">
	</div>
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>角色名称</th>
				<th>角色说明</th>	
				<th>角色状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="role">
				<tr>
					<td>${role.rolename}</td>
					<td>${role.roledesc}</td>
					<td>
						<c:choose>
							<c:when test="${role.rolestate==1}">正常</c:when>
							<c:otherwise>不可用</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/admin/role?cmd=init&id=${role.roleid}">编辑</a>
						<a href="${pageContext.request.contextPath}/admin/role?cmd=initright&roleid=${role.roleid}&rolename=${role.rolename}">权限</a>
					</td>					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>