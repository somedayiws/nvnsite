<%@page import="model.bean.THONGBAO"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
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
<title>Tin nhắn từ diễn đàn - フォーラムからのメッセージ</title>
</head>
<body onLoad="initialize()">
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh sách bài đã đăng */
			THONGBAO thongbao = (THONGBAO)request.getAttribute("thongbao");
	%>
	<div id="wrapper">
	<%@include file="header.jsp"%>
	<div id="mainContent">

		<div id="sahred">
			<g:plusone></g:plusone>

			<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>

			<div id="fb-root"></div>
			<!-- Your share button code -->
			<div class="fb-share-button"
				data-href="http://webvietnhat-demo.jelastic.skali.net/"
				data-layout="button_count"></div>
		</div>
		<!-- hiển thị nội dung chính ở đây -->
		<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
		<div class='alert alert-success' role='alert'>
		<span style="color: red;">Ghi chú</span>: Mọi vấn đề về thông báo các bạn vui lòng thông tin qua chúng tôi bằng cách click vào <span style="font-weight:bold; color: #333">LIÊN HỆ VỚI ADMIN</span> " bên dưới. Hoặc gửi mail thông qua thông tin liên hệ bên dưới. Xin cảm ơn! 
		<br>
		<span style="color: red;">注</span>：すべての問題は、以下のボタンの<span style="font-weight:bold; color: #333">「管理者とコンタクト」</span>をクリックし、お知らせを通知してください。または下記の連絡先を経由してメールを送信して下さい。ありがとうございました！
		</div>
			<center id="tieude"><%=thongbao.getTieuDe() %></center>
			<div id="infoThongBao">
			<span id="dateThongBao"><%=thongbao.getNgayDang() %></span>
			</div>
			<div id="contentThongBao">
			<%=thongbao.getNoiDung() %>
			</div>
			<div id="nav-button">
			</div>
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
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
</script>
</html>