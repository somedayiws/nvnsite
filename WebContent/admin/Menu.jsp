<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
	<nav class="navbar navbar-inverse" id="navtag">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="atag" href="ShowHomeServlet"><img
				alt="Logo Việt - Nhật" src="../images/logo_VN.jpg"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="ShowHomeServlet"><span class="glyphicon glyphicon-home"></span>Trang chủ</a></li>
					<li><a href="ListAccountServlet"><span class="glyphicon glyphicon-user"></span>Quản lý người dùng</a></li>
					<li><a href="ListCategoryServlet"><span class="glyphicon glyphicon-list"></span>Quản lý danh mục</a></li>
					<li><a href="ListPostsServlet"><span class="glyphicon glyphicon-list-alt"></span>Quản lý bài viết</a></li>
					<li><a href="AdvertisementServlet"><span class="glyphicon glyphicon-list-alt"></span>Quản lý quảng cáo</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
		
				<li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-out"></span>
						Đăng xuất</a></li>
				
			</ul>
		</div>
	</div>
	</nav>	
</body>

