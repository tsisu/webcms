<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加文章类型</title>
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
		<li class="active">增加文章类型</li>
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
				action="${pageContext.request.contextPath}/admin/arttype?cmd=add"
				method="post">
				<!-- 控件样式 -->
				<div class="control-group">
					<label class="control-label" for="typename">文章类型名称</label>
					<div class="controls">
						<input id="typename" type="text" name="typename" maxlength="30" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="typedesc">文章类型说明</label>
					<div class="controls">
						<textarea style="width: 400px; height: 80px" name="typedesc"></textarea>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="typesort">排序</label>
					<div class="controls">
						<select name="typesort">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="typestate">文章类型状态</label>
					<div class="controls">
						<select name="typestate">
							<option value="1">可用</option>
							<option value="0">不可用</option>
						</select>
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
</body>
</html>