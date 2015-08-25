<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@page import="controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.lazyload.js"></script>
<title>Trang Chủ</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Google+ -->
<link rel="canonical" href="http://webvietnhat-demo.jelastic.skali.net/" />
</head>
<body onLoad="initialize()">
	<!-- form tìm kiếm -->
	<form id="seach" class="navbar-form navbar-right" role="search"
		action="TimKiemServlet" method="post">
		<div class="form-group">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm - Nhật ngữ" name="txtFind">
		</div>
		<button type="submit" class="btn btn-default">Search</button>
	</form>
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
	<!-- logo đại diện -->
	<a href="TrangChuServlet"> <img id="logo" alt="Logo"
		src="images/trangchu/logo-vietnhat24h.png">
	</a>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh mục được hiển thị content */
			ArrayList<DANHMUC> list = (ArrayList<DANHMUC>)request.getAttribute("list");
			/* Danh mục được hiển thị trong phần menu */
			ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>)request.getAttribute("listdanhmuc");
			/* Top 10 bài viết */
			ArrayList<BAIVIET> top = (ArrayList<BAIVIET>)request.getAttribute("topbaiviet");
			/* Lấy sesion người dùng */
			TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
	%>
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
						while(listdanhmuc != null && i < listdanhmuc.size() && i<9) {
				%>
				<li><a
					href="DanhSachBaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>">
						<small class=vi><%=listdanhmuc.get(i).getTenDanhMucVi()%></small><br>
						<small class=ja><%=listdanhmuc.get(i).getTenDanhMucJa()%></small>
				</a></li>
				<%
					i++; } 
						if(listdanhmuc != null && i < listdanhmuc.size()){
				%>
				<!-- <li><a href="#"> <small class=vi>Thông Tin</small><br><small class=ja>じょうほう </small></a></li> -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <small class=vi>Danh
							Mục</small><br> <small class=ja>カテゴリ</small> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<%
							while(listdanhmuc != null && i < listdanhmuc.size()) {
						%>
						<li><a
							href="DanhSachBaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>-<%=listdanhmuc.get(i).getTenDanhMucJa()%></a></li>
						<%
							i++; }
						%>
					</ul></li>
				<%
					}
				%>
			</ul>
			<%
				if(user != null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="CapNhatThongTinServlet">Chào <%=user.getTenTaiKhoan()%>
						<i class="fa fa-cogs"> </i></a>
					<ul class="dropdown-menu">
						<li><a href="TrangCaNhanServlet"><i
								class="fa fa-info-circle"></i> Trang cá nhân</a></li>
						<li><a href="DangXuatServlet"><i class="fa fa-sign-out"></i>
								Đăng xuất</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a data-toggle="modal" data-target="#mdangnhap"><i
						class="fa fa-user"></i> Login<br>ログイン</a></li>
			</ul>
			<%
				}
			%>
		</div>
	</div>
	</nav>
	<!-- Quảng cáo lung tung -->
	<div class="col-sm-1 col-md-1"></div>
	<div class="col-sm-2 col-md-2">
		<div id="danhmuchot" class="ancainay">
			<p id="titlehot">Danh Muc HOT -</p>
			<ul id="listhot">
				<%
					i=0;
						while(listdanhmuc != null && i<listdanhmuc.size()){
				%>
				<li><a
					href="BaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><i
						class="fa fa-hand-o-right"></i> <%=listdanhmuc.get(i).getTenDanhMucVi()%>
						- <%=listdanhmuc.get(i).getTenDanhMucJa()%> <span
						class="label label-default canh"><%=listdanhmuc.get(i).getSoLuongBV()%></span></a></li>
				<%
					i++; }
				%>
			</ul>
		</div>
		<div id="danhmuchot" class="ancainay">
			<div class="fb-page"
				data-href="https://www.facebook.com/congthongtinvietnhat"
				data-small-header="false" data-adapt-container-width="true"
				data-hide-cover="true" data-show-facepile="true"
				data-show-posts="false">
				<div class="fb-xfbml-parse-ignore">
					<blockquote cite="https://www.facebook.com/congthongtinvietnhat">
						<a href="https://www.facebook.com/congthongtinvietnhat">Cổng
							Thông Tin Việt Nhật</a>
					</blockquote>
				</div>
			</div>
		</div>
	</div>

	<!-- hiển thị nội dung chính ở đây -->
	<div class="col-sm-6 col-md-6" id="baiviet" style="font-size: 12px;">
		<%
			i = 0;
			while(list != null && i<list.size()){
				if(list.get(i).getBaiViets()!= null && list.get(i).getBaiViets().size()>0) {
		%>
		<!-- Bắt đầu 1 danh mục -->
		<div class="danhmucx">
			<strong><i class="fa fa-star-o"></i> <%=list.get(i).getTenDanhMucVi()%>
				- <%=list.get(i).getTenDanhMucJa()%></strong>
			<div class="row">
				<div class="row">

					<div id="wrapper_carousel" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<%
								ArrayList<BAIVIET> listbaiviet = list.get(i).getBaiViets();
									int j=1;
									if(listbaiviet != null && j<listbaiviet.size()){
							%>
							<div class="item active">
								<div class="baivieti col-xs-12 col-sm-12 col-md-12">
									<a
										href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
										class="thongtinthem"> <embed src="images/baiviet.jpg"><strong>Tác
											giả : <%=listbaiviet.get(i).getTaiKhoan().getHoTen()%></strong><br>
										<em> Ngày : <%=listbaiviet.get(i).getNgayDang()%><br>
											View : <%=listbaiviet.get(i).getLuotXem()%>
									</em>
									</a>
									<div class="motabai">
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
											<%=listbaiviet.get(i).getTenBaiVietVi()%> <br> <%=listbaiviet.get(i).getTenBaiVietJa()%>
										</a>
										<p>
											<%
												if(listbaiviet.get(i).getMoTaVi() != null) {
											%>
											<%=listbaiviet.get(i).getMoTaVi().length()>90 ? (listbaiviet.get(i).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaVi()%><br>
											<%
												}
											%>
											<%
												if(listbaiviet.get(i).getMoTaJa() != null) {
											%>
											<%=listbaiviet.get(i).getMoTaJa().length()>90 ? (listbaiviet.get(i).getMoTaJa().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaJa()%></p>
										<%
											}
										%>
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
											class="xemthem">Xem thêm ...</a>
									</div>
								</div>
							</div>
							<%
								j++; }
							%>

							<%
								while(listbaiviet != null && j<listbaiviet.size()){
							%>
							<div class="item">
								<div class="baivieti col-xs-12 col-sm-12 col-md-12">
									<a
										href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
										class="thongtinthem"> <embed src="images/baiviet.jpg"><strong>Tác
											giả : <%=listbaiviet.get(i).getTaiKhoan().getHoTen()%></strong><br>
										<em> Ngày : <%=listbaiviet.get(i).getNgayDang()%><br>
											View : <%=listbaiviet.get(i).getLuotXem()%>
									</em>
									</a>
									<div class="motabai">
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
											<%=listbaiviet.get(i).getTenBaiVietVi()%> <br> <%=listbaiviet.get(i).getTenBaiVietJa()%>
										</a>
										<p>
											<%
												if(listbaiviet.get(i).getMoTaVi() != null) {
											%>
											<%=listbaiviet.get(i).getMoTaVi().length()>90 ? (listbaiviet.get(i).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaVi()%><br>
											<%
												}
											%>
											<%
												if(listbaiviet.get(i).getMoTaJa() != null) {
											%>
											<%=listbaiviet.get(i).getMoTaJa().length()>40 ? (listbaiviet.get(i).getMoTaJa().substring(0, 40)+"..."): listbaiviet.get(i).getMoTaJa()%></p>
										<%
											}
										%>
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
											class="xemthem">Xem thêm ...</a>
									</div>
								</div>
							</div>
							<%
								j++; }
							%>

						</div>
						<a class="left carousel-control" href="#wrapper_carousel"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#wrapper_carousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;">
					<em><i class="fa fa-list-ul"></i> Các bài viết liên quan - 関連</em>
				</div>

				<!-- danh sách bài viết mới -->
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;" id="binhluan<%=i%>">
					<%
						j = 0;
										while(listbaiviet != null && j<listbaiviet.size()){
					%>
					<div class="row">
						<!-- danh sách các bài viết trong nhóm -->
						<div class="col-xs-1 col-sm-1 col-md-1">
							<img alt="Ảnh đại diện" src="images/baiviet.jpg"
								style="width: 20px;">
						</div>
						<div class="col-xs-10 col-sm-11 col-md-11">
							<a
								href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
								<%=listbaiviet.get(j).getTenBaiVietVi()%><br><%=listbaiviet.get(j).getTenBaiVietJa()%>
							</a>
						</div>
					</div>
					<%
						j++; }
					%>
				</div>
				<!-- Kết thúc binh luận -->
				<div class="col-xs-12 col-sm-12 col-md-12 text-right">
					<button type="button" class="btn btn-default btn-xs"
						onclick="loadData('DanhSachBaiVietServlet','<%=list.get(i).getIdDanhMuc().trim()%>');">
						<span class="glyphicon glyphicon-sort-by-attributes"></span>Xem
						thêm - 詳細
					</button>
				</div>
			</div>
		</div>

		<%-- <div class="danhmucxxx">
			<div class="tendanhmuc"><i class="fa fa-star-o"></i> <%= list.get(i).getTenDanhMucVi() %> - <%= list.get(i).getTenDanhMucJa() %></div>
			<div class="row">
				<div class="bainoibac">
					<!-- Bài viết nổi bậc -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<a href="BaiVietServlet?id="> <img alt="Ảnh đại diện" src="images/baiviet.jpg" style="width: 50px; float: left;">
							<small> Hồ Quốc Hải</small><br>
							<small>Ngày : 20-08-2015</small>
							<p>
								Hiện trường giả định vụ đánh bom Bangkok
								<br>
								Thái Lan công bố chân dung nghi phạm đánh bom
							</p>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<p>Anh ta bình tĩnh đi bộ vào  ra khỏi đền. Y cầm một túi nhựa màu xanh và một vật dường như là chiếc điện thoại di động trong tay.</p>
						<p>Cảnh sát Thái Lan hôm 19/8 đã wa, đồng thời treo thưởng 1 triệu bath cho người cung cấp thông tin giúp bắt giữ tên này.</p>
					</div>
				</div>
				<div class="bailienquan"
					style="background-color: white;">
					<!-- <em><i class="fa fa-list-ul"></i> Các bài viết liên quan - 関連</em> -->
					<button type="button" class="btn btn-link btn-xs them"
						onclick="loadData('DanhSachBaiVietServlet','');">
						<span class="glyphicon glyphicon-sort-by-attributes"></span>
						Các bài viết liên quan - 関連
					</button>
					<div class="list">
						<!-- danh sách các bài viết trong nhóm -->
						<ul>
							<li><a href="BaiVietServlet?id="> <i class="fa fa-hand-o-right"></i> Thái Lan công bố chân dung nghi phạm đánh bom<br>Thái Lan công bố chân dung nghi phạm đánh bom</a></li>
							<li><a href="BaiVietServlet?id="> <i class="fa fa-hand-o-right"></i> Thái Lan công bố chân dung nghi phạm đánh bom<br>Thái Lan công bố chân dung nghi phạm đánh bom</a></li>
							<li><a href="BaiVietServlet?id="> <i class="fa fa-hand-o-right"></i> Thái Lan công bố chân dung nghi phạm đánh bom<br>Thái Lan công bố chân dung nghi phạm đánh bom</a></li>
						</ul>
					</div>
				</div>
				<!-- Kết thúc binh luận -->
				<div class="col-xs-12 col-sm-12 col-md-12 text-right">
					
				</div>
			</div>
		</div>
		 --%>
		<%
			} i++; }
		%>
	</div>
	<!-- Quảng cáo lung tung -->
	<div class="col-sm-2 col-md-2">
		<%
			if(user == null) {
		%>
		<button type="button" data-toggle="modal" data-target="#mdangnhap"
			class="btn btn-success form-control">
			<i class="fa fa-newspaper-o"></i> Đăng bài - 投稿
		</button>
		<%
			}else{
		%>
		<button type="button" onclick="dichuyen('DangBaiVietServlet');"
			class="btn btn-success form-control">
			<i class="fa fa-newspaper-o"></i> Đăng bài - 投稿
		</button>
		<%
			}
		%>

		<br> Bản đồ - 地図 - Việt Nam<br>
		<div id="div_id1" style="height: 250px; width: 100%"></div>
		<br> Bản đồ - 地図 - JaPan <br>
		<div id="div_id2" style="height: 250px; width: 100%"></div>
		<div class="xemnhieu">
			<strong>Xem nhiều nhất - 人気の動画</strong>
			<ul>
				<%
					i=0;
							while(top != null && i<top.size()){
				%>
				<li><a href="BaiVietServlet?id=<%=top.get(i).getIdBaiViet()%>"><i
						class="fa fa-thumbs-o-up"></i> <%=top.get(i).getTenBaiVietVi()%>
						- <%=top.get(i).getTenBaiVietJa()%></a></li>
				<%
					i++; }
				%>
			</ul>
		</div>
		<div id="them">
			<%
				SessionCounter counter = (SessionCounter) session.getAttribute("counter");
					request.getRemoteAddr();
			%>
			<strong> <i class="fa fa-users"></i> Views - 履歴 : <%=counter.getActiveView()%>
				<br> <i class="fa fa-globe"></i> Online - 直結 : <%=counter.getActiveSessionNumber()%>
			</strong>
		</div>
	</div>
	<div id="sahred" class="ancainay">
		<g:plusone></g:plusone>

		<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>

		<div id="fb-root"></div>
		<!-- Your share button code -->
		<div class="fb-share-button"
			data-href="http://webvietnhat-demo.jelastic.skali.net/"
			data-layout="button_count"></div>
	</div>
	<div class="clearfix"></div>
	<br>
	<!-- kết thúc -->
	<div class="col-sm-4 col-md-4 col-md-offset-8">
		<button type="button" class="btn btn-default btn-xs" id="xemtiep">
			<span class="glyphicon glyphicon-th-list"></span> Xem tiếp - 続き ...
		</button>
	</div>
	<div class="col-sm-10 col-md-12" align="center" id="load"></div>
	<div class="clearfix"></div>

</body>
<!-- Các đoạn script để đây -->
<!-- <script language="JavaScript">
	window.onresize = notify;
	function notify() {
		alert("Window resized!");
	}
</script> -->
<!-- Google map -->
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
<script type="text/javascript">
	var map;
	var map1;
	function initialize() {
		var myLatlng = new google.maps.LatLng(16.467800, 107.578983);
		var myLatlng1 = new google.maps.LatLng(37.562170, 139.988980);
		var myOptions = {
			zoom : 4,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var myOptions1 = {
			zoom : 4,
			center : myLatlng1,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById("div_id1"), myOptions);
		map1 = new google.maps.Map(document.getElementById("div_id2"),
				myOptions1);

		var infowindow = new google.maps.InfoWindow({
			content : "TP-Huế",
			size : new google.maps.Size(100, 50),
			position : myLatlng
		});
		var infowindow1 = new google.maps.InfoWindow({
			content : "Home",
			size : new google.maps.Size(100, 50),
			position : myLatlng1
		});
		infowindow.open(map);
		infowindow1.open(map1);

	}
</script>
<!-- Google+ -->
<script type="text/javascript"
	src="https://apis.google.com/js/plusone.js"></script>
<!-- Twitter -->
<script>
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
				.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');
</script>
<!-- Facebook -->
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.4&appId=1671772309710877";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<!-- Hộp thoại phản hồi -->
<script lang="javascript">
	(function() {
		var _h1 = document.getElementsByTagName('title')[0] || false;
		var product_name = '';
		if (_h1) {
			product_name = _h1.textContent || _h1.innerText;
		}
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=f6fdedfea03ad1bcd7118f3fed15d856&data=eyJzc29faWQiOjEzNDI2MjcsImhhc2giOiIzMzRmODIxY2QwNmFiNTM4ZTBkOTMzNzM2ZDA2ZThlMSJ9&pname='
				+ product_name;
		var s = document.getElementsByTagName('script');
		s[0].parentNode.insertBefore(ga, s[0]);
	})();
</script>
<!-- Ajax load danh mục -->
<script type="text/javascript">
	/* xem thêm các danh mục */
	var nbaiviet = 10;
	$(document)
			.ready(
					function() {
						$("#xemtiep")
								.click(
										function() {
											$
													.ajax({
														url : "DataDanhMucServlet", //file 
														type : "POST", //phuong thức gưi
														data : {
															vitri : nbaiviet
														}, //dữ liệu gửi
														async : true, //
														beforeSend : function() {
															$("#load")
																	.html(
																			"<i class='fa fa-refresh fa-2x fa-spin'></i>");
														},
														success : function(res) {
															$("#baiviet")
																	.append(res);
															nbaiviet = parseInt($(
																	"#baiviet")
																	.children()
																	.size());
															$("#load").html("");
														},
														error : function() {
															alert('Có lỗi xảy ra');
															$("#load").html("");
														}
													});
										});
					});
</script>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
</script>
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fdangnhap").validate({
			rules : {
				taikhoan : {
					required : true
				},
				matkhau : {
					required : true
				}
			},
			messages : {
				taikhoan : {
					required : "<br>Chưa nhập tên tài khoản"
				},
				matkhau : {
					required : "<br>Chưa nhập mật khẩu!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>