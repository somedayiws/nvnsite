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
<body>
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
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet" style="font-size: 12px;">
				<center id="tieude">Thông báo từ diễn đàn - フォーラムからのメッセージ</center>
				<%=hthi == null || hthi.equals("") ? "" : hthi%>
				<table class="table table-hover" id="tableThongBao">
					<tr id="tieude1">
						<td class="cltde">Tiêu Đề - タイトル</td>
						<td class="clmta">Ngày - 日付</td>
					</tr>
					<%
						i = 0;
								while(listbaidang != null && i<listbaidang.size()) {
					%>
					<tr
						class="<%=listbaidang.get(i).getHienThi() == 1?"active":"non-Active"%>">
						<td><a
							href="Xem-thong-bao?id=<%=listbaidang.get(i).getIdThongBao()%>"><%=listbaidang.get(i).getTieuDe()==null ? "" : listbaidang.get(i).getTieuDe()%></a></td>
						<td><a
							href="Xem-thong-bao?id=<%=listbaidang.get(i).getIdThongBao()%>"><%=listbaidang.get(i).getNgayDang()%></a></td>
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
	</div>
</body>
<!-- Các đoạn script để đây -->
<!-- Hộp thoại phản hồi -->
<script lang="javascript">
	function dichuyen(x) {
		window.location.href = x;
	};
</script>
</html>