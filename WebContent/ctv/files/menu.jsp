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
			<a class="navbar-brand" href="TrangChuCTVServlet">VIET-NHAT</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="TrangChuCTVServlet">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="DanhSachBaiDichServlet?view=all">Danh sách bài dịch<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="DanhSachBaiDichServlet?view=all">Tất cả bài viết</a></li>
						<li><a href="DanhSachBaiDichServlet?view=moi">Bài mới nhận</a></li>
						<li><a href="DanhSachBaiDichServlet?view=dich">Bài đang dịch</a></li>
						<li><a href="DanhSachBaiDichServlet?view=qua-han">Bài dịch quá hạn</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="CapNhatThongTinServlet">Chào CTV <i class="fa fa-cogs"> </i></a>
					<ul class="dropdown-menu">
						<li><a href="CapNhatThongTinServlet"><i class="fa fa-info-circle"></i> Trang cá nhân</a></li>
						<li><a href="../DangXuatServlet"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>