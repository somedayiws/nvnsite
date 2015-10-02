﻿<%@page import="model.bean.TAIKHOAN"%>
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
<!-- <script type="text/javascript" src="js/disable-copyright.js"></script> -->
<title>Chi tiết bài viết</title>
</head>
<body onLoad="initialize()">
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Bài viết được view */
		BAIVIET baiviet = (BAIVIET) request.getAttribute("baiviet");
		/* Top 10 bài viết đầu tiên được hiển thị */
		ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>) request.getAttribute("listbaiviet");
		/* binh luan tiếng việt*/
		ArrayList<BINHLUAN> blviet = baiviet.getBinhLuanVi();
		/* bình luận tiếng nhật*/
		ArrayList<BINHLUAN> blnhat = baiviet.getBinhLuanJa();
	%>
	<div id="wrapper">
		<!-- Kết thúc quá trình lấy dữ liệu -->
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
				<h3>
					<i class="fa fa-empire"></i>
					<%
						if(baiviet.getTenBaiVietVi() != null ) {
					%>
					<%=baiviet.getTenBaiVietVi()%>
					<%
						}
					%>
					<%
						if(baiviet.getTenBaiVietVi() != null && baiviet.getTenBaiVietJa() != null) {
					%>
					<br>
					<%
						}
					%>
					<%
						if(baiviet.getTenBaiVietJa() != null ) {
					%>
					<%=baiviet.getTenBaiVietJa()%>
					<%
						}
					%>
				</h3>
				<div id="infoNews">
					<div class="infoDetail" id="category">
						<a
							href="DanhSachBaiVietServlet?id=<%=baiviet.getDanhMuc().getIdDanhMuc()%>">
							<%=baiviet.getDanhMuc().getTenDanhMucVi()+"-"+baiviet.getDanhMuc().getTenDanhMucJa()%></a>
					</div>
					<div class="infoDetail">
						<i class="fa fa-user"></i>
						<%=baiviet.getTaiKhoan().getHoTen()%></div>
					<div class="infoDetail">
						<i class="fa fa-calendar"></i>
						<%=baiviet.getNgayDang()%></div>
					<div class="infoDetail">
						<i class="fa fa-eye"></i>
						<%=baiviet.getLuotXem()%></div>
					<div id="socialLink"></div>
				</div>
				<div class="clearfix"></div>
				<p>
					<%
						if(baiviet.getMoTaVi() != null ) {
					%>
					<strong> <%=baiviet.getMoTaVi()%></strong> <br>
					<%
						}
					%>
					<%
						if(baiviet.getMoTaJa() != null ) {
					%>
					<strong> <%=baiviet.getMoTaJa()%></strong>
					<%
						}
					%>
				</p>
				<br> <br>
				<div id="noidung">
					<%
						if(baiviet.getNoiDungVi() != null && baiviet.getNoiDungJa() != null ) {
					%>
					<div class="col-xs-12 col-sm-6 col-md-6" id="tiengviet">
						<%=baiviet.getNoiDungVi()%>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="tiengnhat">
						<%=baiviet.getNoiDungJa()%>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="blviet">
						<strong id="selfComment"> Bình luận </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn"
								class="form-control" id="txtviet"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentvi('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác</span>
						</p>

						<div class="row" id="listblviet">
							<%
								i = 0;
																																							while(blviet != null && i<blviet.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blviet.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blviet.get(i).getNgayDang()%></span>
								<p><%=blviet.get(i).getPhanHoiVi()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonviet">
							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'vi');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="blnhat">
						<strong id="selfComment"> Bình luận </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn"
								class="form-control" id="txtnhat"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentja('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác</span>
						</p>

						<div class="row" id="listblnhat">
							<%
								i = 0;
												while(blnhat != null && i<blnhat.size()){
							%>
							<div id="itemComment">

								<i class="fa fa-user"></i> <em><%=blnhat.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blnhat.get(i).getNgayDang()%></span>
								<p><%=blnhat.get(i).getPhanHoiJa()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonnhat">

							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'ja');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						} else {
					%>
					<%
						if(baiviet.getNoiDungVi() != null ) {
					%>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengviet">
						<%=baiviet.getNoiDungVi()%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blviet">
						<strong id="selfComment"> Bình luận </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn"
								class="form-control" id="txtviet"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentvi('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác</span>
						</p>

						<div class="row" id="listblviet">
							<%
								i = 0;
																																								while(blviet != null && i<blviet.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blviet.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blviet.get(i).getNgayDang()%></span>
								<p><%=blviet.get(i).getPhanHoiVi()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonviet">

							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'vi');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						}
					%>
					<%
						if(baiviet.getNoiDungJa() != null ) {
					%>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengnhat">
						<%=baiviet.getNoiDungJa()%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blnhat">
						<strong id="selfComment"> Bình luận </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn"
								class="form-control" id="txtnhat"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentja('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác</span>
						</p>

						<div class="row" id="listblnhat">
							<%
								i = 0;
																																								while(blnhat != null && i<blnhat.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blnhat.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blnhat.get(i).getNgayDang()%></span>
								<p><%=blnhat.get(i).getPhanHoiJa()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonnhat">
							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'ja');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>

				</div>
				<!-- danh sách bài viết mới -->
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;" id="listbaiviet">
					<strong>Danh sách bài viết liên quan</strong>
					<%
						i=0;
								while(listbaiviet != null && i<listbaiviet.size()){
					%>
					<div class="row">
						<!-- danh sách các bài viết trong nhóm -->
						<img alt="Ảnh đại diện" src="images/baiviet.jpg"
							style="width: 20px;"> <a
							href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
							<%=listbaiviet.get(i).getTenBaiVietVi()==null?"":listbaiviet.get(i).getTenBaiVietVi()+"<br>"%>
							<%=listbaiviet.get(i).getTenBaiVietJa()==null?"":listbaiviet.get(i).getTenBaiVietJa()%></a>
					</div>
					<%
						i++; }
					%>
				</div>
			</div>
			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
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
			var nvitri = $("#listblnhat").children().size();
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
		var date = $("#dateComment").val();
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
</script>
</html>
