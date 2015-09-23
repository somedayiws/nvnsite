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
<title> Quản lý tài nguyên </title>
<script type="text/javascript">
	function xem(f){
		$("#capnhat").removeAttr('disabled');
		var reader = new FileReader();
		reader.onload = function(e){
			var img = document.getElementById("fu2");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
	function xem1(f){
		$("#capnhat").removeAttr('disabled');
		var reader = new FileReader();
		reader.onload = function(e){
			var img = document.getElementById("fu22");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
</script>
</head>
<body>

	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<form name="formCreateAdv" id="formCreateAdv" action="CapNhatTaiNguyenServlet" method="post" enctype="multipart/form-data">
					<!-- Hình ảnh giá dịch vụ dịch thuật -->
					<div class="form-group" id="maytinh">
						<label> Biểu giá dịch thuật song ngữ Việt-Nhật</label>
						<input type="file" id="Image" name="Image" onchange="xem(this);" />
						<input type="hidden" name="Imagee" value="../images/Capture.PNG">
						<p class="help-block">
							Chọn file .png, .jpg ...
							<br><img alt="Icon đại diện" src="../images/Capture.PNG" id="fu2">
						</p>
					</div>
					<!-- Hình ảnh giá dịch vụ quảng cáo -->
					<div class="form-group" id="maytinh">
						<label> Biểu giá dịch vụ quảng cáo</label>
						<input type="file" id="Image1" name="Image1" onchange="xem1(this);" />
						<input type="hidden" name="Imagee1" value="../images/Capture.PNG">
						<p class="help-block">
							Chọn file .png, .jpg ...
							<br><img alt="Icon đại diện" src="../images/Capture.PNG" id="fu22">
						</p>
					</div>
					<button class="btn btn-primary btn-sm" type="submit" id="capnhat" disabled="disabled">Cập nhật - 広告を作成</button>
		</form>
	</div>
</body>
</html>