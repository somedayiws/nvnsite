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
<title>Trang chủ</title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">

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
		<marquee> Trang cộng tác viên VIET-NHAT</marquee>
	</p>
</div>
	<!-- nội dung chính -->
	<div class="manhinh">
		<img alt="Cộng tác viên Việt - Nhât" src="../images/logoctv.jpg">
		<form class="panel-login" action="CTVDangNhapServlet" method="post" id="fdangnhap">
			<i class="fa fa-pinterest-p fa-2x"></i>
			<label>Đăng Nhập Tài Khoản</label>
			<div class="row">
				<p class="loi"><%= (String)request.getAttribute("meg") %></p>
			</div>
			<div class="row">
				<label><i class="fa fa-user"></i> Tài khoản - アカウント </label>
				<input type="text" name="taikhoan" placeholder="Tên đăng nhập" class="form-control">
			</div>
			<div class="row">
				<label><i class="fa fa-key"></i> Mật khẩu - パスワード</label>
				<input type="password" name="matkhau" placeholder="Mật khẩu" class="form-control">
			</div>
			<div class="row">
				<i class="fa fa-frown-o"></i> <a href="#"> Quên mật khẩu !!!</a>
			</div>
			<div class="row">
				<button type="reset" class="btn btn-warning btn-sm" id="huy"><i class="fa fa-eraser"></i> Reset - </button>
				<button type="submit" name="submit" value="congtacvien" class="btn btn-primary btn-sm" id="gui"><i class="fa fa-sign-in"></i> Đăng nhập - ログイン</button>
			</div>
		</form>
	</div>
</body>
</html>