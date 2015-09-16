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
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<link rel="stylesheet" href="css/register.css">
<script type="text/javascript" src="../check_validate/checkCreate(Admin).js"></script>
<script type="text/javascript" src="./js/createAccount.js"></script>
<title>Tạo tài khoản</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>				
		<%@include file="Menu.jsp"%>		
		<div  style="margin-top: 10px">			
			<div class="col-md-8 col-md-offset-2 panel panel-primary">
				<div class="panel-heading">Thêm tài khoản - アカウントを追加します</div>
				<div class="panel-body">
					<form id="formCreateAccount" name="form_create"
						action="AdminCreateServet" method="post" onsubmit="return check()">
						<div class="form-group">
							<label>Tên - フルネーム<span class="rq"> * </span>
							</label> <input class="form-control" maxlength="30" type="text" id="name"
								name="name">
							<p class="help-block">Nhập tên đầy đủ của ban, tối đa 30 kí
								tự.</p>
						</div>
						<div class="form-group">
							<label>Địa chỉ - アドレス<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="100"
								name="adress">
							<p class="help-block">Nhập địa chỉ hiện tại của bạn, bao gồm
								số nhà, đường, quận, thành phố</p>
						</div>
						<div class="form-group">
							<label>Số điện thoại - フォン<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="11"
								name="phone">
							<p class="help-block">Nhập số điện thoại hiện tại của bạn.Số
								điện thoại tối đa 11 số</p>
						</div>
						<div class="form-group">
							<label>Email - メール<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="30"
								name="email">
							<p class="help-block">Nhập địa chỉ email mà bạn hay thường
								dùng</p>
						</div>
						<div class="form-group">
							<label>Tên đăng nhập - ユーザー名<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="20"
								name="username">
							<p class="help-block">Tên đăng nhập dùng để đăng nhập vào hệ
								thống, tối đa 20 ký tự, không chứa ký tự đặt biệt</p>
						</div>
						<div class="form-group">
							<label>Mật khẩu - パスワード<span class="rq"> * </span>
							</label> <input type="password" class="form-control" maxlength="20"
								id="password" name="password">
							<p class="help-block">Mật khẩu ít nhất 6 ký tự, có phân biệt
								chữ hoa chữ thường</p>
						</div>
						<div class="form-group">
							<label>Nhập lại mật khẩu - リピートパスワード <span class="rq"> * </span>:
							</label> <input type="password" class="form-control " maxlength="20"
								name="re_password">
							<p class="help-block">Xác nhận lại mật khẩu vừa nhập</p>
						</div>
						<div class="form-group">
							<label>Quyền quản trị - ユーザーの種類</label> <select class="form-control"
								name="typeUser" id ="typeUser" onchange="change(this.value)">
								<option value="admin">Admin</option>
								<option value="CTV">CTV</option>
								<option value="User">User</option>
							</select>
						</div>
						<div class="form-group" id="language">
							<label>Ngôn ngữ - 言語</label> <select class="form-control"
								name="language">
								<option value="Tiếng việt">Tiếng Việt</option>
								<option value="日本">日本</option>								
							</select>
						</div>
						<button type="submit" class="btn btn-primary btn-md">Tạo
							tài khoản - アカウントを作成します</button>

					</form>
				</div>
			</div>
			<div class="col-md-2" style="background-color: #B2B2B2"></div>
		</div>
		
	</div>

</body>
</html>
