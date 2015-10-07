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
<title>Đăng nhập</title>
</head>
<body onLoad="initialize()">
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">

				<form action="DangNhapServlet" method="post" id="fdangnhap">
					<div class="login">
						<div>
							<h3 class="modal-title" id="myModalLabel">Đăng nhập - </h3>
						</div>
						<div class="loi">
							<%=request.getAttribute("loi")==null?"":request.getAttribute("loi")%>
						</div>
						<p>
							<%=request.getAttribute("tbao")==null?"":request.getAttribute("tbao")%>
						</p>
						<div class="modal-body">
							<div class="row">
								<strong>Tài khoản - </strong> <input name="taikhoan"
									type="text" placeholder="Tài khoản" class="form-control">
							</div>
							<div class="row">
								<strong>Mật khẩu - </strong> <input name="matkhau"
									type="password" placeholder="Mật khẩu" class="form-control">
							</div>
							<a href="DangKyThanhVienServlet"><i class="fa fa-user-plus"></i>
								Đăng ký - </a> <br> <a href="QuenMatKhauServlet"><i
								class="fa fa-user-plus"></i> Quên mật khẩu - パスワードを忘れた。 </a>
						</div>
						<div class="modal-footer">
							<button name="xuly" name="submit" value="TrangChu"
								class="btn btn-primary btn-sm">Đăng nhập - </button>
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
<!-- Google+ -->
<script type="text/javascript"
	src="https://apis.google.com/js/plusone.js"></script>
<!-- Twitter -->
<script>
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
				.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');
</script>
<!-- Facebook -->
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.4&appId=1671772309710877";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<!-- Hộp thoại phản hồi -->
<script lang="javascript">
	(function() {
		var _h1 = document.getElementsByTagName('title')[0] || false;
		var product_name = '';
		if (_h1) {
			product_name = _h1.textContent || _h1.innerText;
		}
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=f6fdedfea03ad1bcd7118f3fed15d856&data=eyJzc29faWQiOjEzNDI2MjcsImhhc2giOiIzMzRmODIxY2QwNmFiNTM4ZTBkOTMzNzM2ZDA2ZThlMSJ9&pname='
				+ product_name;
		var s = document.getElementsByTagName('script');
		s[0].parentNode.insertBefore(ga, s[0]);
	})();
</script>
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
					required : "<br>Chưa nhập tên tài khoản"
				},
				matkhau : {
					required : "<br>Chưa nhập mật khẩu - ログインをまだしない!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>