<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用TXMCMS系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<!-- Demo page code -->
<style type="text/css">
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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="" style="width:100%">
	<!--<![endif]-->

	<!-- 页头begin -->
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> ${currentUser.usertruename} <i class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">修改密码</a></li>
						<li class="divider"></li>
						
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1" href="sign-in.html">注销</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="index.html"><span class="first">TANG</span>
				<span class="second">TXMCMS</span></a>
		</div>
	</div>
	<!-- 页头end -->

	<!-- 导航栏 begin -->
	<div class="sidebar-nav">
		<c:forEach items="${list}" var="p">
			<c:if test="${p.funpid==\"-1\"}">
				<a href="#dashboard-menu" class="nav-header" data-toggle="collapse">
					<i class="icon-dashboard"></i>${p.funname}
				</a>
			</c:if>
			<ul id="dashboard-menu" class="nav nav-list collapse in">
				<c:forEach items="${list}" var="c">
					<c:if test="${c.funpid==p.funid}">
						<li>
							<a href="${pageContext.request.contextPath}${c.funurl}" target="main">${c.funname}</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
	<!-- 导航栏 end -->

	<!-- 工具栏begin -->
	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="number">14</span>日
				</p>
				<p class="stat">
					<span class="number">04</span>月
				</p>
				<p class="stat">
					<span class="number">2021</span>年
				</p>
			</div>

			<h1 class="page-title">TXMCMS内容发布平台</h1>
		</div>
		<!-- 工具栏end -->

		
		<div class="container-fluid" style="padding: 0">
			<div class="row-fluid">
				<iframe src="test.html" id="main" name="main" style="width:100%;height:700px;margin: 0;border: 0px"></iframe>
				<footer style="margin-top: 5px;padding-top: 0px;padding-bottom: 0px">
					<hr style="margin: 5px">
					<p class="pull-right">
						版权所有 <a href="#" title="果珍" target="_blank">果珍</a>
					</p>

					<p>
						&copy; 2021 <a href="#" target="_blank">TANG</a>
					</p>
				</footer>
			</div>
		</div>

	</div>



	<script
		src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>

</body>
</html>