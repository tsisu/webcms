<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核文章</title>
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
		<li><a href="#">文章管理</a> <span class="divider">/</span></li>
		<li class="active">审核文章</li>
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
				action="${pageContext.request.contextPath}/admin/art?cmd=audit"
				method="post">
				<!-- 控件样式 -->
				<div class="control-group">
					<label class="control-label">文章类型</label>
					<div class="controls">
						<select name="typeid" disabled="disabled">
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
						${art.arttitle}
						<input type="hidden" name="artid" value="${art.artid}">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章摘要</label>
					<div class="controls">
						${art.artsummary}
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章内容</label>
					<div class="controls">
						${art.artcontent}
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章封面图片</label>
					<div class="controls">
						<img alt="" style="width:100px;height:100px" src="${pageContext.request.contextPath}${art.artimg}">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章作者</label>
					<div class="controls">
						${art.artauthor}
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">文章来源</label>
					<div class="controls">
						${art.artsource}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">审核状态</label>
					<div class="controls">
						<select name="artauditstate">
							<c:choose>
								<c:when test="${art.artauditstate==0}">
									<option value="0" selected="selected">未审核</option>
									<option value="1">通过</option>
									<option value="2">未通过</option>
								</c:when>
								<c:when test="${art.artauditstate==1}">
									<option value="0">未审核</option>
									<option value="1" selected="selected">通过</option>
									<option value="2">未通过</option>
								</c:when>
								<c:when test="${art.artauditstate==2}">
									<option value="0">未审核</option>
									<option value="1">通过</option>
									<option value="2" selected="selected">未通过</option>
								</c:when>
							</c:choose>
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">审核意见</label>
					<div class="controls">
						<textarea style="width:400px;height:80px" name="artauditdesc">${art.artauditdesc}</textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" />
						<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/art?cmd=auditlist';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>