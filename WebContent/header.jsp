<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="Utils.APIWrapper"%>
<%@page import="Utils.GoogleAuth"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet" href="css/Style.css">
<script type="text/javascript" src="js/back-to-top.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "CheckEmailServlet",
			type : "post",
			success : function(result) {
				$("#checkmail").html(result);
			}
		});
		var refreshId = setInterval(function() {
			$.ajax({
				url : "CheckEmailServlet",
				type : "post",
				success : function(result) {
					$("#checkmail").html(result);
				}
			});
		}, 30000);
	});
</script>
<div id=fullHeader>
	<div id="headerTop">
		<div id="headerMain">
			<!-- logo đại diện -->

			<a href="Trang-chu"> <span></span>
			</a>
		</div>
		<div id="login">
			<div id="topmenu">
				<!-- Lấy dữ liệu từ server gửi về -->
				<%
					Calendar cal = Calendar.getInstance();
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy z");
					SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy z");
					sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
					String homedate = sdf.format(cal.getTime());
					/* Danh mục được hiển thị trong phần menu */
					ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>) request
							.getAttribute("listdanhmuc");
					/* Lấy sesion người dùng */
					TAIKHOAN user = (TAIKHOAN) request.getSession()
							.getAttribute("user");

					if (user != null) {
				%>
				<input type="hidden" id="tkDangNhap" value="<%=user.getHoTen()%>">
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="Trang-ca-nhan">Chào-ようこそ<%=user.getHoTen()%>
					</a>
						<ul class="dropdown-menu">
							<li><a href="Trang-ca-nhan"><i
									class="fa fa-info-circle"></i> Trang cá nhân-個人ホーム</a></li>
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
						href="Dang-ky">Đăng ký - 登録する</a> | <a
						data-toggle="modal" data-target="#mdangnhap"> Đăng nhập - ログインする</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<input type="hidden" id="dateComment"
				value=<%=sdf1.format(cal.getTime())%>>
			<div class="clearfix"></div>
			<!-- form tìm kiếm -->
			<form id="seach" class="navbar-form navbar-right" role="search"
				action="Tim-kiem" method="post">
				<select name="categoryJa" class="form-control">
					<option value="All" selected="selected">Tất cả - 全て</option>
					<option value="ChuDe">Theo chủ đề - テーマ通り</option>
					<option value="NoiDung">Theo nội dung - 内容通り</option>
				</select> <input type="text" class="form-control"
					placeholder="Tìm kiếm - 検索" name="txtFind">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-search"></i> Tìm kiếm-検索
				</button>
			</form>
		</div>
		<!-- form đăng nhập -->
		<form action="Dang-nhap" method="post" id="fdangnhap">
			<div class="modal fade" id="mdangnhap" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h3 class="modal-title" id="myModalLabel">Đăng nhập - ログインする</h3>
						</div>
						<div class="modal-body">
							<div class="row">
								<strong>Tài khoản - アカウント</strong> <input name="taikhoan"
									type="text" placeholder="Tài khoản - アカウント" class="form-control">
							</div>
							<div class="row">
								<strong>Mật khẩu - パスワード</strong> <input name="matkhau"
									type="password" placeholder="Tài khoản - パスワード" class="form-control">
							</div>
							<a href="Quen-mat-khau" style="color: rgb(23,96,147);"> Quên mật khẩu - パスワードを忘れた。 ?</a><br> 
							<a href="Dang-ky"><i class="fa fa-user-plus"></i> Đăng ký - 登録する</a>
							
							<a href="<%=APIWrapper.getDialogLink() %>" id="loginfb"><i class="fa fa-facebook"></i> Đăng nhập bằng Facebook - フェイスブックでロックインをする</a>
							<a href="<%=GoogleAuth.getDialogLink() %>" id="logingg"><i class="fa fa-google-plus"></i> Đăng nhập bằng Google</a>
						</div>
						<div class="modal-footer">
							<button name="xuly" name="submit" value="TrangChu"
								class="btn btn-primary btn-sm">Đăng nhập - ログインする</button>
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal">
								<i class="fa fa-reply"></i> Hủy - 削除
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
					<li class="active"><a href="Trang-chu"
						class="fa fa-home fa-2x"></a></li>
					<%
						int i = 0;
						while (listdanhmuc != null && i < listdanhmuc.size() && i < 7) {
					%>
					<li><a
						href="Danh-sach-bai-viet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>">
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
								Mục</small><br> <small class=ja>項目</small> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<%
								while (listdanhmuc != null && i < listdanhmuc.size()) {
							%>
							<li><a
								href="Danh-sach-bai-viet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>-<%=listdanhmuc.get(i).getTenDanhMucJa()%></a></li>
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
</div>
<div id="dynamicText">
	<div id="textdiv">
		<span class="col-sm-2 col-md-2" id="datetime"><i
			class="fa fa-clock-o"></i> <%=homedate%> </span> <span id="textcontent">
			<marquee> <%= request.getAttribute("ThongDiep")==null ||request.getAttribute("ThongDiep").equals("")?"JPVN.NET   へようこそ　Chào Mừng Bạn Đến Với JPVN.NET":request.getAttribute("ThongDiep") %> </marquee>
		</span>
		<%
			if (user == null) {
		%>
		<span class="col-sm-3 col-md-3">
			<button type="button" data-toggle="modal" data-target="#mdangnhap"
				class="btn btn-danger form-control">
				 Đăng bài・Đăng kí Miễn phí
無料掲載・登録
			</button> <%
 	} else {
 %> <span class="col-sm-3 col-md-3">
				<button style="font-weight: bold;" type="button" onclick="dichuyen('Dang-bai-viet');"
					class="btn btn-danger form-control">
					Đăng bài・Đăng kí Miễn phí
無料掲載・登録</button> <%
 	}
 %>
		</span>
	</div>
</div>
<div id="delailoinhan">
	<p><a href="Lien-he"><i class="fa fa-envelope"></i> Liên hệ với admin - 管理者とコンタクト</a></p>
	</div>