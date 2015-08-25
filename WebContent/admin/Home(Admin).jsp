<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="./jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<title>Manager</title>
<style type="text/css">

</style>
</head>
<%
	//Check session exist
	HttpSession session_user = request.getSession();
	String username =(String)session_user.getAttribute("username");	
%>
<body>
	<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>	
		<%@include file="Menu.jsp"%>
		<div class="col-md-4 col-md-offset-4" style="margin-top: 6.5%">
			<img src="../images/congthongtin.png" class=img-responsive alt="Cổng thông tin">
			<marquee direction="right"><h2>Welcome to Admin</h2></marquee>
		</div>
		<div class="col-md-12" style="clear: both;">
		<%@include file="footer.jsp"%>	
		</div>

	</div>
	<%}else{%>
			<h1>404 - Không tìm thấy trang</h1>
	<%}
	%>
	
</body>
</html>