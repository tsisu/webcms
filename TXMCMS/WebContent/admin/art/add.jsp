<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加文章</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">文章管理</a> <span class="divider">/</span></li>
		<li class="active">增加文章</li>
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
				action="${pageContext.request.contextPath}/admin/art?cmd=add"
				method="post" enctype="multipart/form-data">
				<!-- 控件样式 -->
				<div class="control-group">
					<label class="control-label">文章类型</label>
					<div class="controls">
						<select name="typeid">
						<c:forEach items="${arttypelist}" var="type">
						<option value="${type.typeid}">${type.typename}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="typedesc">文章标题</label>
					<div class="controls">
						<input type="text" name="arttitle">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">文章摘要</label>
					<div class="controls">
						<textarea name="artsummary" style="width: 400px; height: 80px"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">文章内容</label>
					<div class="controls">
						<textarea name="artcontent" class="ckeditor" style="width: 400px; height: 120px"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">文章封面图片</label>
					<div class="controls">
					<input type="file" name="img">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">文章作者</label>
					<div class="controls">
						<input type="text" name="artauthor">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">文章来源</label>
					<div class="controls">
						<input type="text" name="artsorce">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" />
						<button class="btn btn-primary" type="button" 
						onclick="window.location.href='${pageContext.request.contextPath}/admin/arttype/list.jsp';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var editor=CKEDITOR.replace("artcontent");
	</script>
</body>
</html>