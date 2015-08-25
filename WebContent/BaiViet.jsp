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
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.lazyload.js"></script>
<title>Chi tiết bài viết</title>
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css">

</head>
<body onLoad="initialize()">
	<!-- form tìm kiếm -->
	<form id="seach" class="navbar-form navbar-right" role="search" action="TimKiemServlet" method="post">
		<div class="form-group">
			<input type="text" name="txtFind" class="form-control" placeholder="Tìm kiếm - Nhật ngữ">
		</div>
		<button type="submit" class="btn btn-default">Search</button>
	</form>
	<!-- form đăng nhập -->
	<form action="DangNhapServlet" method="post" id="fdangnhap">
	<div class="modal fade" id="mdangnhap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="modal-title" id="myModalLabel"> Đăng nhập - ログイン</h3>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	        	<strong>Tài khoản - アカウント</strong>
	        	<input name="taikhoan" type="text" placeholder="Tài khoản" class="form-control">
	        </div>
	        <div class="row">
	        	<strong>Mật khẩu - パスワード</strong>
	        	<input name="matkhau" type="password" placeholder="Tài khoản" class="form-control">
	        </div>
	        <a href="DangKyThanhVienServlet"><i class="fa fa-user-plus"></i> Đăng ký - 新規取得</a>
	      </div>
	      <div class="modal-footer">
	      	<button name="xuly" name="submit" value="BaiViet" class="btn btn-primary btn-sm">Đăng nhập - ログオン</button>
	        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-reply"></i> Hủy - 取り消す</button>
	      </div>
	    </div>
	  </div>
	</div>
	</form>
	<!-- logo đại diện -->
	<a href="TrangChuServlet">
		<img id="logo" alt="Logo" src="images/trangchu/logo-vietnhat24h.png">
	</a>
	<!-- Lấy dữ liệu từ server gửi về -->
	<% 
		/* Danh mục được hiển thị trên menu */
		ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>)request.getAttribute("listdanhmuc");
		/* Lấy sesion người dùng */
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		/* Bài viết được view */
		BAIVIET baiviet = (BAIVIET)request.getAttribute("baiviet");
		/* Top 10 bài viết đầu tiên được hiển thị */
		ArrayList<BAIVIET> list = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
		/* Top 10 bài viết */
		ArrayList<BAIVIET> top = (ArrayList<BAIVIET>)request.getAttribute("topbaiviet");
		/* binh luan tiếng việt*/
		ArrayList<BINHLUAN> blviet = baiviet.getBinhLuanVi();
		/* bình luận tiếng nhật*/
		ArrayList<BINHLUAN> blnhat = baiviet.getBinhLuanJa();
	%>
	<!-- Kết thúc quá trình lấy dữ liệu -->
	<!-- Định nghĩa biến dùng tạm -->
	<% if(user != null) { %>
		<input type="hidden" id="tkDangNhap" value="<%= user.getHoTen() %>">
	<% } else { %>
		<input type="hidden" id="tkDangNhap" value="null">
	<% } %>
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
			<li class="active"><a href="TrangChuServlet" class="fa fa-home fa-2x"></a></li>
			<%
				int i = 0;
				while(listdanhmuc != null && i < listdanhmuc.size() && i<9) {
			%>
			<li><a href="DanhSachBaiVietServlet?id=<%= listdanhmuc.get(i).getIdDanhMuc() %>"> <small class=vi><%=listdanhmuc.get(i).getTenDanhMucVi()%></small><br>
				<small class=ja><%=listdanhmuc.get(i).getTenDanhMucJa()%></small></a></li>
			<%
				i++; } 
				if(listdanhmuc != null && i < listdanhmuc.size()){
			%>
			<!-- <li><a href="#"> <small class=vi>Thông Tin</small><br><small class=ja>じょうほう </small></a></li> -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <small class=vi>Danh
						Mục</small><br>
				<small class=ja>カテゴリ</small> <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<%
						while(listdanhmuc != null && i < listdanhmuc.size()) {
					%>
					<li><a href="DanhSachBaiVietServlet?id=<%= listdanhmuc.get(i).getIdDanhMuc() %>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>-<%=listdanhmuc.get(i).getTenDanhMucJa()%></a></li>
					<%
						i++; }
					%>
				</ul></li>
			<%
				}
			%>
		</ul>
		<% if(user != null) { %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="CapNhatThongTinServlet">Chào <%= user.getTenTaiKhoan() %> <i class="fa fa-cogs"> </i></a>
					<ul class="dropdown-menu">
						<li><a href="TrangCaNhanServlet"><i class="fa fa-info-circle"></i> Trang cá nhân</a></li>
						<li><a href="DangXuatServlet"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
					</ul></li>
			</ul>
		<% } else { %>
		<ul class="nav navbar-nav navbar-right">
			<li><a data-toggle="modal" data-target="#mdangnhap" ><i class="fa fa-user"></i> Login<br>ログイン</a></li>
		</ul>
		<% } %>
	</div>
	</div>
	</nav>
	<!-- Quảng cáo lung tung -->
	<div class="col-sm-1 col-md-1">
		
	</div>
	<div id="sahred">
		<g:plusone></g:plusone>

		<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>

		<div id="fb-root"></div>
		<!-- Your share button code -->
		<div class="fb-share-button"
			data-href="http://webvietnhat-demo.jelastic.skali.net/"
			data-layout="button_count"></div>
	</div>
	<!-- hiển thị nội dung chính ở đây -->
	<div class="col-sm-8 col-md-8" id="baiviet">
		<h3>
			<i class="fa fa-empire"></i>
			<%  if(baiviet.getTenBaiVietVi() != null ) { %> <%= baiviet.getTenBaiVietVi() %> <% } %>
			<%	if(baiviet.getTenBaiVietVi() != null && baiviet.getTenBaiVietJa() != null) { %> - <% } %>
			<%	if(baiviet.getTenBaiVietJa() != null ) { %> <%= baiviet.getTenBaiVietJa() %> <% } %>
		</h3>
		<p>
			<%  if(baiviet.getMoTaVi() != null ) { %>
				<strong> <%= baiviet.getMoTaVi() %></strong> <br>
			<% } %>
			<%  if(baiviet.getMoTaJa() != null ) { %>
				<strong> <%= baiviet.getMoTaJa() %></strong>
			<% } %>
		</p>
		<br><br>
		<div id="noidung">
			<%  if(baiviet.getNoiDungVi() != null && baiviet.getNoiDungJa() != null ) { %>
				<div class="col-xs-12 col-sm-6 col-md-6" id="tiengviet">
					<%= baiviet.getNoiDungVi() %>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6" id="tiengnhat">
					<%= baiviet.getNoiDungJa() %>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6" id="blviet">
						<strong> Bình luận </strong>
						<div class="row" id="listblviet">
							<% 
								i = 0;
								while(blviet != null && i<blviet.size()){
							%>
							<i class="fa fa-user"></i> <em><%= blviet.get(i).getTaiKhoan().getHoTen() %></em>
							<p><%= blviet.get(i).getPhanHoiVi() %></p>
							<% i++; } %>
						</div>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtviet"></textarea>
						</div>
						<div class="row" id="tuychonviet">
							<button type="button" class="btn btn-link" onclick="comentvi('<%= baiviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
							<button type="button" class="btn btn-link" onclick="loadBinhLuan('<%= baiviet.getIdBaiViet() %>', 'vi');"><i class="fa fa-hand-o-right"></i> Xem thêm - 詳細</button>
						</div>
					</div>
				<div class="col-xs-12 col-sm-6 col-md-6" id="blnhat">
						<strong> Các comment tiêu biểu </strong>
						<div class="row" id="listblnhat">
							<% 
								i = 0;
								while(blnhat != null && i<blnhat.size()){
							%>
							<i class="fa fa-user"></i> <em><%= blnhat.get(i).getTaiKhoan().getHoTen() %></em>
							<p><%= blnhat.get(i).getPhanHoiJa() %></p>
							<% i++; } %>
						</div>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtnhat"></textarea>
						</div>
						<div class="row" id="tuychonnhat">
							<button type="button" class="btn btn-link" onclick="comentja('<%= baiviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
							<button type="button" class="btn btn-link" onclick="loadBinhLuan('<%= baiviet.getIdBaiViet() %>', 'ja');"><i class="fa fa-hand-o-right"></i> Xem thêm - 詳細</button>
						</div>
				</div>
			<% } else { %>
				<%  if(baiviet.getNoiDungVi() != null ) { %>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengviet">
						<%= baiviet.getNoiDungVi() %>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blviet">
							<strong> Các comment tiêu biểu </strong>
							<div class="row" id="listblviet">
								<% 
									i = 0;
									while(blviet != null && i<blviet.size()){
								%>
								<i class="fa fa-user"></i> <em><%= blviet.get(i).getTaiKhoan().getHoTen() %></em>
								<p><%= blviet.get(i).getPhanHoiVi() %></p>
								<% i++; } %>
							</div>
							<div class="row">
								<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtviet"></textarea>
							</div>
							<div class="row" id="tuychonviet">
								<button type="button" class="btn btn-link" onclick="comentvi('<%= baiviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
								<button type="button" class="btn btn-link" onclick="loadBinhLuan('<%= baiviet.getIdBaiViet() %>', 'vi');"><i class="fa fa-hand-o-right"></i> Xem thêm - 詳細</button>
							</div>
					</div>
				<% } %>
				<%  if(baiviet.getNoiDungJa() != null ) { %>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengnhat">
						<%= baiviet.getNoiDungJa() %>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blnhat">
							<strong> Các comment tiêu biểu </strong>
							<div class="row" id="listblnhat">
								<% 
									i = 0;
									while(blnhat != null && i<blnhat.size()){
								%>
								<i class="fa fa-user"></i> <em><%= blnhat.get(i).getTaiKhoan().getHoTen() %></em>
								<p><%= blnhat.get(i).getPhanHoiJa() %></p>
								<% i++; } %>
							</div>
							<div class="row">
								<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtnhat"></textarea>
							</div>
							<div class="row" id="tuychonnhat">
								<button type="button" class="btn btn-link" onclick="comentja('<%= baiviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
								<button type="button" class="btn btn-link" onclick="loadBinhLuan('<%= baiviet.getIdBaiViet() %>', 'ja');"><i class="fa fa-hand-o-right"></i> Xem thêm - 詳細</button>
							</div>
					</div>
				<% } %>
			<% } %>
		
		</div>
		<!-- danh sách bài viết mới -->
		<div class="col-xs-12 col-sm-12 col-md-12" style="background-color: white;" id="listbaiviet">
		<strong>Danh sách bài viết liên quan</strong>
		<%
			i=0;
			while(list != null && i<list.size()){
		%>
			<div class="row">
				<!-- danh sách các bài viết trong nhóm -->
				<img alt="Ảnh đại diện" src="images/baiviet.jpg" style="width: 20px;">
				<a href="BaiVietServlet?id=<%= list.get(i).getIdBaiViet()%>"> <%= list.get(i).getTenBaiVietVi() %> - <%= list.get(i).getTenBaiVietJa() %></a>
			</div>
		<% 
			i++; } 
		%>
		</div>
	</div>
	<!-- Quảng cáo lung tung -->
	<div class="col-sm-2 col-md-2">
		<% if(user == null) { %>
			<button type="button" data-toggle="modal" data-target="#mdangnhap" class="btn btn-success form-control"><i class="fa fa-newspaper-o"></i> Đăng bài - ポスト</button>
		<% }else{ %>
			<button type="button" onclick="dichuyen('DangBaiVietServlet');" class="btn btn-success form-control"><i class="fa fa-newspaper-o"></i> Đăng bài - ポスト</button>
		<% } %>
		
		<br> Bản đồ - 地図  - Việt Nam<br>
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
					<li><a href="BaiVietServlet?id=<%= top.get(i).getIdBaiViet()%>"><i class="fa fa-thumbs-o-up"></i> <%= top.get(i).getTenBaiVietVi()%> - <%= top.get(i).getTenBaiVietJa()%></a></li>
				<% i++; } %>
			</ul>
		</div>
		<div id="them">
			<%
				SessionCounter counter = (SessionCounter) session.getAttribute("counter");
				request.getRemoteAddr();
			%>
			<strong>
				<i class="fa fa-users"></i> Views - 履歴 : <%= counter.getActiveView()%> <br>
				<i class="fa fa-globe"></i> Online - 直結 : <%= counter.getActiveSessionNumber()%>
			</strong>
		</div>
	</div>
	<div class="clearfix"></div>
