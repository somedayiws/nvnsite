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
<script type="text/javascript">
	$(document).ready(function() {

		//Execute the slideShow
		slideShow();

	});

	function slideShow() {

		//Set the opacity of all images to 0
		$('#gallery a').css({
			opacity : 0.0
		});

		//Get the first image and display it (set it to full opacity)
		$('#gallery a:first').css({
			opacity : 1.0
		});

		//Set the caption background to semi-transparent
		$('#gallery .caption').css({
			opacity : 0.7
		});

		//Resize the width of the caption according to the image width
		$('#gallery .caption').css({
			width : $('#gallery a').find('img').css('width')
		});

		//Get the caption of the first image from REL attribute and display it
		$('#gallery .content').html(
				$('#gallery a:first').find('img').attr('rel')).animate({
			opacity : 0.7
		}, 400);

		//Call the gallery function to run the slideshow, 6000 = change to next image after 6 seconds
		setInterval('gallery()', 10000);

	}

	function gallery() {

		//if no IMGs have the show class, grab the first image
		var current = ($('#gallery a.show') ? $('#gallery a.show')
				: $('#gallery a:first'));

		//Get next image, if it reached the end of the slideshow, rotate it back to the first image
		var next = ((current.next().length) ? ((current.next()
				.hasClass('caption')) ? $('#gallery a:first') : current.next())
				: $('#gallery a:first'));

		//Get next image caption
		var caption = next.find('img').attr('rel');

		//Set the fade in effect for the next image, show class has higher z-index
		next.css({
			opacity : 0.0
		}).addClass('show').animate({
			opacity : 1.0
		}, 1000);

		//Hide the current image
		current.animate({
			opacity : 0.0
		}, 1000).removeClass('show');

		//Set the opacity to 0 and height to 1px
		$('#gallery .caption').animate({
			opacity : 0.0
		}, {
			queue : false,
			duration : 0
		}).animate({
			height : '1px'
		}, {
			queue : true,
			duration : 300
		});

		//Animate the caption, opacity to 0.7 and heigth to 100px, a slide up effect
		$('#gallery .caption').animate({
			opacity : 0.7
		}, 100).animate({
			height : '110px'
		}, 500);

		//Display the content
		$('#gallery .content').html(caption);

	}
</script>
<style type="text/css">
body {
	font-family: arial
}

.clear {
	clear: both
}

#gallery {
	position: relative;
	height: 320px
}

#gallery a {
	float: left;
	position: absolute;
}

#gallery a img {
	border: none;
}

#gallery a.show {
	z-index: 500
}

#gallery .caption {
	z-index: 600;
	background-color: #000;
	color: #ffffff;
	height: 110px;
	width: 100%;
	position: absolute;
	bottom: 0;
	padding: 0px 2px;
}

#gallery .caption .content {
	margin: 5px
}

#gallery .caption .content h3 {
	margin: 0;
	padding: 0;
	color: #1DCCEF;
}
</style>

