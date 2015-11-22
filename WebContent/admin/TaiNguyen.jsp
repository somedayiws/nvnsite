<%@page import="model.bean.QUANGCAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/advertisement.css">
<!-- ck -->
<script src="../ckeditor/ckeditor.js"></script>
<title>Quản lý chung - 全体に管理する</title>
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
													required : "Phải nhập số từ trên 1 trang - 1ページ以上から数字を入力して下さい",
													range : "Số từ trên trang phải trong khoảng từ 1 đến 100000 - 1ページに100000までに入力しなければならない。"
												},
												ThanhTienVN : {
													required : "Phải nhập đơn giá tính cho trang - ページに単価を入力しなければならない",
													range : "Đơn giá trong khoảng từ 1 đến 10000000 - 単価は約1 から 10000000までです。"
												},
												ThanhTienJA : {
													required : "Phải nhập đơn giá tính cho trang - ページに単価を入力しなければならない",
													range : "Đơn giá trong khoảng từ 1 đến 10000000 - 単価は約1 から 10000000までです。"
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
			<!-- Chữ chạy -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Thông điệp từ diễn đàn - </label> 
				<br>Nội dung - 内容: 
				<input class="form-control" onchange="capnhatlai();"
					value="<%=(String) request.getAttribute("ThongDiep") == null || ((String) request.getAttribute("ThongDiep")).trim().equals("") ? "" : (String) request.getAttribute("ThongDiep") %>"
					type="text" id="ThongDiep" name="ThongDiep" />
			</div>
			<!-- Giới thiệu diễn đàn -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Giới thiệu diễn đàn - </label> 
				<textarea id="txtGioiThieu" name="txtGioiThieu" class="ckeditor" onchange="capnhatlai();">
					<%=(String) request.getAttribute("GioiThieu") == null || ((String) request.getAttribute("GioiThieu")).trim().equals("") ? "" : (String) request.getAttribute("GioiThieu") %>
				</textarea>
			</div>
			<!-- Nội quy diễn đàn -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Nội quy diễn đàn - </label> 
				<textarea id="txtNoiQuy" name="txtNoiQuy" class="ckeditor" onchange="capnhatlai();">
					<%=(String) request.getAttribute("NoiQuy") == null || ((String) request.getAttribute("NoiQuy")).trim().equals("") ? "" : (String) request.getAttribute("NoiQuy") %>
				</textarea>
			</div>
			<!-- Thông tin liên hệ -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Giới thiệu - 自己紹介</label> 
				<br> Liên hệ - 連絡先の情報: 
				<input class="form-control" onchange="capnhatlai();"
					value="<%=(String) request.getAttribute("LienHe")==null||((String) request.getAttribute("LienHe")).trim().equals("")?"":(String) request.getAttribute("LienHe")%>"
					type="text" id="LienHe" name="LienHe" />
				<br> Điện thoại - 電話番号: 
				<input class="form-control" onchange="capnhatlai();"
					value="<%=((String) request.getAttribute("DienThoai") == null || ((String) request.getAttribute("DienThoai")).trim().equals("") )? "" : (String) request.getAttribute("DienThoai")%>"
					type="text" id="DienThoai" name="DienThoai" />
				<br> Email : 
				<input class="form-control" onchange="capnhatlai();"
					value="<%=(String) request.getAttribute("Email") == null || ((String) request.getAttribute("Email")).trim().equals("") ? "" : (String) request.getAttribute("Email")%>"
					type="text" id="Email" name="Email" />
			</div>
			<!-- Hình ảnh giá dịch vụ dịch thuật -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Biểu giá dịch thuật song ngữ Việt-Nhật - ベトナム語-日本語の翻訳価格表</label> <br> Số
				từ trên 1 trang - 1ページ以上 : <input class="form-control"
					onchange="capnhatlai();"
					value="<%=(String) request.getAttribute("sotu")%>" type="text"
					id="SoTuDich" name="SoTuDich" /> <br> Đơn giá dịch(VND) - 翻訳の単価（ベトナムドン） : <input
					class="form-control" onchange="capnhatlai();"
					value="<%=request.getAttribute("giaVN")%>" type="text"
					id="ThanhTienVN" name="ThanhTienVN" /> <br> Đơn giá dịch(JPY) - 翻訳の単価（日本円）
				: <input class="form-control" onchange="capnhatlai();"
					value="<%=request.getAttribute("giaJA")%>" type="text"
					id="ThanhTienVN" name="ThanhTienJA" /> <br> Bảng giá khuyến mãi - キャンペーンの価格
				: <input type="file" id="Image" name="Image" onchange="xem(this);" />
				<input type="hidden" name="Imagee"
					value="<%=request.getAttribute("banggiadich")%>">
				<p class="help-block">
					Chọn tập tin có đuôi là .png, .jpg, .gif, .jpeg <br> ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。
					<img alt="Icon đại diện"
						src="../<%=request.getAttribute("banggiadich")%>" id="fu2">
				</p>

			</div>
			<!-- Hình ảnh giá dịch vụ quảng cáo -->
			<div class="form-group" id="banggia">
				<label class="nhan1"> Biểu giá dịch vụ quảng cáo - 広告の価格のリスト</label> <input type="file"
					id="Image1" name="Image1" onchange="xem1(this);" /> <input
					type="hidden" name="Imagee1"
					value="<%=request.getAttribute("banggiaqc")%>">
				<p class="help-block">
					Chọn tập tin có đuôi là .png, .jpg, .gif, .jpeg <br> ファイルの形式は.png, .jpg, .gif, .jpeg - を選択して下さい。 
					<img alt="Icon đại diện - 表示のアイコン"
						src="../<%=request.getAttribute("banggiaqc")%>" id="fu22">
				</p>
			</div>
			<button class="btn btn-primary btn-sm" type="submit" id="capnhat"
				>Cập nhật - アップデート</button>
		</form>
	</div>
</body>
</html>