</body>
<!-- Script ở đây -->
<!-- Google map -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
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
		map1 = new google.maps.Map(document.getElementById("div_id2"), myOptions1);
		
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
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
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
<!-- Xử lý load lấy bình luận -->
<script type="text/javascript">
	function loadBinhLuan(id, ngonngu) {
		if (ngongnu == "vi") {
			$.ajax({
				url : "DataBinhLuanServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : parseInt($("listblviet").children().size()) / 3
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblviet").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
		} else {
			$.ajax({
				url : "DataBinhLuanServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : parseInt($("listblnhat").children().size()) / 3
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblnhat").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
		}
	}
</script>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
	function comentvi(id) {
		var bien = $("#tkDangNhap").val();
		if (bien == "null") {
			alert("Bạn phải đăng nhập, mới được bình luận.");
		} else {
			var txt = $("#txtviet").val();
			if (txt != "") {
				var htm = "<i class='fa fa-user'></i> <em>" + bien
						+ "</em> <p>" + txt + "</p>";
				$("#listblviet").append(htm);
				$("#txtviet").val("");
				updatedatavi(id, 'vi', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.");
			}
		}
		$("#txtviet").val("");
	};
	function comentja(id) {
		var bien = $("#tkDangNhap").val();
		if (bien == "null") {
			alert("Bạn phải đăng nhập, mới được bình luận.");
		} else {
			var txt = $("#txtnhat").val();
			if (txt != "") {
				var htm = "<i class='fa fa-user'></i> <em>bl-moi</em> <p>"
						+ txt + "</p>";
				$("#listblnhat").append(htm);
				$("#txtnhat").val("");
				updatedatavi(id, 'ja', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.");
			}
		}
		$("#txtnhat").val("");
	};
	function updatedatavi(id, laguage, bluan) {
		$.ajax({
			url : "UpDateDataBinhLuan", //file 
			type : "POST", //phuong thức gưi
			data : {
				idbaiviet : id,
				ngonngu : laguage,
				binhluan : bluan
			}, //dữ liệu gửi
			async : true
		});
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
