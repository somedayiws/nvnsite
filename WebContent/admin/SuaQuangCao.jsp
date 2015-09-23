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
<title>Cập nhật quảng cáo</title>
<script type="text/javascript">
	function view() {
		var page = $('#url').val();
		$("#xemUrl").attr('src', page);
	}
	function xem(f) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.getElementById("fu2");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
	$(document)
			.ready(
					function() {
						$("#page").change(function() {
							var page = $('#page').val();
							if (page == 1) {
								$("#advHomepage").show();
								$("#advNoHomepage").hide();
							} else {
								$("#advHomepage").hide();
								$("#advNoHomepage").show();
							}
						});

						$("#ChonUrl").change(function() {
							var page = $('#ChonUrl').val();
							if (page == 1) {
								$("#maytinh").show();
								$("#trenmang").hide();
							} else {
								$("#maytinh").hide();
								$("#trenmang").show();
							}
						});
						$("#formCreateAdv")
								.validate(
										{
											rules : {
												company : {
													required : true,
												},
												dienthoai : {
													required : true,
												},
												email : {
													required : true,
												},
												link : {
													required : true,
													url : true
												},
												page : {
													required : true,
												},
												positionInHome : {
													required : true,
												},
												positionInNoHome : {
													required : true,
												},
												date : {
													required : true,
													date : true
												},
												numberOfDay : {
													required : true,
													range : [ 1, 100 ]
												},
												price : {
													required : true,
												}
											},
											messages : {
												company : {
													required : "Phải nhập tên đơn vị quảng cáo - 会社の広告を入力してください",
												},
												dienthoai : {
													required : "Phải nhập số điện thoại liên hệ - 会社の広告を入力してください",
												},
												email : {
													required : "Phải nhập email liên hệ - 会社の広告を入力してください",
												},
												link : {
													required : "Phải nhập link quảng cáo - リンク広告を入力してください",
													url : "Link không hợp lệ - リンク無効"
												},
												page : {
													required : "Phải chọn trang hiển thị - 選択ページの表示",
												},
												positionInHome : {
													required : "Phải chọn vị trí hiển thị trên trang chủ - ホームページでの選択位置表示",
												},
												positionInNoHome : {
													required : "Phải chọn vị trí hiển thị trên các trang khác - 別のページで選択位置表示",
												},
												date : {
													required : "Phải nhập ngày đăng - 日付を入力します",
													date : "Ngày không hợp lệ - 無効な日付"
												},
												numberOfDay : {
													required : "Phải nhập số ngày hiển thị - 日付の数を入力します",
													range : "Số ngày trong khoảng từ 1 đến 100 - 1から100までの値を入力してください。"
												},
												price : {
													required : "Phải nhập giá quảng cáo - 価格広告を入力してください",
												}
											}
										});
					});
</script>
</head>
<%
	//Quảng cáo cần chỉnh sửa
	QUANGCAO qc = (QUANGCAO) request.getAttribute("quangcao");
