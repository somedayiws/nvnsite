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
<title>Danh mục bài viết</title>
</head>
<body onLoad="initialize()">
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">

			<%
				/* Lấy sesion người dùng */
				DANHMUC danhmuc = (DANHMUC)request.getAttribute("danhmuc");
				/* Danh mục được hiển thị trong phần content */
				ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
			%>
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet">
				<h3>
					<i class="fa fa-empire"></i> <input type="hidden" id="id"
						value="<%=danhmuc.getIdDanhMuc()%>">
					<%=danhmuc.getTenDanhMucVi()==null ? "" : danhmuc.getTenDanhMucVi()+" - "%>
					<%=danhmuc.getTenDanhMucJa()==null ? "" : danhmuc.getTenDanhMucJa()%>
					[Bài viết :
					<%=danhmuc.getSoLuongBV()%>]
				</h3>
				<%
					i=0;
						while(listbaiviet != null && i<listbaiviet.size()){
				%>
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
						class="thongtinthem"> <img
						src="<%=listbaiviet.get(i).getLienKet()%>"><strong>Tác
							giả : <%=listbaiviet.get(i).getTaiKhoan().getHoTen()%></strong><br> <em>
							Ngày : <%=listbaiviet.get(i).getNgayDang()%><br> View : <%=listbaiviet.get(i).getLuotXem()%>
					</em>
					</a>
					<div class="motabai">
						<a href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
							<%=listbaiviet.get(i).getTenBaiVietVi()== null ? "" : listbaiviet.get(i).getTenBaiVietVi() + "<br>"%>
							<%=listbaiviet.get(i).getTenBaiVietJa()== null ? "" : listbaiviet.get(i).getTenBaiVietJa()%>
						</a>
						<p>
							<%
								if(listbaiviet.get(i).getMoTaVi() != null) {
							%>
							<%=listbaiviet.get(i).getMoTaVi().length()>90 ? (listbaiviet.get(i).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaVi()%><br>
							<%
								}
							%>
							<%
								if(listbaiviet.get(i).getMoTaJa() != null) {
							%>
							<%=listbaiviet.get(i).getMoTaJa().length()>60 ? (listbaiviet.get(i).getMoTaJa().substring(0, 60)+"..."): listbaiviet.get(i).getMoTaJa()%></p>
						<%
							}
						%>
						<a href="BaiVietServlet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
							class="xemthem">Xem thêm ...</a>
					</div>
				</div>
				<%
					i++; }
				%>
			</div>
			<%@include file="sidebar.jsp"%>
			<div class="clearfix"></div>
			<br>
			<div class="col-sm-10 col-md-12" align="center" id="load"></div>
		</div>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Các đoạn script ở đây -->
<script language="JavaScript">
	var nbaiviet = 10;
	var id = $("#id").val();
	jQuery(document)
			.ready(
					function($) {
						$(window)
								.scroll(
										function() {
											if (($(document).height()
													- $(this).scrollTop() - $(
													this).height()) < 10) {
												$
														.ajax({
															url : "DataBaiVietServlet", //file 
															type : "POST", //phuong thức gưi
															data : {
																vitri : nbaiviet,
																id : id
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
																		.size() - 1);
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
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	function dichuyen(x) {
		window.location.href = x;
	};
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
