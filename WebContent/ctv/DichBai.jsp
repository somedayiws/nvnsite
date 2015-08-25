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
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.0.min.js"></script>
<script src="../js/jquery.lazyload.js"></script>
<title>Dịch bài</title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">
<!-- ck --> 
<script src="../ckeditor/ckeditor.js"></script>

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
	<form action="DichBaiDichServlet" method="post">
		<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
		<!-- ngôn ngữ chính của ctv là tiếng việt -->
		<% if(user.getNgonNgu().equals("vi")) { %>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietVi() %>">
					Mô tả - 概要
					<textarea class="form-control" readonly="readonly" rows="5"><%= bviet.getMoTaVi() %></textarea>
					Nội dung - 内容
					<div id="ndviet">
						<textarea name="NoiDung" readonly="readonly" class="ckeditor"><%= bviet.getNoiDungVi() %></textarea>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" placeholder="Tiêu đề bài dịch" value="<%= bviet.getTenBaiVietJa() == null ? "" :  bviet.getTenBaiVietJa()%>">
					Mô tả - 概要
					<textarea class="form-control" rows="5"><%= bviet.getMoTaJa() == null ? "" : bviet.getMoTaJa() %></textarea>
					Nội dung - 内容
					<div id="ndviet">
						<textarea name="NoiDung" class="ckeditor"><%= bviet.getNoiDungJa() == null ? "" : bviet.getNoiDungJa() %></textarea>
					</div>
				</div>
			</div>
		<% } else { %>
		<!-- ngôn ngữ chính là tiếng nhật -->
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" readonly="readonly" value="<%= bviet.getTenBaiVietJa() %>">
					Mô tả - 概要
					<textarea class="form-control" readonly="readonly" rows="5"><%= bviet.getMoTaJa() %></textarea>
					Nội dung - 内容
					<div id="ndviet">
						<textarea name="NoiDung" readonly="readonly" class="ckeditor"><%= bviet.getNoiDungJa() %></textarea>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="row">
					Tiêu đề - タイトル
					<input type="text" class="form-control" value="<%= bviet.getTenBaiVietVi()==null ? "" : bviet.getTenBaiVietVi()%>">
					Mô tả - 概要
					<textarea class="form-control" rows="5"><%= bviet.getMoTaVi() == null ? "" : bviet.getMoTaVi() %></textarea>
					Nội dung - 内容
					<div id="ndviet">
						<textarea name="NoiDung" class="ckeditor"><%= bviet.getNoiDungVi()==null ? "" : bviet.getNoiDungVi() %></textarea>
					</div>
				</div>
			</div>
		<% } %>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<strong> Phản hồi bài dịch </strong>
			<div class="row" id="listblviet">
				<%= bviet.getGhiChu()==null ? "" : bviet.getGhiChu() %>
			</div>
			<div class="row">
				<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtviet"></textarea>
			</div>
			<button type="button" class="btn btn-link" onclick="comentvi('<%= bviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
			<button type="button" class="btn btn-primary btn-sm" id="lui" name="submit" value="lui" onclick="history.go(-1);">Quay lại</button>
			<button type="submit" class="btn btn-warning btn-sm" id="huy" name="submit" value="huy">Hủy bài</button>
			<button type="submit" class="btn btn-primary btn-sm" id="gui" name="submit" value="gui">Gửi bài</button>
			<button type="submit" class="btn btn-primary btn-sm" id="luu" name="submit" value="luu">Lưu lại</button>
		</div>
	</form>
	</div>
</body>
</html>