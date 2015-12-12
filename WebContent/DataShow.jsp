<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.TAIKHOAN"%>

<div id="result">
	<%
		if (request.getAttribute("KetQua") == null) {
	%>
	<div id="resultMessage">
		<div class='alert alert-danger' role='alert'>
			<p>Lỗi</p>
		</div>
	</div>
	<%
		} else if (request.getAttribute("KetQua").equals("Thanhcong")) {
	%>
	<div id="resultMessage"><%=request.getAttribute("KetQua") %></div>
	<div id="topmenu">
		<!-- Lấy dữ liệu từ server gửi về -->
		<%
			/* Lấy sesion người dùng */
				TAIKHOAN user = (TAIKHOAN) request.getSession().getAttribute(
						"user");

				if (user != null) {
		%>
		<input type="hidden" id="tkDangNhap" value="<%=user.getHoTen()%>">
		<ul class="nav navbar-nav navbar-right">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="Trang-ca-nhan">Chào-ようこそ<%=user.getHoTen()%>
			</a>
				<ul class="dropdown-menu">
					<li><a href="Trang-ca-nhan"><i class="fa fa-info-circle"></i>
							Trang cá nhân-個人ホーム</a></li>
					<li><a href="Dang-xuat"><i class="fa fa-sign-out"></i>
							Đăng xuất-ログアウト</a></li>
				</ul></li>
			<li id="checkmail"></li>
			<li><a href="Gia-dich-vu"> Quảng cáo - 広告</a> |</li>
		</ul>
		<%
			} else {
		%>
		<input type="hidden" id="tkDangNhap" value="null">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="Gia-dich-vu"> Quảng cáo - 広告</a> | <a
				href="Dang-ky">Đăng ký - 登録する</a> | <a data-toggle="modal"
				data-target="#mdangnhap"> Đăng nhập - ログインする</a></li>

		</ul>
		<%
			}
		%>
	</div>
	
	
	
	
	
	<%
		} else {
	%>
	<div id="resultMessage"><%=request.getAttribute("KetQua") %></div>
	<%
		}
	%>
</div>