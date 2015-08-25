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
<script type="text/javascript" src="../check_validate/checkValidate.js"></script>
<link rel="stylesheet"
	href="../admin/css/register.css">



<title>Login - Admin</title>
<style type="text/css">
	.cl-effect-1 a::before,
.cl-effect-1 a::after {
	display: inline-block;
	opacity: 0;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.2s;
	-moz-transition: -moz-transform 0.3s, opacity 0.2s;
	transition: transform 0.3s, opacity 0.2s;
}

.cl-effect-1 a::before {
	margin-right: 10px;
	content: '[';
	-webkit-transform: translateX(20px);
	-moz-transform: translateX(20px);
	transform: translateX(20px);
}

.cl-effect-1 a::after {
	margin-left: 10px;
	content: ']';
	-webkit-transform: translateX(-20px);
	-moz-transform: translateX(-20px);
	transform: translateX(-20px);
}

.cl-effect-1 a:hover::before,
.cl-effect-1 a:hover::after,
.cl-effect-1 a:focus::before,
.cl-effect-1 a:focus::after {
	opacity: 1;
	-webkit-transform: translateX(0px);
	-moz-transform: translateX(0px);
	transform: translateX(0px);
}
</style>
</head>

<script>
	$(document).ready(function() {

		$("#panel").slideDown("slow");

	});
</script>
<body style="background-color: black">
	<div id="panel" class="col-md-4 col-md-offset-4"
		style="display: none; color: blue; background-color: white; height: 420px; border-radius: 20px; margin-top: 50px; box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.5), 0px 2px 2px 0px rgba(255, 255, 255, 0.5)">
		<h3 style="text-align: center; margin-top: 20px">
			<span class="glyphicon glyphicon-lock"></span>Đăng nhập - ログイン
		</h3>
		<hr>
		<form action="LoginServlet" method="post" id="form_register_and_restore" name="form_register_and_restore" >
			<div class="form-group">
				<label>Tên đăng nhập - ユーザー名</label> <input type="text" name="username"
					placeholder="Username" class="form-control" autocomplete="off">
			</div>
			<div class="form-group">
				<label>Mật khẩu - パスワード</label> <input type="password" name="password"
					placeholder="Password" class="form-control" autocomplete="off">
			</div>
			<div class="row">
				<div class="col-md-6 form-group" style="float: left;">
					<div class="checkbox">
						<label><input type="checkbox" value="remember">Ghi nhớ - 覚えています
私に</label>
					</div>
				</div>
				<div class=" col-md-6 form-group">

					<button id="btn_login" type="submit" style="float: right;" class="btn btn-primary btn-lg">
						Đăng nhập - ログイン <span class="glyphicon glyphicon-log-in"></span>
					</button>

				</div>
			</div>
			<hr>
			<nav class="cl-effect-1" id="cl-effect-1">
				<a  href="#" style="float: left;text-decoration: none;">Quên mật khẩu - パスワードをお忘れですか</a> <a
					href="#" style="float: right; text-decoration: none;">Đăng ký - 登録</a>
			</nav>
		</form>

	</div>
</body>
</html>

