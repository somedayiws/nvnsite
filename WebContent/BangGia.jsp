<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
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
<title>Bảng giá quảng cáo - 広告の価格表</title>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Top 10 bài viết đầu tiên được hiển thị */
		ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>) request.getAttribute("listbaiviet");
	%>

	<!-- Kết thúc quá trình lấy dữ liệu -->
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet">
				<center>
					<h3>Bảng giá dịch vụ - サービスの価格表</h3>
				</center>
				<label class="nhan">1. Bảng giá dịch vụ dịch thuật - 科学的翻訳の価格表</label> <img
					class="imggia" alt="Bảng giá dịch vụ dịch thuật - 科学的翻訳の価格表"
					src="<%=request.getAttribute("giadich")==null?"images/tainguyen/Capture2.PNG":request.getAttribute("giadich")%>">
				<br> <label class="nhan">2. Bảng giá dịch vụ quảng cáo - 広告のサービスの価格表</label>
				<img class="imggia" alt="Bảng giá dịch vụ quảng cáo - 広告のサービスの価格表"
					src="<%=request.getAttribute("giaquangcao")==null?"images/tainguyen/Capture1.PNG":request.getAttribute("giaquangcao")%>">
			</div>

			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
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
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function dichuyen(x) {
		window.location.href = x;
	};
</script>
</html>
