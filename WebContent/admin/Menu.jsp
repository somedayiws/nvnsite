<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style type="text/css">
	span{ 
 		margin-right: 10px;
 	} 
</style>

</head>
<body>
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="padding: 0" href="#"><img
				alt="Logo Việt - Nhật" src="../images/logo_VN.jpg" width="120px"
				height="50px"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="Home(Admin).jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
					<li><a href="ListAccountServlet"><span class="glyphicon glyphicon-user"></span>User Management</a></li>
					<li><a href="ListCategoryServlet"><span class="glyphicon glyphicon-list"></span>Category Management</a></li>
					<li><a href="ListPostsServlet"><span class="glyphicon glyphicon-list-alt"></span>Posts Management</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
		
				<li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
				
			</ul>
		</div>
	</div>
	</nav>	
</body>

