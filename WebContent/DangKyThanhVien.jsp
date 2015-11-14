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
<title>Đăng ký thành viên - 会員登録の申請 </title>
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- Quảng cáo lung tung -->
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<center id="tieude">Đăng ký thành viên</br>会員登録 </center>
				<%=request.getAttribute("loi")==null?"":request.getAttribute("loi")%>
				<form id="khungdangky" action="Dang-ky" method="post">
					<label class="form-label1">Thông tin tài khoản-アカウントの情報</label><br> <label
						class="form-label">Tài khoản - アカウント(*)</label> <input type="text" onblur="checkTaiKhoan();"
						name="taikhoan" id="taikhoandk" class="form-control" placeholder="Tên tài khoản - ユーザー名">
					<br>
					<label class="form-label">Mật khẩu - パスワード(*)</label> <input
						type="password" name="matkhau" id="matkhau" class="form-control"
						placeholder="Mật khẩu của bạn - あなたのパスワード">
					<br>
					<label class="form-label">Nhập lại mật khẩu - パスワードをもう一度入力して下さい。(*)</label> <input
						type="password" name="laimatkhau" class="form-control"
						placeholder="Nhập lại mật khẩu của bạn - パスワードをもう一度入力して下さい。">
					<label class="form-label1">Thông
						tin cá nhân-個人の情報</label><br> <label class="form-label">Họ và
						tên - 氏名(*)</label> <input type="text" name="hoten" class="form-control"
						placeholder="Họ tên đầy đủ - 全ての氏名"> <br>
					<label class="form-label">Địa chỉ - 住所(*)</label> <input type="text"
						name="diachi" class="form-control" placeholder="Địa chỉ - 住所">
					<label class="form-label">Điện thoại - 電話番号(*)</label> <input type="text"
						name="dienthoai" class="form-control"
						placeholder="Điện thoại liên hệ - 連絡先の電話番号"> <br> <label
						class="form-label">Email - メール(*)</label> <br>
					<input type="text" name="email" id="eml" class="form-control"
						placeholder="Email" onblur="checkEmail();"> 
					<br>
					<input type="hidden" name="ngonngu" value="vi">
					<input type="checkbox" name="noiquy" align="right" title="Abd" > <label for="noiquy" id="noiquy"> Tôi đồng ý với quy định của diễn đàn.</label><br>
					<!-- <label class="form-label">Ngôn ngữ chính - 主要な言語(*) </label> <input
						type="radio" name="ngonngu" value="vi" checked="checked">
					Tiếng Việt - ベトナム語<input type="radio" name="ngonngu" title="ja">
					Tiếng Nhật - 日本語<br> --> 
					<div style="border: 1px solid rgba(193, 176, 176, 0.46); padding: 5px; max-height: 150px;border-radius: 5px;margin-bottom: 5px;overflow: auto;">
						<%=request.getAttribute("noiquy")==null?"":request.getAttribute("noiquy")%>
					</div>
					<input type="submit" value="Đăng ký - 登録する" name="submit" id="btndangky" class="btn btn-primary btn-sm">
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
	
	function checkTaiKhoan() {
		$.ajax({
			url : "CheckTaiKhoanServlet", //file 
			type : "POST", //phuong thức gưi
			data : {
	        	tk : $('#taikhoandk').val()
	        },
	        async : true,
	        success : function(res) {
	        	$('#loitk').remove();
	        	$('#taikhoandk').after(res);
			}
		});
	};
	
	function checkEmail() {
		$.ajax({
			url : "CheckEmailExistServlet", //file 
			type : "POST", //phuong thức gưi
			data : {
	        	tk : $('#eml').val()
	        },
	        async : true,
	        success : function(res) {
	        	$('#loiem').remove();
	        	$('#eml').after(res);
			}
		});
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
					required : true,
					maxlength : 30 
				},
				matkhau : {
					required : true,
					minlength : 6
				},
				laimatkhau : {
					required : true,
					equalTo: "#matkhau"
				},
				hoten : {
					required : true
				},
				diachi : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				dienthoai : {
					required : true,
					digits : true
				},
				noiquy : {
					required : true
				}
			},
			messages : {
				taikhoan : {
					required : "Bạn chưa nhập tên tài khoản<br>あなたはユーザー名をまだログインしない",
					maxlength : "Tên đăng nhập dùng để đăng nhập vào hệ thống, tối đa 30 ký tự, không chứa ký tự đặc biệt<br>ユーザー名はシステム上にログインし、最大に30文字で、特別な記号を使わないでください。"
				},
				matkhau : {
					required : "Bạn chưa nhập mật khẩu<br>ログインをまだしない!",
					minlength : "Mật khẩu ít nhất 6 ký tự, có phân biệt chữ hoa, chữ thường<br>パスワードは最低に6文字、半角と全角を分別して下さい。"
				},
				laimatkhau : {
					required: 'Vui lòng nhập mật khẩu<br>パスワードをもう一度入力して下さい。',
					equalTo: 'Mật khẩu xác nhận không chính xác<br>既に入力されたパスワードが正しくない'
				},
				hoten : {
					required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
				},
				diachi : {
					required : "Bạn chưa nhập địa chỉ hiện tại!<br>貴方の現在の住所を入力して下さい!"
				},
				email : {
					required : "Bạn chưa nhập email!<br>メールをまだ入力しない!",
					email : "Không đúng định dạng email<br>メールの形式が無効です"
				},
				dienthoai : {
					required : "Bạn chưa nhập số điện thoại!<br>連絡取れる電話番号を入力しなければならない",
					digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。"
				},
				noiquy : {
					required : "Bạn chưa đồng ý với quy định của diễn đàn!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>