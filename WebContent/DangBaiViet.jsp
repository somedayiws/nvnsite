<%@page import="java.util.Date"%>
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
<title>Đăng bài viết</title>
<!--auto combobox -->
<script src="js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/magicsuggest-min.css">
<!-- ck -->
<script src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css">

</head>
<body onLoad="initialize()">
	<!-- form tìm kiếm -->
	<form id="seach" class="navbar-form navbar-right" role="search" action="TimKiemServlet" method="post">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Tìm kiếm - Nhật ngữ" name="txtFind">
		</div>
		<button type="submit" class="btn btn-default">Search</button>
	</form>
	<!-- logo đại diện -->
	<a href="TrangChuServlet">
		<img id="logo" alt="Logo" src="images/trangchu/logo-vietnhat24h.png">
	</a>
	<!-- Lấy dữ liệu từ server gửi về -->
	<% 
		/* Top 50 danh muc được phép hiển thị */
		ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>)request.getAttribute("listdanhmuc");
		/* Lấy sesion người dùng */
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		/* Top 10 bài viết */
		ArrayList<BAIVIET> top = (ArrayList<BAIVIET>)request.getAttribute("topbaiviet");
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
		<% } %>
	</div>
	</div>
	</nav>
		<!-- Quảng cáo lung tung -->
		<div class="col-sm-1 col-md-1"></div>
		<!-- hiển thị nội dung chính ở đây -->
		<div class="col-sm-8 col-md-8" id="baiviet">
		<form action="DangBaiVietServlet" method="post" enctype="multipart/form-data">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="form-group">
				<label>Ngôn ngữ soạn thảo - 言語</label>
				<select id="NgonNgu" name="NgonNgu" class="form-control" onchange="hienan();">
					<option value="0"> Tiếng Việt -  </option>
					<option value="1"> Tiếng Nhật -  </option>
					<option value="2"> Song ngữ -  </option>
				</select>
			</div>
			<div class="donngu">
				<div class="form-group">
					<label>Tiêu đề - タイトル</label>
					<input id="TieuDe" name="TieuDe" type="text" class="form-control" onblur="check();"></input>
				</div>
				<div class="form-group">
					<label>Mô tả - 概要</label>
					<textarea id="MoTa" name="MoTa" rows="5" cols="30" class="form-control"></textarea>
				</div>
			</div>
			<div class="dangu">
				<div class="col-sm-6 col-md-6 tviet">
					<div class="form-group">
						<label>Tiêu đề</label>
						<input id="TieuDeVi" name="TieuDeVi" type="text" class="form-control" onblur="check();"></input>
					</div>
					<div class="form-group">
						<label>Mô tả</label>
						<textarea id="MoTaVi" name="MoTaVi" rows="5" cols="30" class="form-control"></textarea>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 tnhat">
					<div class="form-group">
						<label>タイトル</label>
						<input id="TieuDeJa" name="TieuDeJa" type="text" class="form-control" onblur="check();"></input>
					</div>
					<div class="form-group">
						<label>概要</label>
						<textarea id="MoTaJa" name="MoTaJa" rows="5" cols="30" class="form-control"></textarea>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>Thể loại - カテゴリ</label>
				<select id="TheLoai" name="TheLoai" class="form-control">
				<%
					i = 0;
					while(listdanhmuc != null && i < listdanhmuc.size()) {
				%>
					<option value="<%= listdanhmuc.get(i).getIdDanhMuc() %>"><%= listdanhmuc.get(i).getTenDanhMucVi() %> - <%= listdanhmuc.get(i).getTenDanhMucJa() %></option>
				<% i++; } %>
				</select>
			</div>
			<div class="donngu">
				<div class="form-group">
					<label>Nội dung - 内容</label>
					<textarea id="NoiDung" name="NoiDung" class="ckeditor"></textarea>
				</div>
			</div>
			<div class="dangu">
			<div class="col-sm-6 col-md-6 tviet">
				<div class="form-group">
					<label>Nội dung</label>
					<textarea id="NoiDungVi" name="NoiDungVi" class="ckeditor"></textarea>
				</div>
			</div>
			<div class="col-sm-6 col-md-6 tnhat">
				<div class="form-group">
					<label>内容</label>
					<textarea id="NoiDungJa" name="NoiDungJa" class="ckeditor"></textarea>
				</div>
			</div>
			</div>
			<div class="col-sm-12 col-md-12">
			<div class="form-group">
				<label>Hình ảnh - イメージ</label> <input type="file" id="HinhAnh" name="HinhAnh" />
				<p class="help-block">Chọn file .png, .jpg ...</p>
			</div>
			<div class="form-group">
				<input type="submit" value="Đăng bài - " name="dangbai" class="btn btn-success" />
				<input type="button" value="Quay lại - " class="btn" onclick="history.go(-1);"/>
			</div>
			</div>
		</form>
		</div>
		<!-- Quảng cáo lung tung -->
		<div class="col-sm-2 col-md-2">
			<button type="button" class="btn btn-success form-control"><i class="fa fa-hourglass-half fa-spin"></i> <%= (new Date()).toLocaleString() %></button>
			<br> Bản đồ - 写像  - Việt Nam<br>
			<div id="div_id1" style="height: 250px; width: 100%"></div>
			<br> Bản đồ - 写像 - JaPan <br>
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
	<br>	
</body>
<!-- Script ở đây -->
<!-- Google map -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
<script type="text/javascript">
	var map;
	var map1;
	function initialize() {
		$('.dangu').hide();
		$('.donngu').show();
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
<!-- Hiện ẩn tùy chọn -->
<script type="text/javascript">
	function hienan(){
		var giatri = $('#NgonNgu').val();
		if(giatri == "2"){
			$('.donngu').hide();
			$('.dangu').show();
		}else{
			$('.dangu').hide();
			$('.donngu').show();
		}
	}
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