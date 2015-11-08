<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<!-- _______________CSS________________ -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/createAccount.css">
<title>Tạo tài khoản - アカウントの作成</title>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	String type = (String)request.getAttribute("type");
%>
</head>
<body>
	<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>				
		<%@include file="Menu.jsp"%>		
		<div id="divContent">
			<%if(type!=null){ %>			
			<div class="col-md-8 col-md-offset-2 panel panel-primary">
				<div class="panel-heading">Thêm tài khoản - アカウントの作成</div>
				<div class="panel-body">
					<form id="formCreateAccount" name="form_create"
						action="AdminCreateServet?type=<%=type %>" method="post" onsubmit="return check()">
						<div class="form-group">
							<label>Tên - 氏名<span class="rq"> * </span>
							</label> <input class="form-control" maxlength="30" type="text" id="name" name="name">
							<p class="help-block">Nhập tên đầy đủ của bạn, tối đa 30 kí tự.<br>貴方の氏名を全て入力し、最大に30文字までです。</p>
						</div>
						<div class="form-group">
							<label>Địa chỉ - 住所<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="100" name="adress">
							<p class="help-block">Nhập địa chỉ hiện tại của bạn.<br>貴方の現在の住所を入力して下さい。</p>
						</div>
						<div class="form-group">
							<label>Số điện thoại - 電話番号<span class="rq"> * </span>
							</label> <input type="text" class="form-control" name="phone">
							<p class="help-block">Nhập số điện thoại mà bạn đang dùng<br></p>
						</div>
						<div class="form-group">
							<label>Email - メール<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="30" name="email">
							<p class="help-block">Nhập địa chỉ email mà bạn thường dùng<br>貴方がよく使われているメールアドレスを入力して下さい</p>
						</div>
						<div class="form-group">
							<label>Tên đăng nhập - ユーザー名<span class="rq"> * </span>
							</label> <input type="text" class="form-control" maxlength="20" name="username">
							<p class="help-block">Tên đăng nhập dùng để đăng nhập vào hệ
								thống, tối đa 20 ký tự, không chứa ký tự đặt biệt<br>ユーザー名はシステム上にログインし、最大に20文字で、特別な記号を使わないでください。</p>
						</div>
						<div class="form-group">
							<label>Mật khẩu - パスワード<span class="rq"> * </span>
							</label> <input type="password" class="form-control" maxlength="20" id="password" name="password">
							<p class="help-block">Mật khẩu ít nhất 6 ký tự, có phân biệt chữ hoa chữ thường<br>パスワードは最低に6文字、半角と全角を分別して下さい。</p>
						</div>
						<div class="form-group">
							<label>Nhập lại mật khẩu -  パスワードをもう一度入力して下さい<span class="rq"> * </span>
							</label> <input type="password" class="form-control " maxlength="20" name="re_password">
							<p class="help-block">Xác nhận lại mật khẩu vừa nhập<br>入力されたパスワードをもう一度確認ください。</p>
						</div>
						<%if(type.equals("CTV")) {%>
							<div class="form-group">
								<label>Quyền quản trị - 管理者の権利<span class="rq"> * </span>
								</label> <input class="form-control" maxlength="30" type="text" id="typeUser"
									name="typeUser" value="ctv" readonly="readonly">
								<p class="help-block">Cộng tác viên - 協力者</p>
							</div>
						<%}else{ %>
						<div class="form-group">
							<label>Quyền quản trị - 管理者の権利</label> <select class="form-control"
								name="typeUser" id ="typeUser">
								<option value="admin">Admin - 管理者</option>								
								<option value="user">User - ユーザー</option>
							</select>
						</div>
						<%} %>
						<div class="form-group" id="language">
							<label>Ngôn ngữ - 言語</label> <select class="form-control"
								name="language">
								<%if(!type.equals("CTV")){ %>
									<option value="vi">Tiếng Việt - ベトナム語</option>
									<option value="ja">Tiếng Nhật - 日本語</option>
								<%}else{ %>
									<option value="vi">Tiếng Nhật - 日本語  -> Tiếng Việt - ベトナム語</option>
									<option value="ja">Tiếng Việt - ベトナム語  -> Tiếng Nhật - 日本語</option>
								<%} %>								
							</select>
						</div>
						<button type="submit" class="btn btn-primary btn-md">Tạo
							tài khoản - アカウントの作成</button>

					</form>
				</div>
			</div>
			<%} else{%>
				<div class="col-md-4 col-md-offset-4 alert alert-info">
						<strong>Thông báo - お知らせ</strong>Trang này không tồn tại - このホームページを存しない。
				</div>
			<%} %>
		</div>
	</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
<!-- _____________________________________JS______________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/checkCreate(Admin).js"></script>
</html>
