<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="controller.SessionCounter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Thư viện cho menu -->
<title>Quên mật khẩu - パスワードを忘れた。</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">

				<form class="panel-login" action="Quen-mat-khau" method="post"
					id="fdangnhap">
					<div class="login">
						<i class="fa fa-pinterest-p fa-2x"></i> <label>Reset mật khẩu - パスワードをリセットする。</label>
						<%=request.getAttribute("meg")==null ? "<div class='alert alert-info' role='alert'><p>Hãy nhập tài khoản thành viên của bạn bên dưới và click vào button \"Lấy mật khẩu - ログイン\". Kiểm tra lại email của bạn đã đăng ký với chúng tôi để lấy lại mật khẩu. Cám ơn!<br>以下にあなたのアカウント情報を入力し、ボタンをクリックし、パスワードの収得-ログインする。次に登録されたメールをチェックして、パスワードを収得する。</p></div>" : request.getAttribute("meg")%>
						<div class="row">
							<label><i class="fa fa-user"></i> Tài khoản - アカウント</label> <input
								type="text" name="taikhoan" placeholder="Tài khoản thành viên"
								class="form-control">
						</div>
						<br>
						<div class="row" align="right">
							<button type="reset" class="btn btn-warning btn-sm" id="huy">
								<i class="fa fa-eraser"></i> Nhập lại - 再入力
							</button>
							<button type="submit" name="submit" value="congtacvien"
								class="btn btn-primary btn-sm" id="gui">
								<i class="fa fa-sign-in"></i> Lấy mật khẩu - パスワードを収得する
							</button>
						</div>
					</div>
				</form>

			</div>
			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Các đoạn script để đây -->
<!-- Hộp thoại phản hồi -->
<script lang="javascript">
	function dichuyen(x) {
		window.location.href = x;
	};
</script>
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fdangnhap").validate({
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
					required : "<br>Chưa nhập tên tài khoản-ユーザー名をまだログインしない"
				},
				matkhau : {
					required : "<br>Chưa nhập mật khẩu-ログインをまだしない!!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>