%>
<body>

	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<form name="formCreateAdv" id="formCreateAdv"
			action="editAdvertisementServlet" method="post"
			enctype="multipart/form-data">
			<div class="khungquangcao">
				<div class="khungTrai">
					<input type="hidden" name="idQC" value="<%=qc.getIdQuangCao()%>">
					<!-- Đơn vị quảng cáo -->
					<div class="form-group">
						<label for="company">Đơn vị/cá nhân quảng cáo - 企業広告</label> <input
							type="text" class="form-control" name="company" id="company"
							maxlength="200" value="<%=qc.getDonViQuangCao()%>">
					</div>
					<div class="form-group">
						<label for="company">Điện thoại liên hệ - 企業広告</label> <input
							type="text" class="form-control" name="dienthoai" id="dienthoai"
							maxlength="200" value="<%=qc.getDienThoai()%>">
					</div>
					<div class="form-group">
						<label for="company">Email đơn vị/cá nhân - 企業広告</label> <input
							type="text" class="form-control" name="email" id="email"
							maxlength="200" value="<%=qc.getEmail()%>">
					</div>
					<!-- Liên kết -->
					<div class="form-group">
						<label for="link">Link quảng cáo - リンク</label> <input type="url"
							class="form-control" name="link" id="link"
							value="<%=qc.getLienKet()%>">
					</div>
					<!-- Trang hiển thị -->
					<div class="form-group">
						<label for="page">Trang hiển thị - ページショー</label> <select
							class="form-control" id="page" name="page">
							<%
								if (qc.getTrangHienThi() == 1) {
							%>
							<option value="1" selected="selected">Trang chủ - ホームページ</option>
							<option value="2">Trang khác - 別のページ</option>
							<%
								} else {
							%>
							<option value="1">Trang chủ - ホームページ</option>
							<option value="2" selected="selected">Trang khác - 別のページ</option>
							<%
								}
							%>
						</select>
					</div>
					<!-- Nếu là trang chủ thì có 7 vị trí, ngược lại là có 2 vị trí -->

					<!-- Vị trí -->
					<!-- Vị trí trang chủ  -->
					<div class="form-group" id="advHomepage" <%= qc.getTrangHienThi() == 1 ? "" : "style='display: none;'" %>>
						<label for="postion">Vị trí - 位置</label> <select
							class="form-control" id="positionInHome" name="positionInHome">
							<option value="1"
								<%=qc.getViTri() == 1 ? "selected='selected'" : ""%>>vị
								trí 1</option>
							<option value="2"
								<%=qc.getViTri() == 2 ? "selected='selected'" : ""%>>vị
								trí 2</option>
							<option value="3"
								<%=qc.getViTri() == 3 ? "selected='selected'" : ""%>>vị
								trí 3</option>
							<option value="4"
								<%=qc.getViTri() == 4 ? "selected='selected'" : ""%>>vị
								trí 4</option>
							<option value="5"
								<%=qc.getViTri() == 5 ? "selected='selected'" : ""%>>vị
								trí 5</option>
							<option value="6"
								<%=qc.getViTri() == 6 ? "selected='selected'" : ""%>>vị
								trí 6</option>
						</select>
					</div>
					<!-- Vị trí các trang khác -->
					<div class="form-group" id="advNoHomepage" <%= qc.getTrangHienThi() == 1 ? "style='display: none;'" : "" %>>
						<label for="postion">Vị trí - 位置</label>
						<select class="form-control" id="positionInNoHome" name="positionInNoHome" disabled="disabled">
							<option value="1"
								<%=qc.getViTri() == 1 ? "selected='selected'" : ""%>>vị
								trí 1</option>
							<option value="2"
								<%=qc.getViTri() == 2 ? "selected='selected'" : ""%>>vị
								trí 2</option>
						</select>
					</div>
				</div>
				<div class="khungphai">
					<!-- Số ngày -->
					<div class="form-group">
						<label>Số ngày hiển thị - 一日数</label> <select class="form-control"
							id="size" name="numberOfDay">
							<option value="7"
								<%=qc.getSoNgay() == 7 ? "selected='selected'" : ""%>>7
								ngày (1 tuần)</option>
							<option value="30"
								<%=qc.getSoNgay() == 30 ? "selected='selected'" : ""%>>
								30 ngày (1 tháng)</option>
							<option value="90"
								<%=qc.getSoNgay() == 90 ? "selected='selected'" : ""%>>
								90 ngày (3 tháng)</option>
							<option value="180"
								<%=qc.getSoNgay() == 180 ? "selected='selected'" : ""%>>
								180 ngày (6 tháng)</option>
							<option value="365"
								<%=qc.getSoNgay() == 365 ? "selected='selected'" : ""%>>
								365 ngày (1 năm)</option>
						</select>
					</div>
					<!-- Giá quảng cáo -->
					<div class="form-group">
						<label for="price">Chi phí quảng cáo - 価格</label> <input
							type="text" name="price" class="form-control" id="price"
							value="<%=qc.getGiaQuangCao()%>">
					</div>
					<!-- Kích thước -->
					<div class="form-group">
						<label for="size">Nhập hình ảnh từ - サイズ</label> <select
							class="form-control" id="ChonUrl" name="ChonUrl">
							<option value="1">Máy tính</option>
							<option value="2">Url có sẵn</option>
						</select>
					</div>
					<!-- Hình ảnh -->
					<div class="form-group" id="maytinh">
						<label>Ảnh quảng cáo <input type="file" id="Image"
							name="Image" onchange="xem(this);" /></label> <input type="hidden"
							name="Imagee" value="<%=qc.getHinhAnh()%>">
						<p class="help-block">
							Chọn file .png, .jpg ...<br> <img alt="Icon đại diện"
								src="<%=qc.getHinhAnh().substring(0, 5).equals("image") ? "../"
					+ qc.getHinhAnh() : qc.getHinhAnh()%>"
								id="fu2" height="150px">
						</p>
					</div>
					<div class="form-group" id="trenmang" style="display: none;">
						<label>Ảnh quảng cáo</label> <input type="text" name="Image1"
							id="url" class="form-control" onblur="view();"
							value="<%=qc.getHinhAnh()%>">
						<p class="help-block">
							Chọn file .png, .jpg ...<br> <img alt="Icon đại diện"
								src="<%=qc.getHinhAnh().substring(0, 5).equals("image") ? "../"
					+ qc.getHinhAnh() : qc.getHinhAnh()%>"
								id="xemUrl" height="150px">
						</p>
					</div>
					<button class="btn btn-primary btn-sm" type="submit" id="createAdv"
						name="createAdv">Cập nhật - 広告を作成</button>
					<button class="btn btn-primary btn-sm" onclick="history.go(-1);">Hủy
						- 広告を作成</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>