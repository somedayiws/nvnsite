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
<%
/* Lấy sesion người dùng */
DANHMUC danhmuc = (DANHMUC)request.getAttribute("danhmuc");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:title" content="<%=(danhmuc.getTenDanhMucVi()==null ? "" : danhmuc.getTenDanhMucVi()+" - ") + (danhmuc.getTenDanhMucJa()==null ? "" : danhmuc.getTenDanhMucJa())%>" />
<!-- Thư viện cho menu -->
<title>Danh sách bài viết - 文書のリスト</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">

			<%
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
				</h3>
				<%
					i=0;
						while(listbaiviet != null && i<listbaiviet.size()){
				%>
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="Xem-bai-viet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
						class="thongtinthem"> <img src="<%=listbaiviet.get(i).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(i).getLienKet()%>"><strong><i
				class="fa fa-user"></i> <%=listbaiviet.get(i).getTaiKhoan().getHoTen()%></strong>
				<em> <i class="fa fa-calendar"></i> <%=listbaiviet.get(i).getNgayDang()%></em>
				<em><i class="fa fa-eye"></i> <%=listbaiviet.get(i).getLuotXem()%>
				</em>
					</a>
					<div class="motabai">
						<a href="Xem-bai-viet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
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
						<a href="Xem-bai-viet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
							class="xemthem">Xem thêm - 詳細</a>
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
																alert('Có lỗi xảy ra-エラが発生した。!!');
																$("#load")
																		.html(
																				"");
															}
														});
											}
										});
					});
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
					required : "<br>Chưa nhập tên tài khoản<br>アカウントをまだ入力しない"
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