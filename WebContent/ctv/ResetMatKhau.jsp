<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.0.min.js"></script>
<script src="../js/jquery.lazyload.js"></script>
<title>Reset Mật Khẩu - パスワードのリセット </title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">
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
		<marquee>Trang cộng tác viên VIET-NHAT - 協力者専用の日越ホームページ</marquee>
	</p>
</div>
	<!-- nội dung chính -->
	<div class="manhinh">
		<img alt="Cộng tác viên Việt - Nhât" src="../images/logoctv.jpg">
		<form class="panel-login" action="Reset-mat-khau" method="post" id="freset">
			<i class="fa fa-pinterest-p fa-2x"></i>
			<label>Thông tin tài khoản - アカウントの情報 </label>
			<%= request.getAttribute("meg")==null ? "<div class='alert alert-info' role='alert'><p>Hãy nhập tài khoản cộng tác viên của bạn bên dưới và click vào button \"Lấy mật khẩu - ログイン\". Kiểm tra lại email của bạn đã đăng ký với chúng tôi để lấy lại mật khẩu. Cám ơn!<br>以下のボタンをクリックし、協力者のアカウントを入力してください。パスワードを収得し、ログイン\"。パスワードを収得するため、申請されたメールを改めて確認して下さい。ありがとう。</p></div>" : request.getAttribute("meg") %>
			<div class="row">
				<label><i class="fa fa-user"></i> Tài khoản - アカウント </label>
				<input type="text" name="taikhoan" placeholder="Tài khoản cộng tác viên - 協力者のアカウント" class="form-control">
			</div>
			<div class="row">
				<button type="reset" class="btn btn-warning btn-sm" id="huy"><i class="fa fa-eraser"></i> Reset - リセット</button>
				<button type="submit" name="submit" value="congtacvien" class="btn btn-primary btn-sm" id="gui"><i class="fa fa-sign-in"></i> Lấy mật khẩu - ログイン</button>
			</div>
		</form>
	</div>
</body>
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#freset").validate( {
			rules : {
				taikhoan : {
					required : true
				}
			},
			messages : {
				taikhoan : {
					required : "<br>Chưa nhập tài khoản cần reset<br>ユーザー名をまだ入力しない"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>