<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<li><a href="#">文章管理</a> <span class="divider">/</span></li>
		<li class="active">文章列表</li>
	</ul>

	<div class="row-fluid">
		<form class="form-search" style="padding: 5px"
			action="${pageContext.request.contextPath}/admin/art?cmd=list"
			method="post">
		标题：<input type="text" name="arttitle" value="${param.arttitle}">
		类型：
			<select name="typeid">
				<option value="-1">全部</option>
				<c:forEach items="${arttypelist}" var="type">
					<c:choose>
						<c:when test="${param.typeid==type.typeid}">
							<option value="${type.typeid}" selected="selected">${type.typename}</option>
						</c:when>
						<c:otherwise>
							<option value="${type.typeid}">${type.typename}</option>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</select>
		审核状态：
			<select name="artauditstate">
				<c:choose>
					<c:when test="${param.artauditstate==0}">
						<option value="-1">全部</option>
						<option value="0" selected="selected">未审核</option>
						<option value="1">通过</option>
						<option value="2">不通过</option>
					</c:when>
					<c:when test="${param.artauditstate==1}">
						<option value="-1">全部</option>
						<option value="0">未审核</option>
						<option value="1" selected="selected">通过</option>
						<option value="2">不通过</option>
					</c:when>
					<c:when test="${param.artauditstate==2}">
						<option value="-1">全部</option>
						<option value="0">未审核</option>
						<option value="1">通过</option>
						<option value="2" selected="selected">不通过</option>
					</c:when>
					<c:otherwise>
						<option value="-1">全部</option>
						<option value="0">未审核</option>
						<option value="1">通过</option>
						<option value="2">不通过</option>
					</c:otherwise>
				</c:choose>
			</select>	
		发布状态：
			<select name="artpublishstate">
				<c:choose>
					<c:when test="${param.artpublishstate==0}">
						<option value="-1">全部</option>
						<option value="0" selected="selected">不发布</option>
						<option value="1">发布</option>
					</c:when>
					<c:when test="${param.artpublishstate==1}">
						<option value="-1">全部</option>
						<option value="0">不发布</option>
						<option value="1" selected="selected">发布</option>
					</c:when>
					<c:otherwise>
						<option value="-1">全部</option>
						<option value="0">不发布</option>
						<option value="1">发布</option>
					</c:otherwise>
				</c:choose>
			</select>
			<input type="submit" value="查询">
		</form>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>标题</th>
				<th>分类</th>
				<th>图片</th>
				<th>审核状态</th>
				<th>发布状态</th>
				<th>审核</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="art">
				<tr>
					<td>${art.arttitle}</td>
					<td>${art.typename}</td>
					<td>
						<img alt="" style="width:100px;height: 100px" src="${pageContext.request.contextPath}${art.artimg}">
					</td>
					<td>
						<c:choose>
							<c:when test="${art.artauditstate==0}">未审核</c:when>
							<c:when test="${art.artauditstate==1}">审核通过</c:when>
							<c:otherwise>未通过</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${art.artpublishstate==0}">不发布</c:when>
							<c:otherwise>发布</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/admin/art?cmd=initaudit&id=${art.artid}">审核</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>