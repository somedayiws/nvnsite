<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.QUANGCAO"%>
<%@page import="model.bean.THONGBAO"%>

<%@page import="controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:image" content="http://jpvn.net/images/trangchu/logo-vietnhat24h.png" />
<meta property="og:title" content="Cổng thông tin thương mại Việt-Nhật - 日越ビジネス情報の窓口" />
<meta property="og:description" content="Cổng thông tin thương mại Việt-Nhật 
日越ビジネス情報の窓口" />
<!-- Thư viện cho menu -->
<title>Trang Chủ - ホーム</title>
<!-- Google+ -->
<link rel="canonical" href="http://jpvn.net/" />
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
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- Lấy dữ liệu từ server gửi về -->
			<%
				/* Danh sách quảng cáo hiển thị trên trang */
							ArrayList<QUANGCAO> listquangcao = (ArrayList<QUANGCAO>) request
									.getAttribute("listquangcao");
							/* slide bài viết random list */
							ArrayList<BAIVIET> slidePosts = (ArrayList<BAIVIET>) request
									.getAttribute("slidePosts");
							ArrayList<BAIVIET> hotPosts = (ArrayList<BAIVIET>) request
									.getAttribute("hotPosts");
							/* Top 10 bài viết moi */
							ArrayList<BAIVIET> topmoi = (ArrayList<BAIVIET>) request
									.getAttribute("topmoi");
							ArrayList<THONGBAO> listthongbao = (ArrayList<THONGBAO>) request
									.getAttribute("listthongbao");
			%>
			<div class="col-sm-12 col-md-12" id="topMainContent">
				<div class="col-sm-3 col-md-3" id="leftTopContent">
					<div id="danhmuchot" class="ancainay">
						<p id="titlehot">Danh Muc HOT-人気の項目</p>
						<ul id="listhot">
							<%
								i=0;
								while(listdanhmuc != null && i<listdanhmuc.size() && i<10){
							%>
							<li><a
								href="Danh-sach-bai-viet?id=<%=listdanhmuc.get(i).getIdDanhMuc()%>"><i
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
						<a href="<%=listquangcao.get(0).getLienKet()%>"><img
							src="<%=listquangcao.get(0).getHinhAnh()%>"></a>
					</div>
					<!-- 			Quảng cáo banner -->
				</div>
				<div class="col-sm-6 col-md-6">
					<!-- slider -->
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
							$('#gallery .caption').css(
									{
										width : $('#gallery a').find('img')
												.css('width')
									});
							//Get the caption of the first image from REL attribute and display it
							$('#gallery .content').html(
									$('#gallery a:first').find('img').attr(
											'rel')).animate({
								opacity : 0.7
							}, 0);
							//Call the gallery function to run the slideshow, 6000 = change to next image after 6 seconds
						}
					</script>

					<div id="gallery">
						<%
							i=0;
							while(slidePosts != null && i<1
									){
						%>
						<a href="Xem-bai-viet?id=<%=slidePosts.get(i).getIdBaiViet()%>"
							class="show"> <img src="<%=slidePosts.get(i).getLienKet()%>"
							alt="<%=slidePosts.get(i).getTenBaiVietVi()%>" title="" alt=""
							rel="<h3><%=slidePosts.get(i).getTenBaiVietVi()==null?"":slidePosts.get(i).getTenBaiVietVi()%> </br> <%=slidePosts.get(i).getTenBaiVietJa()==null?"":slidePosts.get(i).getTenBaiVietJa()%></h3>
							<%=slidePosts.get(i).getMoTaVi()!=null ? (slidePosts.get(i).getMoTaVi().length()>90 ? (slidePosts.get(i).getMoTaVi().substring(0, 90)+"..."): slidePosts.get(i).getMoTaVi()):""%> 
							</br><%=slidePosts.get(i).getMoTaJa() !=null ? (slidePosts.get(i).getMoTaJa().length()>90 ? (slidePosts.get(i).getMoTaJa().substring(0, 90)+"..."): slidePosts.get(i).getMoTaJa()): ""%>" />
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
							while(slidePosts != null && i<slidePosts.size()){
						%>
						<div id="col-sm-6 col-md-6">
							<div class="itemMini">
								<a
									href="Xem-bai-viet?id=<%=slidePosts.get(i).getIdBaiViet()%>">
									<img src="<%=slidePosts.get(i).getLienKet()%>"> <strong>
										<%=slidePosts.get(i).getTenBaiVietVi()!=null ? (slidePosts.get(i).getTenBaiVietVi().length()>90 ? (slidePosts.get(i).getTenBaiVietVi().substring(0, 90)+"..."): slidePosts.get(i).getTenBaiVietVi()):""%>
										</br> <%=slidePosts.get(i).getTenBaiVietJa() !=null ? (slidePosts.get(i).getTenBaiVietJa().length()>90 ? (slidePosts.get(i).getTenBaiVietJa().substring(0, 90)+"..."): slidePosts.get(i).getTenBaiVietJa()): ""%></strong>
								</a>
							</div>
						</div>
						<%
							i++; }
						%>
					</div>
					<!-- /slider -->
				</div>
				<div class="col-sm-3 col-md-3" id="hotnews">
					<div class="hotnewsinweek">
						<div id="titlehotnews">
							<p>
								<i class="fa fa-newspaper-o"></i> NỔI BẬT TRONG TUẦN QUA
							</p>
							<p>一週間前に人気の記事です </p>
						</div>
						<ul id="contentWeek">
							<%
								i=0;
																							while(hotPosts != null && i<hotPosts.size() && i < 4){
							%>
							<li><a
								href="Xem-bai-viet?id=<%=hotPosts.get(i).getIdBaiViet()%>"><i
									class="fa fa-angle-double-right"></i> <%=hotPosts.get(i).getTenBaiVietVi()==null?"":hotPosts.get(i).getTenBaiVietVi()%>
									<%=(hotPosts.get(i).getTenBaiVietVi()!=null && hotPosts.get(i).getTenBaiVietJa()!=null)?"<br>":""%>
									<%=hotPosts.get(i).getTenBaiVietJa()==null?"":hotPosts.get(i).getTenBaiVietJa()%>
							</a></li>
							<%
								i++; }
							%>
						</ul>
					</div>
					<!-- 			Quảng cáo banner -->
					<div class="adv300x250">
						<a href="<%=listquangcao.get(1).getLienKet()%>"><img
							src="<%=listquangcao.get(1).getHinhAnh()%>"></a>
					</div>
					<div class="adv300x100">
						<a href="<%=listquangcao.get(2).getLienKet()%>"><img
							src="<%=listquangcao.get(2).getHinhAnh()%>"></a>
					</div>
					<!-- 			Quảng cáo banner -->

				</div>
			</div>
			<%
				/* Danh mục được hiển thị content */ ArrayList
				<DANHMUC> list = (ArrayList<DANHMUC>) request
				.getAttribute("list");
			%>
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<!-- 			Quảng cáo banner -->
				<div id="adlarge" class="adv728x90">
					<a href="<%=listquangcao.get(3).getLienKet()%>"><img
						src="<%=listquangcao.get(3).getHinhAnh()%>"></a>
				</div>
				<!-- 				Hết nội dung quảng cáo  -->
				<!-- Bắt đầu 1 danh mục -->
				<%
					i = 0;
											while(list != null && i<list.size()){
												if(list.get(i).getBaiViets()!= null && list.get(i).getBaiViets().size()>0) {
				%>

				<div class="danhmucx"
					id="<%=list.get(i).getIdDanhMuc().trim().substring(2)%>">
					<p id="titleDanhMuc">
						<strong
							onclick="loadData('Danh-sach-bai-viet','<%=list.get(i).getIdDanhMuc().trim()%>');">
							<span id="iconImg"> <%
 					if(list.get(i).getIcon()!=null)
   											{
 				%> <img src="images/icons/<%=list.get(i).getIcon()%>"> <%
			 	} else {
				 %> <i class="fa fa-star-o"></i> <%
			 	}
				 %>
						</span> <span><%=list.get(i).getTenDanhMucVi()%></span> - <%=list.get(i).getTenDanhMucJa()%></strong>
						<a id="AllPosts"
							href="Danh-sach-bai-viet?id=<%=list.get(i).getIdDanhMuc().trim()%>">
							Xem tất cả-全て見る <i class="fa fa-chevron-right"></i>
						</a>
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
												href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>"
												class="thongtinthem"> <img
												src="<%=listbaiviet.get(j).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(j).getLienKet()%>"><strong><i
													class="fa fa-user"></i> <%=listbaiviet.get(j).getTaiKhoan().getHoTen()%></strong>
												<em> <i class="fa fa-calendar"></i> <%=listbaiviet.get(j).getNgayDang()%></em>
												<em><i class="fa fa-eye"></i> <%=listbaiviet.get(j).getLuotXem()%>
											</em>
											</a>
											<div class="motabai">
												<a
													href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
													<%=listbaiviet.get(j).getTenBaiVietVi()==null?"":listbaiviet.get(j).getTenBaiVietVi()%>
													<%=listbaiviet.get(j).getTenBaiVietJa()==null?"":"<br>"+listbaiviet.get(j).getTenBaiVietJa()%>
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
									<img alt="Ảnh đại diện-プロファイルの画像"
										src="<%=listbaiviet.get(j).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(j).getLienKet()%>"
										style="width: 70px;">
								</div>
								<div class="col-xs-10 col-md-11">
									<a
										href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
										<%=listbaiviet.get(j).getTenBaiVietVi()==null?"":listbaiviet.get(j).getTenBaiVietVi()%>
										<%=listbaiviet.get(j).getTenBaiVietJa()==null?"":"<br>"+listbaiviet.get(j).getTenBaiVietJa()%>
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
				<div id="divloadmore">
				<p id="loadmorebutton" onclick="loadmoredata()">Xem thêm</p>
				</div>
			</div>
			
			<!-- 			Quảng cáo banner -->
			<!-- sidebar -->
			<div class="col-sm-3 col-md-3">
				<!-- Quảng cáo lung tung -->
				<div id="sidebar">
					<div class="sidebar-item">
						<div id="title-item">
							<i class="fa fa-bell-o"></i> THÔNG BÁO-お知らせ
						</div>
						<div id="content-item">
							<div class="item-style">
								<%
									int l = 0;
																											while (listthongbao != null && l < listthongbao.size()) {
								%>
								<p>
									<a
										href="Xem-thong-bao?id=<%=listthongbao.get(l).getIdThongBao()%>">
										<i class="fa fa-angle-double-right"></i> <%=listthongbao.get(l).getTieuDe()%>
									</a>
								</p>
								<%
									l++;
																											}
								%>
							</div>
						</div>
					</div>
					<div class="xemnhieu">
						<div id="titleTabBar">
							<div class="col-sm-6 col-md-6 active" id="pMoiNhat">
								<p>Mới nhất-最新</p>
							</div>
						</div>
						<ul id="contentMoiNhat">
							<%
								l = 0;
																							while (topmoi != null && l < topmoi.size()) {
							%>
							<li><a
								href="Xem-bai-viet?id=<%=topmoi.get(l).getIdBaiViet()%>"><i
									class="fa fa-thumbs-o-up"></i> <%=topmoi.get(l).getTenBaiVietVi() == null ? "" : topmoi
						.get(l).getTenBaiVietVi() + "<br>"%> <%=topmoi.get(l).getTenBaiVietJa() == null ? "" : topmoi
						.get(l).getTenBaiVietJa()%></a></li>
							<%
								l++;
																																											}
							%>
						</ul>
					</div>
					<div id="them">
						<%
							SessionCounter counter = (SessionCounter) session
																																														.getAttribute("counter");
																																												request.getRemoteAddr();
						%>
						<p>
							<span id="icon"><i class="fa fa-users fa-4x"></i> <br>
								Views - 再生回数</span><span id="count"><%=counter.getActiveView()%></span>
						</p>
						<p>
							<span id="icon"><i class="fa fa-globe fa-4x"></i> <br>Online
								- オンライン</span><span id="count"><%=counter.getActiveSessionNumber()%></span>

						</p>
					</div>
					<!-- 			Quảng cáo banner -->
					<div class="adv300x250">
						<a href="<%=listquangcao.get(4).getLienKet()%>"><img
							src="<%=listquangcao.get(4).getHinhAnh()%>"></a>
					</div>
					<!-- 			Quảng cáo banner -->
				</div>
			</div>
			<div class="col-sm-3 col-md-3">
<!-- 				<div class="adv300x250"> -->
<!-- 						<a href="http://jpvn.net"><img -->
<!-- 							src="http://placehold.it/300x250"></a> -->
<!-- 				</div> -->
<!-- 				<div class="adv300x250"> -->
<!-- 						<a href="http://jpvn.net"><img -->
<!-- 							src="http://placehold.it/300x250"></a> -->
<!-- 				</div> -->
				<div class="adv300x600">
					<a href="<%=listquangcao.get(5).getLienKet()%>"><img
						src="<%=listquangcao.get(5).getHinhAnh()%>"></a>
				</div>
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
// 											alert($('#baiviet .danhmucx').size());
											var size = parseInt($('#baiviet .danhmucx').size())+1;
											var nbaiviet = parseInt($(
													"#baiviet .danhmucx:nth-child("+size+")")
													.attr("id"));
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
																$("#loadmorebutton")
																		.html(
																				"<i class='fa fa-spinner fa-pulse'></i></i> Xem thêm");
															},
															success : function(
																	res) {
																$("#divloadmore")
																		.before(
																				res);
																nbaiviet = parseInt($(
																		"#baiviet")
																		.children()
																		.size());
																$("#loadmorebutton")
																.html(
																		"Xem thêm");
															},
															error : function() {
																alert('Có lỗi xảy ra - エラが発生した。');
																$("#load")
																		.html(
																				"");
															}
														});
											}
										});
					});
	function loadmoredata() {
		
		var size = parseInt($('#baiviet .danhmucx').size())+1;
		var nbaiviet = parseInt($(
				"#baiviet .danhmucx:nth-child("+size+")")
				.attr("id"));
			$.ajax({
						url : "DataDanhMucServlet", //file 
						type : "POST", //phuong thức gưi
						data : {
							vitri : nbaiviet
						}, //dữ liệu gửi
						async : true, //
						beforeSend : function() {
							$("#loadmorebutton")
									.html(
											"<i class='fa fa-spinner fa-pulse'></i></i> Xem thêm");
						},
						success : function(
								res) {
							$("#divloadmore")
									.before(
											res);
							nbaiviet = parseInt($(
									"#baiviet")
									.children()
									.size());
							$("#loadmorebutton")
							.html(
									"Xem thêm");
						},
						error : function() {
							alert('Có lỗi xảy ra - エラが発生した。');
							$("#load")
									.html(
											"");
						}
					});
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
	});
</script>
</html>