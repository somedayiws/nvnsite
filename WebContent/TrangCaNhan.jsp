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
<title>Trang cá nhân - 個人ホーム</title>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh sách bài đã đăng */
			ArrayList<BAIVIET> listbaidang = (ArrayList<BAIVIET>)request.getAttribute("dsbaidang");
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
				<center id="tieude">Thông tin cá nhân-個人の情報 </center>
				<%=(String)request.getAttribute("meg")==null?"":request.getAttribute("meg")%>
				<form action="Trang-ca-nhan" method="post" id="fcapnhat">
					<div class="col-sm-6 col-md-6">
						<label>Tài khoản-アカウント</label> <input type="text" name="taikhoan"
							readonly="readonly" class="form-control"
							value="<%=user.getTenTaiKhoan()%>"> <label>Họ tên-氏名</label>
						<input type="text" name="hoten" class="form-control"
							value="<%=user.getHoTen()==null?"":user.getHoTen()%>"> <label>Điện
							thoại-電話番号</label> <input type="text" name="dienthoai" class="form-control"
							value="<%=user.getDienThoai()==null?"":user.getDienThoai()%>">
						<br>
						<label>Địa chỉ-住所</label> <input type="text" name="diachi"
							class="form-control"
							value="<%=user.getDiaChi()==null?"":user.getDiaChi()%>">
						<label>Email</label> <input type="text" id="email" name="email"
							class="form-control" readonly="readonly"
							value="<%=user.getEmail()==null?"":user.getEmail()%>">
					</div>
					<div class="col-sm-6 col-md-6">
						<label>Mật khẩu mới - 新しいパスワード</label> <input type="password" id="matkhau"
							name="matkhau" class="form-control"
							value="<%=user.getMatKhau()%>"> <br> <label>Nhập
							mã xác nhận bên dưới</br>以下のＩＤ（暗号化）　を入力して下さい。</label>
						<%
							/* ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LcUfwsTAAAAAJvWq__-nMqX8qhBymgzfztk342-",
																                                        "6LcUfwsTAAAAAA3VD4c_O4wK66-0AxVccisDCx8m", false); */
																    ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LeIbgwTAAAAAAYPvXYIKDhW1WKhm1ItqgzLa5Ma",
																		                                        "6LeIbgwTAAAAAOPCOI-VANpsDzAl_bMsS8e10NIV", false);
																    out.print(c.createRecaptchaHtml(null, null));
						%>
						<button type="submit" class="btn btn-primary row" id="btnSubmit">
							Cập nhật thông tin cá nhân<br>個人情報をアップデートする。
						</button>
					</div>
				</form>
				<div style="clear: both;"></div>
				<center id="tieude">Các bài viết đã đăng - 掲載された記事です。</center>
				<%=hthi == null || hthi.equals("") ? "" : hthi%>
				<table class="table table-hover">
					<tr id="tieude1">
						<td class="cltde">Tiêu Đề - タイトル</td>
						<td class="clmta">Ngày - 日付</td>
						<td class="ttrang"></td>
						<td class="cllxem"><i class="fa fa-globe"></i></td>
						<td class="clvd"></td>
					</tr>
					<%
						i = 0;
													  		while(listbaidang != null && i<listbaidang.size()) {
													  			if(user != null && user.getNgonNgu().equals("vi")) {
					%>
					<tr class="noidung">
						<td><%=listbaidang.get(i).getTenBaiVietVi()==null ? "" : listbaidang.get(i).getTenBaiVietVi()+"<br>"%><%=listbaidang.get(i).getTenBaiVietJa()==null ? "" : listbaidang.get(i).getTenBaiVietJa()%></td>
						<td><%=listbaidang.get(i).getNgayDang()%></td>
						<td><%=listbaidang.get(i).getTrangThai()%></td>
						<td><%=listbaidang.get(i).getLuotXem()%></td>
						<td class="ctv-chon">
							<%
								if(listbaidang.get(i).getTrangThai().equals("Đã đăng<br>既設")||listbaidang.get(i).getTrangThai().equals("Đang duyệt<br>バロース")) {
							%> <a
							href="Xem-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Xem-観覧する</i></a> <%
 	} else {
 %> <a
							href="Cap-nhat-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Sửa-修正する</i></a> <a
							href="Xoa-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Xóa-削除する</i></a> <%-- <%= list.get(i).getTrangThai()%> --%>
							<%
								}
							%>
						</td>
					</tr>
					<%
						} else {
					%>
					<tr class="noidung">
						<td><%=listbaidang.get(i).getTenBaiVietJa()==null ? "" : listbaidang.get(i).getTenBaiVietJa()+"<br>"%><%=listbaidang.get(i).getTenBaiVietVi()==null ? "" : listbaidang.get(i).getTenBaiVietVi()%></td>
						<td><%=listbaidang.get(i).getNgayDang()%></td>
						<td><%=listbaidang.get(i).getTrangThai()%></td>
						<td><%=listbaidang.get(i).getLuotXem()%></td>
						<td class="ctv-chon">
							<%
								if(listbaidang.get(i).getTrangThai().equals("Đã đăng<br>既設")||listbaidang.get(i).getTrangThai().equals("Đang duyệt<br>バロース")) {
							%> <a
							href="Xem-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Xem-観覧する</i></a> <%
 	} else {
 %> <a
							href="Cap-nhat-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Sửa-修正する</i></a> <a
							href="Xoa-bai-viet?id=<%=listbaidang.get(i).getIdBaiViet()%>"><i
								class="fa fa-eye-slash"> Xóa-削除する</i></a> <%-- <%= list.get(i).getTrangThai()%> --%>
							<%
								}
							%>
						</td>
					</tr>
					<%
						}
					%>
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