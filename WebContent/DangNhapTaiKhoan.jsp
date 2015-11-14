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
<title>Đăng nhập - ログイン</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">

				<form action="Dang-nhap" method="post" id="fdangnhap">
					<div class="login">
						<div>
							<h3 class="modal-title" id="myModalLabel">Đăng nhập - ログイン</h3>
						</div>
						<div class="loi">
							<%=request.getAttribute("loi")==null?"":request.getAttribute("loi")%>
						</div>
						<p>
							<%=request.getAttribute("tbao")==null?"":request.getAttribute("tbao")%>
						</p>
						<div class="modal-body">
							<div class="row">
								<strong>Tài khoản - アカウント</strong> <input name="taikhoan"
									type="text" placeholder="Tài khoản - アカウント" class="form-control">
							</div>
							<div class="row">
								<strong>Mật khẩu - パスワード</strong> <input name="matkhau"
									type="password" placeholder="Mật khẩu - パスワード" class="form-control">
							</div>
							<a href="Quen-mat-khau" style="color: #337ab7;"> Quên mật khẩu - パスワードを忘れた。 ?</a><br> 
							<a href="Dang-ky"><i class="fa fa-user-plus"></i> Đăng ký thành viên - 会員登録の申請 </a> 
							
						</div>
						<div class="modal-footer">
							<button name="xuly" name="submit" value="TrangChu"
								class="btn btn-primary btn-sm">Đăng nhập - ログイン</button>
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
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	function dichuyen(x) {
		window.location.href = x;
	};
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
					required : "<br>Chưa nhập tên tài khoản<br>アカウントのユーザー名をまだ入力しない"
				},
				matkhau : {
					required : "<br>Chưa nhập mật khẩu<br>ログインをまだしない!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>