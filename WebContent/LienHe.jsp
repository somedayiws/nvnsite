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
<title>Liên hệ - 問い合わせ </title>
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<center id="tieude">Liên hệ - 問い合わせ</br></center>
				<%=request.getAttribute("loi")==null?"":request.getAttribute("loi")%>
				<form id="khunglienhe" action="Lien-he" method="post">
					<input type="hidden" name="taikhoan" class="form-control" value="<%=request.getAttribute("taikhoan_lh") !=null?request.getAttribute("taikhoan_lh"):""%>">
					<label class="form-label">Họ và	tên - 氏名(*)</label> 
					<input type="text" name="hoten" class="form-control" placeholder="Họ tên đầy đủ - 全ての氏名"
					value="<%=request.getAttribute("hovaten_lh") !=null?request.getAttribute("hovaten_lh"):""%>"> 
					<br>
					<label class="form-label">Điện thoại - 電話番号</label> <input type="text"
						name="dienthoai" class="form-control"
						placeholder="Điện thoại liên hệ - 連絡先の電話番号"
						value="<%=request.getAttribute("dienthoai_lh") !=null?request.getAttribute("dienthoai_lh"):""%>"> 
					<label class="form-label">Email - メール(*)</label> <br>
					<input type="text" name="email" class="form-control"
						placeholder="Email - メール"
						value="<%=request.getAttribute("email_lh") !=null?request.getAttribute("email_lh"):""%>"> <br>
					<label class="form-label">Tiêu đề - テーマ(*)</label> <br>
					<input type="text" name="tieude" class="form-control"
						placeholder="Tiêu đề - テーマ"> 
					<br>
					<label class="form-label">Nội dung - `内容(*)</label> 
					<textarea rows="3" placeholder="Nội dung liên hệ"
								class="form-control" name="noidung" id="noidunglh"></textarea> 	
								<br>
					<input type="submit" value="Gửi - 送信"
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
		$("#khunglienhe").validate({
			rules : {
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
				},
				tieude : {
					required : true,
					maxlength: 80
				},
				noidung : {
					required : true,
				},
			},
			messages : {
				hoten : {
					required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
				},
				tieude : {
					required : "Bạn chưa nhập tiêu đề!<br> テーマをまだ記入しない!",
					maxlength : "Tiêu đề quá dài! <br> テーマが長いです。!<br>"
				},
				email : {
					required : "Bạn chưa nhập email!<br>メールをまだ入力しない!",
					email : "Không đúng định dạng email<br>メールの形式が無効です"
				},
				dienthoai : {
					digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。",
					minlength : "Chứa tối thiểu 10 chữ số<br>最低に10文字です。"
				},
				noidung : {
					required : "Bạn chưa nhập nội dung !<br> 内容をまだ記入しない !"
				},
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>