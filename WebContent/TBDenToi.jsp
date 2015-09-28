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
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.lazyload.js"></script>
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Google+ -->
<link rel="canonical" href="http://webvietnhat-demo.jelastic.skali.net/" />
<title>Tin nhắn từ diễn đàn - 個人ホーム</title>
</head>
<body onLoad="initialize()">
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh sách bài đã đăng */
		ArrayList<THONGBAO> listbaidang = (ArrayList<THONGBAO>)request.getAttribute("list");
		/* Thông báo báo lỗi */
		String hthi = request.getParameter("xuly");
		if(hthi!=null && hthi.equals("capnhat-thanhcong")) hthi = "<div class='alert alert-success' role='alert'>Cập nhật bài viết thành công.<br>記事をアップデートすることができた。</div>";
		else if(hthi!=null && hthi.equals("capnhat-thatbai")) hthi = "<div class='alert alert-danger' role='alert'>Cập nhật bài viết thất bại.<br>記事をアップデートすることができない。</div>";
		else if(hthi!=null && hthi.equals("xoa-thanhcong")) hthi = "<div class='alert alert-success' role='alert'>Xóa bài viết thành công.<br>記事を削除することができた。</div>";
		else if(hthi!=null && hthi.equals("xoa-thatbai")) hthi = "<div class='alert alert-danger' role='alert'>Xóa bài viết thất bại.<br>記事を削除することができない。</div>";
		else if(hthi!=null && hthi.equals("them-thanhcong")) hthi = "<div class='alert alert-success' role='alert'>Đăng bài viết thành công.<br>記事を投稿することができた。</div>";
		else if(hthi!=null && hthi.equals("them-thatbai")) hthi = "<div class='alert alert-danger' role='alert'>Đăng bài viết thất bại.<br>記事を投稿することができない。</div>";
		else if(hthi!=null && hthi.equals("loi-he-thong")) hthi = "<div class='alert alert-danger' role='alert'>Lỗi hệ thống. Vui lòng reset lại trang(Ctrl+F5).<br>システムのエラです。ホームページを改めてリセットして下さい(Ctrl+F5)。</div>";
	%>
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
			<center id="tieude">Các bài viết đã đăng - 投資された記事です</center>
			<%=hthi == null || hthi.equals("") ? "" : hthi%>
			<table class="table table-hover">
				<tr id="tieude1">
					<td class="cltde">Tiêu Đề - タイトル</td>
					<td class="clmta">Ngày - 概要</td>
				</tr>
				<%
					i = 0;
					while(listbaidang != null && i<listbaidang.size()) {
				%>
				<tr class="noidung">
					<td><%=listbaidang.get(i).getTieuDe()==null ? "" : listbaidang.get(i).getTieuDe() %></td>
					<td><%=listbaidang.get(i).getNgayDang()%></td>
				</tr>
				<%
					i++; }
				%>
			</table>
			<div class="menuPhanTrang">
				<%=request.getAttribute("pageNav")%>
			</div>
		</div>
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="clearfix"></div>
	<%@include file="footer.jsp"%>
</body>
<!-- Các đoạn script để đây -->
<!-- Google map -->
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
<script type="text/javascript">
	var map;
	var map1;
	function initialize() {
		var myLatlng = new google.maps.LatLng(16.467800, 107.578983);
		var myLatlng1 = new google.maps.LatLng(37.562170, 139.988980);
		var myOptions = {
			zoom : 4,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var myOptions1 = {
			zoom : 4,
			center : myLatlng1,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById("div_id1"), myOptions);
		map1 = new google.maps.Map(document.getElementById("div_id2"),
				myOptions1);

		var infowindow = new google.maps.InfoWindow({
			content : "TP-Huế",
			size : new google.maps.Size(100, 50),
			position : myLatlng
		});
		var infowindow1 = new google.maps.InfoWindow({
			content : "Home",
			size : new google.maps.Size(100, 50),
			position : myLatlng1
		});
		infowindow.open(map);
		infowindow1.open(map1);

	}
</script>
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
<!-- Ajax load danh mục -->
<script type="text/javascript">
	/* xem thêm các danh mục */
	var nbaiviet = 10;
	$(document)
			.ready(
					function() {
						$("#xemtiep")
								.click(
										function() {
											$
													.ajax({
														url : "DataDanhMucServlet", //file 
														type : "POST", //phuong thức gưi
														data : {
															vitri : nbaiviet
														}, //dữ liệu gửi
														async : true, //
														beforeSend : function() {
															$("#load")
																	.html(
																			"<i class='fa fa-refresh fa-2x fa-spin'></i>");
														},
														success : function(res) {
															$("#baiviet")
																	.append(res);
															nbaiviet = parseInt($(
																	"#baiviet")
																	.children()
																	.size());
															$("#load").html("");
														},
														error : function() {
															alert('Có lỗi xảy ra\nエラが発生した。');
															$("#load").html("");
														}
													});
										});
					});
</script>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
	function showMoiNhat() {
		$('.xemnhieu').children('#contentMoiNhat').removeAttr('style');
		$('.xemnhieu').children('#contentXemNhieu').attr('style',
				'display:none;');
		$('#titleTabBar').children('#pMoiNhat').attr('class',
				'col-sm-6 col-md-6 active');
		$('#titleTabBar').children('#pXemNhieu').attr('class',
				'col-sm-6 col-md-6');
	}
	function showXemNhieu() {
		$('.xemnhieu').children('#contentXemNhieu').removeAttr('style');
		$('.xemnhieu').children('#contentMoiNhat').attr('style',
				'display:none;');
		$('#titleTabBar').children('#pMoiNhat').attr('class',
				'col-sm-6 col-md-6');
		$('#titleTabBar').children('#pXemNhieu').attr('class',
				'col-sm-6 col-md-6 active');
	}
</script>
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* Check đăng ký */
		$("#fcapnhat").validate({
			rules : {
				matkhau : {
					required : true
				},
				email : {
					required : true,
					email: true
				},
				dienthoai : {
					digits : true,
					minlength: 10
				}
			},
			messages : {
				matkhau : {
					required : "Bạn chưa nhập mật khẩu!<br>"
				},
				email : {
					required : "Bạn chưa nhập email!",
					email : "Không đúng định dạng email"
				},
				dienthoai : {
					digits : "Nhập sai định dạng số điện thoại<br>",
					minlength: "Chứa tối thiểu 10 chữ số"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>