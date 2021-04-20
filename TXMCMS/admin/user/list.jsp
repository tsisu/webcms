<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
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
		<li><a href="#">用户管理</a> <span class="divider">/</span></li>
		<li class="active">用户列表</li>
	</ul>
	<div class="result-title">
	<div class="result-list">
		<a href="add.jsp"><i class="icon-font"></i>新增用户</a>
        <a id="batchDel" href="javascript:delmore('你确定要删除这些用户吗?','myform')"><i class="icon-font"></i>批量删除</a>
	</div>
	</div>
	<div class="row-fluid">
		<form class="form-search" style="padding: 5px"
			action="${pageContext.request.contextPath}/admin/user?cmd=list"
			method="post">
			<label>用户姓名：</label><input class="input-medium search-query"
				type="text" name="username" value="${param.username}" /> 状态： <select
				name="userstate">
				<c:choose>
					<c:when test="${param.userstate==1}">
						<option value="-1">全部</option>
						<option value="1" selected="selected">正常</option>
						<option value="0">不正常</option>
					</c:when>
					<c:when test="${param.userstate==0}">
						<option value="-1">全部</option>
						<option value="1">正常</option>
						<option value="0" selected="selected">不正常</option>
					</c:when>
					<c:otherwise>
						<option value="-1">全部</option>
						<option value="1">正常</option>
						<option value="0">不正常</option>
					</c:otherwise>
				</c:choose>
			</select>
			<button type="submit" class="btn">查找</button>
		</form>
		<table class="table table-bordered">
			<thead>
				<tr>
				<th class="tc" width="5%"><input class="allChoose" name="" onclick="selectall(this)" type="checkbox"></th>
					<th>ID</th>
					<th>用户名</th>
					<th>用户真实姓名</th>
					<th>性别</th>
					<th>用户状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="user">
					<tr>
						<td class="tc"><input name="id[]" value="${user.userid}" type="checkbox"></td>
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.usertruename}</td>
						<td>${user.usersex}</td>
						<td><c:choose>
								<c:when test="${user.userstate==1}">正常</c:when>
								<c:otherwise>不可用</c:otherwise>
							</c:choose></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/user?cmd=init&id=${user.userid}">修改</a>
							<c:if test="${user.userstate ==1}">
                            <a class="link-del" href="javascript:Delete('你确定要删除用户${user.username}吗?','user?id=${user.userid}')">删除</a>
                            </c:if>
						</td>
						
					</tr>
				</c:forEach>
				<script>
                        	function Delete(msg,url){
                        		if(confirm(msg)){
                        			location.href=url;
                        		}
                        	}
                        	
                        	function selectall(o){
                        		var a = document.getElementsByName('id[]');
                        		for(var i = 0;i<a.length;i++){
                        			a[i].checked = o.checked;
                        		}
                        	}
                        	function delmore(msg,formname){
                        		if(confirm(msg)){
                        			var form = document.getElementById(formname);
                        			form.submit();
                        		}
                        	}
                        </script>
			</tbody>
		</table>
		<div class="list-page">
			共${tsum}条记录，当前${cpage}/${tpage}页 
			<a href="user?cp=1${searchParam}">首页</a> 
			<a href="user?cp${cpage-1<1?1:cpage-1}${searchParam}">上一页</a>
			<a href="user?cp${cpage+1>tpage?tpage:cpage+1}${searchParam}">下一页</a> 
			<a href="user?cp${tpage}${searchParam}">尾页</a>
		</div>
	</div>
</body>
</html>