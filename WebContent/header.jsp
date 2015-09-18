<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/Style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/back-to-top.js"></script>

<div id="headerTop">
	<div id="headerMain">
		<!-- logo đại diện -->

		<a href="TrangChuServlet"> <span></span>
		</a>
	</div>
	<div id="login">
		<div id="topmenu">
			<!-- Lấy dữ liệu từ server gửi về -->
			<%
				/* Danh mục được hiển thị content */
									ArrayList<DANHMUC> list = (ArrayList<DANHMUC>) request
											.getAttribute("list");
									/* Danh mục được hiển thị trong phần menu */
									ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>) request
											.getAttribute("listdanhmuc");
									/* Top 10 bài viết */
									ArrayList<BAIVIET> top = (ArrayList<BAIVIET>) request
											.getAttribute("topbaiviet");
									/* Lấy sesion người dùng */
									TAIKHOAN user = (TAIKHOAN) request.getSession()
											.getAttribute("user");
									if (user != null) {
			%>
			<input type="hidden" id="tkDangNhap" value="<%=user.getHoTen()%>">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="DangKyThanhVienServlet"><i class="fa fa-user"></i>
						Quảng cáo - ログイン</a> |</li> 
				<li class="dropdown">
				<a class="dropdown-toggle"
					data-toggle="dropdown" href="CapNhatThongTinServlet">Chào <%=user.getTenTaiKhoan()%>
						<i class="fa fa-cogs"> </i>
				</a>
				<ul class="dropdown-menu">
						<li><a href="TrangCaNhanServlet"><i
								class="fa fa-info-circle"></i> Trang cá nhân</a></li>
						<li><a href="DangXuatServlet"><i class="fa fa-sign-out"></i>
								Đăng xuất</a></li>
				</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<input type="hidden" id="tkDangNhap" value="null">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="DangKyThanhVienServlet"><i class="fa fa-user"></i>
						Quảng cáo - ログイン</a> | <a href="DangKyThanhVienServlet"><i class="fa fa-user"></i>
						Đăng ký - ログイン</a> | <a data-toggle="modal" data-target="#mdangnhap"><i
						class="fa fa-user"></i> Đăng nhập - ログインログイン</a></li>
				<%
					}
				%>
<!-- 				<li id="google_translate_element"></li> -->
			</ul>

			<script type="text/javascript">
				function googleTranslateElementInit() {
					new google.translate.TranslateElement(
							{
								pageLanguage : 'vi',
								layout : google.translate.TranslateElement.InlineLayout.SIMPLE,
								multilanguagePage : true
							}, 'google_translate_element');
				}
			</script>
			<script type="text/javascript"
				src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
		</div>
		<div class="clearfix"></div>
		<!-- form tìm kiếm -->
		<form id="seach" class="navbar-form navbar-right" role="search"
			action="TimKiemServlet" method="post">
			<select name="categoryJa" class="form-control">
				<option value="All" selected="selected">Tất cả</option>
				<option value="DM01">テクノロジー</option>
				<option value="DM02">生活</option>
				<option value="DM03">テクニカル</option>
				<option value="DM04">エンターテインメント</option>
			</select> <input type="text" class="form-control"
				placeholder="Tìm kiếm - Nhật ngữ" name="txtFind">
			<button type="submit" class="btn btn-success">
				<i class="fa fa-search"></i> Tìm kiếm
			</button>
		</form>
	</div>
	<!-- form đăng nhập -->
	<form action="DangNhapServlet" method="post" id="fdangnhap">
		<div class="modal fade" id="mdangnhap" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title" id="myModalLabel">Đăng nhập - ログイン</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<strong>Tài khoản - アカウント</strong> <input name="taikhoan"
								type="text" placeholder="Tài khoản" class="form-control">
						</div>
						<div class="row">
							<strong>Mật khẩu - パスワード</strong> <input name="matkhau"
								type="password" placeholder="Tài khoản" class="form-control">
						</div>
						<a href="DangKyThanhVienServlet"><i class="fa fa-user-plus"></i>
							Đăng ký - 新規取得</a>
					</div>
					<div class="modal-footer">
						<button name="xuly" name="submit" value="TrangChu"
							class="btn btn-primary btn-sm">Đăng nhập - ログイン</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">
							<i class="fa fa-reply"></i> Hủy - 取り消す
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- menu ngang -->
<nav class="navbar navbar-inverse">
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
				<li class="active"><a href="TrangChuServlet"
					class="fa fa-home fa-2x"></a></li>
				<%
					int i = 0;
													while (listdanhmuc != null && i < listdanhmuc.size() && i < 8) {
				%>
				<li><a
					href="DanhSachBaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>">
						<small class=vi><%=listdanhmuc.get(i).getTenDanhMucVi()%></small><br>
						<small class=ja><%=listdanhmuc.get(i).getTenDanhMucJa()%></small>
				</a></li>
				<%
					i++;
													}
													if (listdanhmuc != null && i < listdanhmuc.size()) {
				%>
				<!-- <li><a href="#"> <small class=vi>Thông Tin</small><br><small class=ja>じょうほう </small></a></li> -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <small class=vi>Danh
							Mục</small><br> <small class=ja>カテゴリ</small> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<%
							while (listdanhmuc != null && i < listdanhmuc.size()) {
						%>
						<li><a
							href="DanhSachBaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>-<%=listdanhmuc.get(i).getTenDanhMucJa()%></a></li>
						<%
							i++;
																								}
						%>
					</ul></li>
				<%
					}
				%>
			</ul>

		</div>
	</div>
