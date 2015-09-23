<%@page import="model.bean.QUANGCAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/advertisement.css">
<title>Quản lý tài nguyên</title>
<script type="text/javascript">
	function capnhatlai() {
		$("#capnhat").removeAttr('disabled');
	}
	function xem(f) {
		$("#capnhat").removeAttr('disabled');
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.getElementById("fu2");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
	function xem1(f) {
		$("#capnhat").removeAttr('disabled');
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.getElementById("fu22");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
	$(document)
			.ready(
					function() {
						$("#formCreateAdv111")
								.validate(
										{
											rules : {
												SoTuDich : {
													required : true,
													range : [ 100, 100000 ]
												},
												ThanhTienVN : {
													required : true,
													range : [ 1, 10000000 ]
												},
												ThanhTienJA : {
													required : true,
													range : [ 1, 10000000 ]
												}
											},
											messages : {
												SoTuDich : {
													required : "Phải nhập số từ trên 1 trang - 1からページ番号を入力するには",
													range : "Số từ trên trang phải trong khoảng từ 1 đến 100000 - ページ上の単語の数は、1〜100000の間であるべきです"
												},
												ThanhTienVN : {
													required : "Phải nhập đơn giá tính cho trang - ページに対して計算単価を入力する必要があります",
													range : "Đơn giá trong khoảng từ 1 đến 10000000 - 千万〜1の範囲の単価"
												},
												ThanhTienJA : {
													required : "Phải nhập đơn giá tính cho trang - ページに対して計算単価を入力する必要があります",
													range : "Đơn giá trong khoảng từ 1 đến 10000000 - 千万〜1の範囲の単価"
												}
											}
										});
					});
</script>
</head>
<body>

	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<form name="formCreateAdv" id="formCreateAdv111"
			action="CapNhatTaiNguyenServlet" method="post"
			enctype="multipart/form-data">
			<!-- Hình ảnh giá dịch vụ dịch thuật -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Biểu giá dịch thuật song ngữ Việt-Nhật</label> <br> Số
				từ trên 1 trang : <input class="form-control"
					onchange="capnhatlai();"
					value="<%=(String) request.getAttribute("sotu")%>" type="text"
					id="SoTuDich" name="SoTuDich" /> <br> Đơn giá dịch(VND) : <input
					class="form-control" onchange="capnhatlai();"
					value="<%=request.getAttribute("giaVN")%>" type="text"
					id="ThanhTienVN" name="ThanhTienVN" /> <br> Đơn giá dịch(JPY)
				: <input class="form-control" onchange="capnhatlai();"
					value="<%=request.getAttribute("giaJA")%>" type="text"
					id="ThanhTienVN" name="ThanhTienJA" /> <br> Bảng giá quảng bá
				: <input type="file" id="Image" name="Image" onchange="xem(this);" />
				<input type="hidden" name="Imagee"
					value="<%=request.getAttribute("banggiadich")%>">
				<p class="help-block">
					Chọn file .png, .jpg ... <br> <img alt="Icon đại diện"
						src="../<%=request.getAttribute("banggiadich")%>" id="fu2">
				</p>

			</div>
			<!-- Hình ảnh giá dịch vụ quảng cáo -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Biểu giá dịch vụ quảng cáo</label> <input type="file"
					id="Image1" name="Image1" onchange="xem1(this);" /> <input
					type="hidden" name="Imagee1"
					value="<%=request.getAttribute("banggiaqc")%>">
				<p class="help-block">
					Chọn file .png, .jpg ... <br> <img alt="Icon đại diện"
						src="../<%=request.getAttribute("banggiaqc")%>" id="fu22">
				</p>
			</div>
			<button class="btn btn-primary btn-sm" type="submit" id="capnhat"
				disabled="disabled">Cập nhật - 広告を作成</button>
		</form>
	</div>
</body>
</html>