<script src="js/jquery.lazyload.js"></script>
<title>Trang Chủ</title>
<link rel="stylesheet" href="css/ClientStyle.css">
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Google+ -->
<link rel="canonical" href="http://webvietnhat-demo.jelastic.skali.net/" />
</head>
<body onLoad="initialize()">
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- Quảng cáo lung tung -->

			<div class="col-sm-12 col-md-12" id="topMainContent">
				<div class="col-sm-3 col-md-3" id="leftTopContent">
					<div id="danhmuchot" class="ancainay">
						<p id="titlehot">Danh Muc HOT -</p>
						<ul id="listhot">
							<%
								i=0;
								while(listdanhmuc != null && i<listdanhmuc.size()){
							%>
							<li><a
								href="DanhSachBaiVietServlet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><i
									class="fa fa-hand-o-right"></i> <%=listdanhmuc.get(i).getTenDanhMucVi()== null ? "" : listdanhmuc.get(i).getTenDanhMucVi()+" - "%>
									<%=listdanhmuc.get(i).getTenDanhMucJa()== null ? "" : listdanhmuc.get(i).getTenDanhMucJa()%>
									<span class="label label-default canh"><%=listdanhmuc.get(i).getSoLuongBV()%></span></a></li>
							<%
								i++; }
							%>
						</ul>
					</div>
					<!-- 			Quảng cáo banner -->
					<div class="adv300x250">
						<img src="http://placehold.it/300x250">
					</div>
					<!-- 			Quảng cáo banner -->
				</div>
				<div class="col-sm-6 col-md-6">
					<!-- slider -->
					<div id="gallery">
						<%
							i=0;
																															while(top != null && i<top.size()){
						%>

						<a href="BaiVietServlet?id=<%=top.get(i).getIdBaiViet()%>"
							class="show"> <img src="<%=top.get(i).getLienKet()%>"
							alt="<%=top.get(i).getTenBaiVietVi()%>" title="" alt=""
							rel="<h3><%=top.get(i).getTenBaiVietVi()==null?"":top.get(i).getTenBaiVietVi()%> </br> <%=top.get(i).getTenBaiVietJa()==null?"":top.get(i).getTenBaiVietJa()%></h3>
							<%=top.get(i).getMoTaVi()!=null ? (top.get(i).getMoTaVi().length()>90 ? (top.get(i).getMoTaVi().substring(0, 90)+"..."): top.get(i).getMoTaVi()):""%> 
							</br><%=top.get(i).getMoTaJa() !=null ? (top.get(i).getMoTaJa().length()>90 ? (top.get(i).getMoTaJa().substring(0, 90)+"..."): top.get(i).getMoTaJa()): ""%>" />
						</a>
						<%
							i++; }
						%>
						<div class="caption">
							<div class="content"></div>
						</div>
					</div>
					<div id="relativePost">
						<%
							i=0;
															while(top != null && i<top.size()  && i < 6){
						%>
						<div id="col-sm-6 col-md-6">
							<div class="itemMini">
								<a href="BaiVietServlet?id=<%=top.get(i).getIdBaiViet()%>">
									<img src="<%=top.get(i).getLienKet()%>"> <strong>
										<%=top.get(i).getMoTaVi()!=null ? (top.get(i).getMoTaVi().length()>90 ? (top.get(i).getMoTaVi().substring(0, 90)+"..."): top.get(i).getMoTaVi()):""%>
										</br> <%=top.get(i).getMoTaJa() !=null ? (top.get(i).getMoTaJa().length()>90 ? (top.get(i).getMoTaJa().substring(0, 90)+"..."): top.get(i).getMoTaJa()): ""%></strong>
								</a>
							</div>
						</div>
						<%
							i++; }
						%>
					</div>
					<!-- /slider -->
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="hotnewsinweek">
						<div id="titlehotnews">
							<p>
								<i class="fa fa-newspaper-o"></i> NỔI BẬT TRONG TUẦN QUA
							</p>
							<p>人気の動画人気の動気の動画</p>
						</div>
						<ul id="contentWeek">
							<%
								i=5;
																												while(top != null && i<top.size()){
							%>
							<li><a
								href="BaiVietServlet?id=<%=top.get(i).getIdBaiViet()%>"><i
									class="fa fa-angle-double-right"></i> <%=top.get(i).getTenBaiVietVi()==null?"":top.get(i).getTenBaiVietVi()%>
									<%=(top.get(i).getTenBaiVietVi()!=null && top.get(i).getTenBaiVietJa()!=null)?"<br>":"" %>
									<%=top.get(i).getTenBaiVietJa()==null?"":top.get(i).getTenBaiVietJa()%>
									<i class="fa fa-eye"></i> <span><%=top.get(i).getLuotXem()%></span></a></li>
							<%
								i++; }
							%>
						</ul>
					</div>
					<!-- 			Quảng cáo banner -->
					<div class="adv300x250">
						<img src="http://placehold.it/300x250">
					</div>
					<div class="adv300x250">
						<img src="http://placehold.it/300x100">
					</div>
					<!-- 			Quảng cáo banner -->

				</div>
			</div>

			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<!-- 			Quảng cáo banner -->
				<div id="adlarge" class="adv728x90">
					<img src="http://placehold.it/728x90">
				</div>
				<!-- 				Hết nội dung quảng cáo  -->
				<!-- Bắt đầu 1 danh mục -->
				<%
					i = 0;
							while(list != null && i<list.size()){
								if(list.get(i).getBaiViets()!= null && list.get(i).getBaiViets().size()>0) {
				%>

				<div class="danhmucx" id="<%=list.get(i).getIdDanhMuc().trim().substring(2)%>">
					<p id="titleDanhMuc">
						<strong
							onclick="loadData('DanhSachBaiVietServlet','<%=list.get(i).getIdDanhMuc().trim()%>');">
							<span id="iconImg">
						<%
							if(list.get(i).getIcon()!=null)
																	{
						%>
								<img src="<%=list.get(i).getIcon()%>">
								<%
									} else {
								%>
								<i class="fa fa-star-o"></i>
								<%
									}
								%>
							</span>
							<span><%=list.get(i).getTenDanhMucVi()%></span> - <%=list.get(i).getTenDanhMucJa()%></strong>
					</p>
					
					<div class="row">
						<div class="row">
							<div id="wrapper_carousel" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<%
										ArrayList<BAIVIET> listbaiviet = list.get(i).getBaiViets();
																																																																															int j=0;
																																																																															if(listbaiviet != null && j<listbaiviet.size()){
									%>
									<div class="item active">
										<div class="baivieti col-xs-12 col-sm-12 col-md-12">
											<a
												href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>"
												class="thongtinthem"> <embed
													src="<%=listbaiviet.get(j).getLienKet()%>"><strong>Tác
													giả : <%=listbaiviet.get(j).getTaiKhoan().getHoTen()%></strong><br>
												<em> Ngày : <%=listbaiviet.get(j).getNgayDang()%><br>
													View : <%=listbaiviet.get(j).getLuotXem()%>
											</em>
											</a>
											<div class="motabai">
												<a
													href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
													<%=listbaiviet.get(j).getTenBaiVietVi()%> <br> <%=listbaiviet.get(j).getTenBaiVietJa()%>
												</a>
												<p>
													<%
														if(listbaiviet.get(j).getMoTaVi() != null) {
													%>
													<%=listbaiviet.get(j).getMoTaVi().length()>90 ? (listbaiviet.get(j).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(j).getMoTaVi()%><br>
													<%
														}
													%>
													<%
														if(listbaiviet.get(j).getMoTaJa() != null) {
													%>
													<%=listbaiviet.get(j).getMoTaJa().length()>90 ? (listbaiviet.get(j).getMoTaJa().substring(0, 90)+"..."): listbaiviet.get(j).getMoTaJa()%></p>
												<%
													}
												%>
											</div>
										</div>
									</div>
									<%
										j++; }
									%>

								</div>
							</div>
						</div>
						<!-- danh sách bài viết mới -->
						<div class="col-xs-12 col-sm-12 col-md-12"
							style="background-color: white;" id="binhluan<%=i%>">
							<%
								j = 0;
																																																												while(listbaiviet != null && j<listbaiviet.size()){
							%>
							<div class="row">
								<!-- danh sách các bài viết trong nhóm -->
								<div class="col-xs-2 col-md-1">
									<img alt="Ảnh đại diện"
										src="<%=listbaiviet.get(j).getLienKet()%>"
										style="width: 70px;">
								</div>
								<div class="col-xs-10 col-md-11">
									<a
										href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
										<%=listbaiviet.get(j).getTenBaiVietVi()%><br><%=listbaiviet.get(j).getTenBaiVietJa()%>
									</a>
								</div>
							</div>
							<%
								j++; }
							%>
						</div>
						<!-- Kết thúc binh luận -->
					</div>
				</div>

				<%
					} i++; }
				%>
			</div>

			<!-- sidebar -->
			<%@include file="sidebar.jsp"%>
			<!-- 			Quảng cáo banner -->
			<div class="col-sm-3 col-md-3">
				<div class="adv300x250">
					<img src="http://placehold.it/300x600">
				</div>
			</div>
			<!-- 			Quảng cáo banner -->
			<div id="sahred" class="ancainay">
				<g:plusone></g:plusone>

				<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>

				<div id="fb-root"></div>
				<!-- Your share button code -->
				<div class="fb-share-button"
					data-href="http://webvietnhat-demo.jelastic.skali.net/"
					data-layout="button_count"></div>
			</div>
			<div class="clearfix"></div>
			<br>
			<div class="col-sm-10 col-md-12" align="center" id="load"></div>
		</div>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Các đoạn script để đây -->
<script language="JavaScript">
	var nbaiviet = 10;
	jQuery(document)
			.ready(
					function($) {
						$(window)
								.scroll(
										function() {
											var nbaiviet = parseInt($("#baiviet .danhmucx:last-child").attr("id"));
											if (($(document).height()
													- $(this).scrollTop() - $(
													this).height()) < 10) {
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
															success : function(
																	res) {
																$("#baiviet")
																		.append(
																				res);
																nbaiviet = parseInt($(
																		"#baiviet")
																		.children()
																		.size());
																$("#load")
																		.html(
																				"");
															},
															error : function() {
																alert('Có lỗi xảy ra');
																$("#load")
																		.html(
																				"");
															}
														});
											}
										});
					});
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
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
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