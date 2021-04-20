<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章类型</title>
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
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">文章类型管理</a> <span class="divider">/</span></li>
		<li class="active">修改文章类型</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong>${msg}</strong>
	</div>
	<!-- 主窗口（表单）-->
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/admin/arttype?cmd=edit"
				method="post">
				<div class="control-group">
					<label class="control-label" for="gtname">类型名称</label>
					<div class="controls">
						<input id="typename" type="text" name="typename"
							value="${type.typename}" /> 
						<input type="hidden" name="typeid"
							value="${type.typeid}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtname">类型说明</label>
					<div class="controls">
						<input id="typedesc" type="text" name="typedesc"
							value="${type.typedesc}" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="typesort">排序</label>
					<div class="controls">
						<select name="typesort">
							<c:forEach begin="1" end="10" step="1" var="index">
								<c:choose>
									<c:when test="${type.typesort==index}">
										<option value="${index}" selected="selected">${index}</option>
									</c:when>
									<c:otherwise>
										<option value="${index}">${index}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtstate">类型状态</label>
					<div class="controls">
						<select id="typestate" name="typestate">
							<c:choose>
								<c:when test="${type.typestate==1}">
									<option value="1" selected="selected">可用</option>
									<option value="0">不可用</option>
								</c:when>
								<c:otherwise>
									<option value="1">可用</option>
									<option value="0" selected="selected">不可用</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtname">类型排序</label>
					<div class="controls">
						<input name="typesort" type="text" name="typesort"
							value="${type.typesort}" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" />
						<button class="btn btn-primary" type="button" 
						onclick="window.location.href='${pageContext.request.contextPath}/admin/arttype?cmd=list';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>