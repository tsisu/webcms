<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章类型列表</title>
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
		<li><a href="#">文章类型管理</a> <span class="divider">/</span></li>
		<li class="active">文章类型列表</li>
	</ul>
	<div class="row-fluid">
		<form class="form-search" style="padding:5px"
			action="${pageContext.request.contextPath}/admin/arttype?cmd=list" method="post">
			<label>文章类型名称：</label><input class="input-medium search-query"
				type="text" name="typename" value="${param.typename}" />
				状态：
				<select name="typestate">
				<c:choose>
				<c:when test="${param.typestate==1}">
				<option value="-1">全部</option>
				<option value="1" selected="selected">可用</option>
				<option value="0">不可用</option>
				</c:when>
				<c:when test="${param.typestate==0}">
				<option value="-1">全部</option>
				<option value="1">可用</option>
				<option value="0" selected="selected">不可用</option>
				</c:when>
				<c:otherwise>
				<option value="-1">全部</option>
				<option value="1">可用</option>
				<option value="0">不可用</option>
				</c:otherwise>
				</c:choose>
				</select>
			<button type="submit" class="btn">查找</button>
			<button class="btn btn-success" type="button"
				onclick="window.location.href='${pageContext.request.contextPath}/admin/arttype/add.jsp';">增加</button>
		</form>
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>文章类型名称</th>
				<th>文章类型说明</th>
				<th>文章类型状态</th>
				<th>文章类型排序</th>
				<th>编辑</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr class="info">
					<td>${item.typename}</td>
					<td>${item.typedesc}</td>
					<td><c:choose>
							<c:when test="${item.typestate==1}">可用</c:when>
							<c:otherwise>不可用</c:otherwise>
						</c:choose></td>
					<td>${item.typesort}</td>
					<td><a href="${pageContext.request.contextPath}/admin/arttype?cmd=init&id=${item.typeid}">编辑</a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
</body>
</html>