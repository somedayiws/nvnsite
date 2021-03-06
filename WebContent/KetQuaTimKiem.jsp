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
<title>Danh sách bài viết - 文書のリスト</title>
<%@include file="script.jsp"%>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh mục được hiển thị trong phần content */
		ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
		/* Lấy lại dữ liệu tìm kiếm */
		String txtSearch = (String)request.getAttribute("txtFind");
		String chon = (String)request.getAttribute("theo");
	%>
	<div id="wrapper">
	<%@include file="header.jsp"%>
	<div id="mainContent">
		<!-- Tạo dữ liệu ẩn -->
		<input type="hidden" id="txtSearch" value="<%= txtSearch%>">
		<input type="hidden" id="chon" value="<%= chon%>">
		<div class="col-sm-9 col-md-9" id="baiviet">
			<h3>
				<i class="fa fa-empire"></i> Kết quả tìm kiếm - 検索の結果 <br> Từ khóa: <%= txtSearch%>
			</h3>
			<%
				if(listbaiviet == null) {
			%>
			<div class="alert alert-warning" role="alert">Không tìm thấy dữ
				liệu bạn cần ... <br>あなたは調べた内容がありません。 <br> Từ khóa: <%= txtSearch%></div>
			<%
				}
			%>
			<%
				i=0;
				while(listbaiviet != null && i<listbaiviet.size()){
			%>
			<div class="baivieti col-xs-12 col-sm-12 col-md-12">
				<a href="Xem-bai-viet?id=<%=listbaiviet.get(i).getIdBaiViet()%>"
					class="thongtinthem"> <img src="<%=listbaiviet.get(i).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(i).getLienKet()%>"><strong><i
				class="fa fa-user"></i> <%=listbaiviet.get(i).getTaiKhoan().getTenTaiKhoan()%></strong>
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
			<br>
			<div id="divloadmore">
				<p id="loadmorebutton" onclick="loadmoredata()">Xem thêm</p>
			</div>
		</div>
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="clearfix"></div>
	<!-- kết thúc -->
	<div class="col-sm-10 col-md-12" align="center" id="load"></div>
	<div class="clearfix"></div>
	<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Ajax load bài viết -->
<script language="JavaScript" src="js/loadmore.listsearch.ajax.min.js"></script>
</html>