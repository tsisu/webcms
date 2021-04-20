<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用TXMCMS系统</title>
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	background: url(./img/4.jpg) no-repeat;
	background-size: cover;
	font-size: 16px;
}

.form {
	background: rgba(255, 255, 255, 0.2);
	width: 400px;
	margin: 100px auto;
}

#login_form {
	display: block;
}

#register_form {
	display: none;
}

.fa {
	display: inline-block;
	top: 27px;
	left: 6px;
	position: relative;
	color: #ccc;
}

input[type="text"], input[type="password"] {
	padding-left: 26px;
}

.checkbox {
	padding-left: 21px;
}

#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

			</ul>
			<a class="brand" href="#"><span class="first">TANG</span> <span
				class="second">TXMCMS</span></a>
		</div>
	</div>
	<form method="post"
		action="${pageContext.request.contextPath}/login?cmd=login">
		<div class="container">
			<div class="form row">
				<div class="form-horizontal col-sm-offset-3 col-md-offset-3"
					id="login_form">
					<h3 class="form-title">Login to your account</h3>
					<div class="col-sm-9 col-md-9">
						<div class="form-group">
							<i class="fa fa-user fa-lg"></i> <input
								class="form-control required" type="text" placeholder="用户名："
								id="login_username" name="username" autofocus="autofocus"
								maxlength="20" />
						</div>
						<div class="form-group">
							<i class="fa fa-lock fa-lg"></i> <input
								class="form-control required" type="password" placeholder="密码："
								id="login_password" name="userpwd" maxlength="20" />
							<!-- <button type="submit" style="height: 10px; width: 10px;">denglu</button> -->
						</div>
						<div class="form-group">
							<label class="checkbox"> <input type="checkbox"
								name="remember" value="1" /> Remember me
							</label>
							<hr />
							<a href="javascript:;" id="register_btn" class="">Create an
								account</a>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-success pull-right"
								id="login_btn" value="Login " />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>