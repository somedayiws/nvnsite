<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.0.min.js"></script>
<script src="../js/jquery.lazyload.js"></script>
<title>Xem bài dịch</title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x){
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x){
		window.location.href = x;
	};
	function comentvi(id){
		var txt = $("#txtviet").val();
		if(txt != ""){
			var htm = "<strong>Tôi</strong> <p>"+txt+"</p>";
			$("#listblviet").append(htm);
			$("#txtviet").val("");
			updatedatavi(id, htm);
		}else{
			alert("Bạn chưa nhập bình luận của mình.");
		}
		$("#txtviet").val("");
	};
	function updatedatavi(id, bluan){
		$.ajax({
			url : "UpDatePhanHoiServlet", //file 
			type : "POST", //phuong thức gưi
			data : {
				id: id,
				bluan: bluan
			}, //dữ liệu gửi
			async : true
		});
	};
</script>
<!-- Kết thúc -->
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#fdangnhap")
								.validate(
										{
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
<!-- kết thúc -->
<!-- load thống kê -->
<script src="js/JavaScrip.js"></script>
<!-- kết thúc -->
</head>
<body>
<div class="container">
	<p>
		<marquee> Trang cộng tác viên VIET-NHAT</marquee>
	</p>
</div>
	<!-- menu ngang -->
	<%@include file="files/menu.jsp" %>
	<!-- dữ liệu -->
	<% 
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		BAIVIET bviet = (BAIVIET)request.getAttribute("baiviet");
	%>
	<!-- nội dung chính -->
	<div class="col-sm-2 col-md-2">
		<%@include file="files/thongke.jsp" %>
		<strong id="tke"><i class="fa fa-info-circle"></i> Thông tin</strong><br>
		<div class="info">
			<label>Mã bài viết : <%= bviet.getIdBaiViet() %></label><br>
			<label>Tình trạng : <%= request.getAttribute("TinhTrang") %></label><br>
			<label>Ngày gửi : <%= request.getAttribute("NgayGui") %></label>
		</div>
	</div>
	<div class="col-sm-10 col-md-10">
		<!-- ngôn ngữ chính của ctv là tiếng việt -->
		<% if(user.getNgonNgu().equals("Viet")) { %>
			<% if(bviet.getTrangThai().equals("ChuyenDich")) { %>
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietVi() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaVi() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</div>
				</div>
			</div>
			<% } else { %>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietVi() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaVi() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietJa() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaJa() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</div>
				</div>
			</div>
			<% } %>
		<% } else { %>
		<!-- ngôn ngữ chính là tiếng nhật -->
			<% if(bviet.getTrangThai().equals("ChuyenDich")) { %>
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietJa() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaJa() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</div>
				</div>
			</div>
			<% } else { %>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietJa() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaJa() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietVi() %>">
					Mô tả - 概要
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getMoTaVi() %>">
					Nội dung - 内容
					<div class="form-control" id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</div>
				</div>
			</div>
			<% } %>
		<% } %>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<strong> Phản hồi bài dịch </strong>
			<div class="row" id="listblviet">
				<%= bviet.getGhiChu()==null ? "" : bviet.getGhiChu() %>
			</div>
			<div class="row">
				<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtviet"></textarea>
			</div>
			<div class="row" id="tuychonviet">
				<button type="button" class="btn btn-link" onclick="comentvi('<%= bviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
				<form action="XuLyBaiVietServlet" method="post">
					<input type="hidden" name="chon" value="<%= bviet.getIdBaiViet() %>">
					<button type="button" class="btn btn-primary btn-sm" id="lui" name="submit" value="lui" onclick="history.go(-1);">Quay lại</button>
					<button type="submit" name="submit" class="btn btn-warning btn-sm" id="huy" value="huy">Hủy bài - </button>
					<button type="submit" name="submit" class="btn btn-primary btn-sm" id="gui" value="gui">Gửi bài - </button>
					<button type="button" class="btn btn-primary btn-sm" id="luu" onclick="loadData('DichBaiDichServlet','<%= bviet.getIdBaiViet() %>');">Dịch bài - </button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>