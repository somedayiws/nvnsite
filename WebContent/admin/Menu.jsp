<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.TAIKHOAN"%>

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
					<li><a href="ShowHomeServlet"><span
							class="glyphicon glyphicon-home"></span>Trang chủ<br>ホーム</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
							class="glyphicon glyphicon-user"></span>QL thành viên<br>ユーザーの管理
							<span class="caret"></span></a>
						<ul class="dropdown-menu menu_">
							<li><a href="ListAccountServlet"><span
									class="glyphicon glyphicon-user"></span>QL người dùng<br>ユーザーの管理</a></li>
							<li><hr></li>
							<li><a href="CTVServlet"><span
									class="glyphicon glyphicon-signal"></span>QL cộng tác viên<br>協力者の管理
									</a></li>
						</ul></li>
					<li><a href="ListCategoryServlet"><span
							class="glyphicon glyphicon-list"></span>QL danh mục<br>項目の管理</a></li>
							
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"  href="#"><span
							class="glyphicon glyphicon-list-alt"></span>QL bài viết<br>記事の管理
							<span class="caret"></span></a>
						<ul class="dropdown-menu menu_">
							<li><a href="ListPostsServlet?view=moidang">DS Bài mới<br>新しい記事のリスト</a></li>
							<li><hr></li>
							<li><a href="ListPostsServlet?view=dadich">DS Bài đã dịch<br>翻訳された記事のリストです。</a></li>
							<li><hr></li>
							<li><a href="ListPostsServlet?view=huydich">DS Bài hủy dịch<br>キャンセルされた記事のリストです。</a></li>
							<li><hr></li>
							<li><a href="ListPostsServlet?view=dadang">DS Bài đã đăng<br>掲載された記事のリストです。</a></li>
							<li><hr></li>
							<li><a href="ListPostsServlet?view=all">Tất cả bài viết<br>全ての記事</a></li>
						</ul></li>		
							
							
					<!-- <li><a href="ListPostsServlet"><span
							class="glyphicon glyphicon-list-alt"></span>QL bài viết</a></li> -->
					<li><a href="ThongBaoServlet"><span
							class="glyphicon glyphicon-bullhorn"></span>QL thông báo<br>報告の管理</a></li>
					<li><a href="AdvertisementServlet"><span
							class="glyphicon glyphicon-globe"></span>QL quảng cáo<br>広告の管理</a></li>
					<li><a href="TaiNguyenServlet"><span
							class="glyphicon glyphicon-briefcase"></span>QL chung<br>全般に管理する。</a></li>
					<li><a href="LienHeServlet"><span
							class="glyphicon glyphicon-briefcase"></span>Liên hệ<br>連絡先の情報</a></li>
					<li><a href="StatisticalServlet"><span
							class="glyphicon glyphicon-signal"></span>Thống kê<br>まとめ</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
							class="glyphicon glyphicon-user"></span> <%=((String)request.getSession().getAttribute("username"))%><span class="caret"></span></a>
						<ul class="dropdown-menu menu_">
							<li><a href="EditProfileServlet"><span
									class="glyphicon glyphicon-credit-card"></span>Hồ sơ<br>プロファイル</a></li>
							<li><hr></li>
							<li><a href="LogoutServlet"><span
									class="glyphicon glyphicon-log-out"></span>Đăng xuất<br>ログアウト</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</body>

