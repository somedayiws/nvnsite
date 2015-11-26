<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.0.min.js"></script>
<script src="../js/jquery.lazyload.js"></script>
<title>Trang cá nhân - 個人のホームページ</title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">
<!-- load thống kê -->
<script src="js/JavaScrip.js"></script>
<!-- kết thúc -->
<style type="text/css">
label.error {
	color: #FF0000 !important;
	font-size: 13px !important;
}

input.error {
	border: 2px solid #FF0000;
	color: #0000FF;
	border-style: ridge;
}
</style>
</head>
<body>
<div class="container">
	<p>
		<marquee> Trang cộng tác viên VIET-NHAT - 協力者専用の日越ホームページ</marquee>
	</p>
</div>
	<!-- menu ngang -->
	<%@include file="files/menu.jsp" %>
	<!-- dữ liệu -->
	<% 
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
	%>
	<!-- nội dung chính -->
	<div class="col-sm-2 col-md-2">
		<%@include file="files/thongke.jsp" %>
		
		<div class="xem">Tiến độ-進捗状況 : <%= request.getAttribute("tongbvok") %>%</div>
		<div class="xem1">Hủy bỏ-削除 : <%= request.getAttribute("tongbvhuy") %>%</div>
		<div class="xem2">Bài lỗi-エラーの記事 : <%= request.getAttribute("tongbvloi") %></div>
		
	</div>
	<div class="col-sm-10 col-md-10">
	<form action="Cap-nhat-tai-khoan" method="post" id="fcapnhat">
		<%= (String)request.getAttribute("meg") %>
		Tài khoản - アカウント
		<input type="text" name="taikhoan" readonly="readonly" class="form-control" value="<%= user.getTenTaiKhoan() %>">
		Họ tên - 氏名
		<input type="text" name="hoten" class="form-control" value="<%= user.getHoTen() %>">
		Điện thoại - 電話番号
		<input type="text" name="dienthoai" class="form-control" value="<%= user.getDienThoai() %>">
		Địa chỉ - 住所
		<input type="text" name="diachi" class="form-control" value="<%= user.getDiaChi() %>">
		Email - メール
		<input type="text" name="email" class="form-control" value="<%= user.getEmail() %>">
		Mật khẩu mới - 新しいパスワード
		<input type="password" name="matkhau" class="form-control" value="<%= user.getMatKhau() %>">
		<button type="submit" class="btn btn-primary btn-sm" id="gui">Cập nhật - アップデート</button>
	</form>
	</div>
</body>
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fcapnhat").validate({		
			rules : {
				hoten : {
					required : true
				},
				matkhau : {
					required : true
				},
				email : {
					required : true
				}
			},
			messages : {
				hoten : {
					required : "<br>Không được để trống trường này!<br>アカウントをすべて書き込んでください。"
				},
				matkhau : {
					required : "<br>Không được để trống trường này!<br>アカウントをすべて書き込んでください。"
				},
				email : {
					required : "<br>Không được để trống trường này!<br>アカウントをすべて書き込んでください。"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
<!-- kết thúc -->
</html>