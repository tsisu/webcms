<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色权限分配</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<style type="text/css">
dl{
	margin-left: 30px;
}
dd,dt{
	line-height: 30px;
	cursor: pointer;
}
input[type='checkbox']{
	margin-top: -2px;
}
</style>
<script type="text/javascript">
/*
 * 选择父节点。如果当前父节点的状态是选中状态，那么所有字节的都选中。
      如果父节点为不选中状态，那么所有字节的全部不选中
 */
function clickParent(obj){
	var o = $(obj);//将dom对象转换为jquery对象
	var id = o.attr("id");
	if(o.is(":checked")){
		//全选
		$("[pid='"+id+"']").attr("checked",true);
	}else{
		//全不选
		$("[pid='"+id+"']").attr("checked",false);
	}
}
/*
 * 点击子节点。
    如果字节点为选中状态，那么父节点也应该要选中
 */
function clickChild(obj){
	var o = $(obj);
	if(o.is(":checked")){
		var pid = o.attr("pid");
		//父节点选中
		$("#"+pid).attr("checked",true);
	}
}
</script>
</head>
<body>
	<!-- 页标题栏 -->
	<ul class="breadcrumb">
		<li><a href="#">角色管理</a> <span class="divider">/</span></li>
		<li class="active">角色权限分配</li>
	</ul>
	<!-- 提示信息窗口 -->
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>正在为角色：${param.rolename}分配权限</h4>		
	</div>
	<div class="row-fluid">
		<div class="span12">
		<form class="form-horizontal"
				action="${pageContext.request.contextPath}/admin/role?cmd=right"
				method="post">
			<input type="hidden" name="roleid" value="${param.roleid}">
			<!-- 构建系统功能树 -->
			<dl>
				<c:forEach items="${list}" var="p">
					<c:if test="${p.funpid==\"-1\"}">
						<dt>
						<c:choose>
							<c:when test="${empty p.roleid}">
							<input type="checkbox" id="${p.funid}" onclick="clickParent(this);" name="funids" value="${p.funid}">
							</c:when>
							<c:otherwise>
							<input type="checkbox" checked="checked" id="${p.funid}" onclick="clickParent(this);" name="funids" value="${p.funid}">
							</c:otherwise>
						</c:choose>
						${p.funname}
						</dt>
							<c:forEach items="${list}" var="c">
								<c:if test="${c.funpid==p.funid}">
									<dd>
									<c:choose>
										<c:when test="${empty c.roleid}">
										<input type="checkbox" pid="${c.funpid}" onclick="clickChild(this);" name="funids" value="${c.funid}">
										</c:when>
										<c:otherwise>
										<input type="checkbox" checked="checked" pid="${c.funpid}" onclick="clickChild(this);" name="funids" value="${c.funid}">
										</c:otherwise>
									</c:choose>	
									${c.funname}
									</dd>
								</c:if>
							</c:forEach>
					</c:if>
				</c:forEach>
			</dl>
			<div class="control-group">
				<div class="controls">
					<input type="submit" class="btn" value="提交" />
					<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/role?cmd=list';">返回</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>