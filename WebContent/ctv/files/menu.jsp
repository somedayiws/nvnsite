<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Trang-chu">
				<img alt="Việt - Nhật" src="../images/trangchu/logo2.png" style="width: 200px; height: 50px; background-color: white; margin-top: -2%;">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="Trang-chu"><i class="fa fa-home"></i> ホーム<br>Trang Chủ</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="Danh-sach-bai-dich?view=all"><i class="fa fa-list-ul"></i> 翻訳された記事のリスト<br>Danh sách bài dịch<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Danh-sach-bai-dich?view=all">Tất cả bài viết - すべての記事です。 </a></li>
						<li><a href="Danh-sach-bai-dich?view=moi">Bài mới nhận - 届いたばかり文書ーニュース</a></li>
						<li><a href="Danh-sach-bai-dich?view=dich">Bài đang dịch - 翻訳中の文書  </a></li>
						<li><a href="Danh-sach-bai-dich?view=qua-han">Bài dịch quá hạn - 期限が過ぎた翻訳の文書•ニュース </a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="Cap-nhat-tai-khoan">Chào CTV <i class="fa fa-cogs"> </i></a>
					<ul class="dropdown-menu">
						<li><a href="Cap-nhat-tai-khoan"><i class="fa fa-info-circle"></i> Trang cá nhân<br>個人ホーム </a></li>
						<li><a href="../Dang-xuat"><i class="fa fa-sign-out"></i> Đăng xuất<br>ログアウト</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>