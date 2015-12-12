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
	<div id="resultMessage"><%=request.getAttribute("KetQua")%></div>
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
	<span class="col-sm-3 col-md-3">
		<button style="font-weight: bold;" type="button"
			onclick="dichuyen('Dang-bai-viet');"
			class="btn btn-danger form-control">Đăng bài・Đăng kí Miễn
			phí 無料掲載・登録</button>
	</span>

	<div id="fix-post-news">
		<span id="fix-post-back"></span>
		<div id="btn-post" class="btn-right-panel"
			onclick="dichuyen('Dang-bai-viet');">
			<span id="fix-post-caption" class="fix-caption">Đăng bài・Đăng
				kí Miễn phí</br> 無料掲載・登録
			</span> <i class="fa fa-paper-plane"></i>
		</div>
		<div id="btn-user" class="btn-right-panel"
			onclick="dichuyen('Trang-ca-nhan');">
			<span id="fix-post-caption" class="fix-caption">Trang cá nhân<br>
				...
			</span> <i class="fa fa-user"></i>
		</div>
		<div id="btn-notify" class="btn-right-panel"
			onclick="dichuyen('Thong-bao');">
			<div id="countMailSide"><%=request.getAttribute("soEmail") == null ? "0"
						: request.getAttribute("soEmail")%></div>
			<span id="fix-post-caption" class="fix-caption">Thông báo <br>
				...
			</span> <i class="fa fa-bell"></i>
		</div>
		<div id="btn-top" class="btn-right-panel" onclick="dichuyen('#');">
			<span id="fix-post-caption" class="fix-caption">Lên đầu trang
				<br> ...
			</span> <i class="fa fa-arrow-up"></i>
		</div>

	</div>


	<%
		} else {
	%>
	<div id="resultMessage"><%=request.getAttribute("KetQua")%></div>
	<%
		}
	%>
</div>