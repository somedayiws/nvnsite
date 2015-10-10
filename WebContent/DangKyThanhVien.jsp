<%@page import="model.bean.TAIKHOAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@page import="controller.SessionCounter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Thư viện cho menu -->
<!-- Google+ -->
<link rel="canonical" href="http://webvietnhat-demo.jelastic.skali.net/" />
<title>Đăng ký thành viên - 会員登録の申請 </title>
</head>
<body onLoad="initialize()">
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- Quảng cáo lung tung -->
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<center id="tieude">Đăng ký thành viên</br>会員登録の申請 </center>
				<%=request.getAttribute("loi")==null?"":request.getAttribute("loi")%>
				<form id="khungdangky" action="DangKyThanhVienServlet" method="post">
					<label class="form-label1">Thông tin tài khoản-アカウントの情報</label><br> <label
						class="form-label">Tài khoản - アカウント(*)</label> <input type="text"
						name="taikhoan" class="form-control" placeholder="Tên tài khoản - ユーザー名">
					<br>
					<label class="form-label">Mật khẩu - パスワード(*)</label> <input
						type="password" name="matkhau" class="form-control"
						placeholder="Mật khẩu của bạn - あなたのパスワード"> <label class="form-label1">Thông
						tin cá nhân-個人の情報</label><br> <label class="form-label">Họ và
						tên - 氏名(*)</label> <input type="text" name="hoten" class="form-control"
						placeholder="Họ tên đầy đủ - 全ての氏名"> <br>
					<label class="form-label">Địa chỉ - 住所</label> <input type="text"
						name="diachi" class="form-control" placeholder="Địa chỉ - 住所">
					<label class="form-label">Điện thoại - 電話番号</label> <input type="text"
						name="dienthoai" class="form-control"
						placeholder="Điện thoại liên hệ - 連絡先の電話番号"> <label
						class="form-label">Email(*)</label> <br>
					<input type="text" name="email" class="form-control"
						placeholder="Email"> <br>
					<label class="form-label">Ngôn ngữ chính - 主要な言語(*) </label> <input
						type="radio" name="ngonngu" value="vi" checked="checked">
					Tiếng Việt - ベトナム語<input type="radio" name="ngonngu" title="ja">
					Tiếng Nhật - 日本語<br> <input type="submit" value="Đăng ký - 登録する"
						name="submit" id="btndangky" class="btn btn-primary btn-sm">
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
		/* Check đăng nhập */
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
					required : "<br>Chưa nhập tên tài khoản<br>ユーザー名をまだログインしない"
				},
				matkhau : {
					required : "<br>Chưa nhập mật khẩu<br>ログインをまだしない!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
		/* Check đăng ký */
		$("#khungdangky").validate({
			rules : {
				taikhoan : {
					required : true
				},
				matkhau : {
					required : true
				},
				hoten : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				dienthoai : {
					digits : true,
					minlength : 10
				}
			},
			messages : {
				taikhoan : {
					required : "Bạn chưa nhập tên tài khoản<br>あなたはユーザー名をまだログインしない"
				},
				matkhau : {
					required : "Bạn chưa nhập mật khẩu<br>ログインをまだしない!"
				},
				hoten : {
					required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
				},
				email : {
					required : "Bạn chưa nhập email!<br>メールをまだ入力しない!",
					email : "Không đúng định dạng email<br>メールの形式が無効です"
				},
				dienthoai : {
					digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。",
					minlength : "Chứa tối thiểu 10 chữ số<br>最低に10文字です。"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>