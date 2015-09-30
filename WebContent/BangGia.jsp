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
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.lazyload.js"></script>
<!-- <script type="text/javascript" src="js/disable-copyright.js"></script> -->
<title>Chi tiết bài viết</title>
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css">
</head>
<body onLoad="initialize()">
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Top 10 bài viết đầu tiên được hiển thị */
		ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>) request.getAttribute("listbaiviet");
	%>

	<!-- Kết thúc quá trình lấy dữ liệu -->
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- Quảng cáo lung tung -->
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
			<div class="col-sm-9 col-md-9" id="baiviet">
				<center>
					<h3>Bảng giá dịch vụ</h3>
				</center>
				<label class="nhan">1. Bảng giá dịch vụ dịch thuật</label> <img
					class="imggia" alt="Bảng giá dịch vụ dịch thuật"
					src="<%=request.getAttribute("giadich")==null?"images/tainguyen/Capture2.PNG":request.getAttribute("giadich")%>">
				<br> <label class="nhan">2. Bảng giá dịch vụ quảng cáo</label>
				<img class="imggia" alt="Bảng giá dịch vụ quảng cáo"
					src="<%=request.getAttribute("giaquangcao")==null?"images/tainguyen/Capture1.PNG":request.getAttribute("giaquangcao")%>">
			</div>

			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
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
<!-- Xử lý load lấy bình luận -->
<script type="text/javascript">
	function loadBinhLuan(id, ngonngu) {
		if (ngonngu == 'vi') {
			var nvitri = $("#listblviet").children().size();
			$.ajax({
				url : "DataBinhLuanServlet", //file  
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : nvitri
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblviet").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
		} else {
			$.ajax({
				url : "DataBinhLuanServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : $("#listblnhat").children().size()
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblnhat").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
		}
	}
</script>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
	function comentvi(id) {
		var bien = $("#tkDangNhap").val();
		var date = $("#dateComment").val();
		if (bien == 'null') {
			alert("Bạn phải đăng nhập, mới được bình luận.");
		} else {
			var txt = $("#txtviet").val();
			if (txt != "") {
				var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
						+ bien
						+ "</em> <span id='dateComment'>"
						+ date
						+ "</span> <p>" + txt + "</p></div>";
				$("#listblviet").prepend(htm);
				$("#txtviet").val("");
				updatedatavi(id, 'vi', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.");
			}
		}
		$("#txtviet").val("");
	};
	function comentja(id) {
		var bien = $("#tkDangNhap").val();
		if (bien == 'null') {
			alert("Bạn phải đăng nhập, mới được bình luận.");
		} else {
			var txt = $("#txtnhat").val();
			if (txt != "") {
				var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
						+ bien
						+ "</em> <span id='dateComment'>"
						+ date
						+ "</span> <p>" + txt + "</p></div>";
				$("#listblnhat").prepend(htm);
				$("#txtnhat").val("");
				updatedatavi(id, 'ja', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.");
			}
		}
		$("#txtnhat").val("");
	};
	function updatedatavi(id, laguage, bluan) {
		$.ajax({
			url : "UpDateDataBinhLuan", //file 
			type : "POST", //phuong thức gưi
			data : {
				idbaiviet : id,
				ngonngu : laguage,
				binhluan : bluan
			}, //dữ liệu gửi
			async : true
		});
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
					required : "<br>Chưa nhập mật khẩu!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>