</nav>
<div id="dynamicText">
	<div id="textdiv">
		<span class="col-sm-2 col-md-2" id="datetime"><i
			class="fa fa-clock-o"></i> Ngày 8 tháng 9 2015 </span> <span
			 id="textcontent"> <marquee>
				Dòng chữ chạy tự động nội dung web </marquee>
		</span>
		<%
			if (user == null) {
		%>
		<span class="col-sm-3 col-md-3">
			<button type="button" data-toggle="modal" data-target="#mdangnhap"
				class="btn btn-danger form-control">
				<i class="fa fa-newspaper-o"></i> Đăng bài - 投稿
			</button> <%
 	} else {
 %> <span class="col-sm-3 col-md-3">
				<button type="button" onclick="dichuyen('DangBaiVietServlet');"
					class="btn btn-danger form-control">
					<i class="fa fa-newspaper-o"></i> Đăng bài - 投稿
				</button> <%
 	}
 %>
		</span>
	</div>
</div>
<!-- <div id="right-icon-action"> -->
<!-- 	<div class="item-postnews" onmousemove="showtitlepost()" -->
<!-- 		onmouseout="hidetitlepost()"> -->
<%
	//if(user == null) {
%>
<!-- 		<span id="postnewstitle" style="opacity: 0;" data-toggle="modal" -->
<!-- 			data-target="#mdangnhap">Đăng bài - 投稿</span> <i -->
<!-- 			class="fa fa-newspaper-o" data-toggle="modal" -->
<!-- 			data-target="#mdangnhap"></i> -->
<%
	//}else{
%>
<!-- 		<span id="postnewstitle" style="opacity: 0;" -->
<!-- 			onclick="dichuyen('DangBaiVietServlet');">Đăng bài - 投稿</span> <i -->
<!-- 			class="fa fa-newspaper-o" onclick="dichuyen('DangBaiVietServlet');" -->
<!-- 			onmousemove="showtitlepost()" onmouseout="hidetitlepost()"></i> -->
<%
	//}
%>
<script>
	// 			function showtitlepost() {
	// 				$('.item-postnews #postnewstitle').attr("style", "opacity: 1;");
	// 			}
	// 			function hidetitlepost() {
	// 				$('.item-postnews #postnewstitle').attr("style", "opacity: 0;");
	// 			}
</script>
<!-- 	</div> -->
<!-- </div> -->