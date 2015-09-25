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
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="ShowHomeServlet"><span class="glyphicon glyphicon-home"></span>Trang chủ</a></li>
				<li><a href="ListAccountServlet"><span class="glyphicon glyphicon-user"></span>QL người dùng</a></li>
				<li><a href="CTVServlet"><span class="glyphicon glyphicon-signal"></span>QL cộng tác viên<br>統計的</a></li>
				<li><a href="ListCategoryServlet"><span class="glyphicon glyphicon-list"></span>QL danh mục</a></li>
				<li><a href="ListPostsServlet"><span class="glyphicon glyphicon-list-alt"></span>QL bài viết</a></li>
				<li><a href="AdvertisementServlet"><span class="glyphicon glyphicon-list-alt"></span>QL quảng cáo</a></li>
				<li><a href="TaiNguyenServlet"><span class="glyphicon glyphicon-list-alt"></span>QL tài nguyên</a></li>					
				<li><a href="StatisticalServlet"><span class="glyphicon glyphicon-signal"></span>Thống kê</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
		
				<li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-out"></span>
						Đăng xuất<br>ログアウト</a></li>
				
			</ul>
		</div>
	</div>
	</nav>	
</body>

