<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">文章管理</a> <span class="divider">/</span></li>
		<li class="active">修改文章</li>
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
		<!-- enctype="multipart/form-data;以及method=”post” -->
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/admin/art?cmd=edit"
				method="post" enctype="multipart/form-data">
				<!-- 控件样式 -->
				<div class="control-group">
					<label class="control-label">文章类型</label>
					<div class="controls">
						<select name="typeid">
							<c:forEach items="${arttypelist}" var="type">
								<c:choose>
									<c:when test="${type.typeid==art.typeid}">
										<option value="${type.typeid}" selected="selected">${type.typename}</option>
									</c:when>
									<c:otherwise>
										<option value="${type.typeid}">${type.typename}</option>
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章标题</label>
					<div class="controls">
						<input type="text" name="arttitle" value="${art.arttitle}">
						<input type="hidden" name="artid" value="${art.artid}">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章摘要</label>
					<div class="controls">
						<textarea name="artsummary" style="width:400px;height:80px">${art.artsummary}</textarea>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章内容</label>
					<div class="controls">
						<textarea name="artcontent" class="ckeditor" style="width:400px;height:120px">${art.artcontent}</textarea>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章封面图片</label>
					<div class="controls">
						<input type="file" name="img">
						<input type="hidden" name="artimg" value="${art.artimg}">
						<img alt="" style="width:100px;height:100px" src="${pageContext.request.contextPath}${art.artimg}">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章作者</label>
					<div class="controls">
						<input type="text" name="artauthor" value="${art.artauthor}">	
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章来源</label>
					<div class="controls">
						<input type="text" name="artsource" value="${art.artsource}">
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" />
						<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/art?cmd=list';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
    var editor = CKEDITOR.replace('artcontent');
</script>
</body>
</html>