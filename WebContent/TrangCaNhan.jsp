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
<%@include file="script.jsp"%>
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
				<ul class="nav nav-pills">
					<li role="presentation" class="active"><a href="#"><i
							class="fa fa-info"></i> Thông tin tài khoản</a></li>
					<li role="presentation"><a href="#"><i class="fa fa-usd"></i>
							Kiếm tiền</a></li>
				</ul>
				<%=(String)request.getAttribute("meg")==null?"":request.getAttribute("meg")%>
				<div class="alert alert-success alert-white rounded" id="alertResult" style="display: none;">
					<div class="icon">
						<i class="fa fa-check"></i>
					</div>
					<strong>Success!</strong> 
					<div id="resultUpdate">Changes has been saved successfully!</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<p class="titlegroup">Thông tin cá nhân</p>
					<form action="Trang-ca-nhan" method="post" id="fcapnhat">
						<label>Tài khoản-アカウント</label> 
						<input type="hidden" name="permission" class="form-control"
							value="<%=user.getEditFlag()%>">
						<input type="text" name="taikhoan"
							<%if(user.getEditFlag().charAt(0)=='0'){%>readonly="readonly"<% } %> class="form-control"
							value="<%=user.getTenTaiKhoan()%>" onblur="checkTaiKhoan();">
							<br> <label>Họ
							tên-氏名</label> <input type="text" name="hoten" class="form-control"
							value="<%=user.getHoTen()==null?"":user.getHoTen()%>"> <br>
						<label>Điện thoại-電話番号</label> <input type="text" name="dienthoai"
							class="form-control"
							value="<%=user.getDienThoai()==null?"":user.getDienThoai()%>">
						<br> <label>Địa chỉ-住所</label> <input type="text"
							name="diachi" class="form-control"
							value="<%=user.getDiaChi()==null?"":user.getDiaChi()%>"><br>
						<label>Email</label> <input type="text" id="email" name="email"
							class="form-control" <%if(user.getEditFlag().charAt(1)=='0'){%> readonly="readonly" <%} %>
							value="<%=user.getEmail()==null?"":user.getEmail()%>" onblur="checkEmail();">
						<button type="submit" class="btn-primary" id="btnSubmit">
							Cập nhật tài khoản<br>
						</button>
					</form>
				</div>
				<div class="col-sm-6 col-md-6">
					<p class="titlegroup">Thay đổi mật khẩu</p>
					<form method="post" id="fchangepassword">
						<input type="hidden" name="account" readonly="readonly"
							value="<%=user.getTenTaiKhoan()%>"> <label>Mật
							khẩu - パスワード(*)</label> <input type="password" id="oldpassword"
							name="oldpassword" class="form-control"> <br> <label>Mật
							khẩu mới - 新しいパスワード(*)</label> <input type="password" id="newpassword"
							name="newpassword" class="form-control"> <br> <label>Nhập
							lại mật khẩu - パスワードをもう一度入力して下さい(*)</label> <input type="password"
							id="passwordagain" name="passwordagain" class="form-control">
						<br>
						<button type="submit" class="btn-warning" id="btnChangePass">
							Thay đổi mật khẩu<br>
						</button>
					</form>
				</div>
				<div style="clear: both;"></div>
				<p id="tieude-trang-ca-nhan">
					<i class="fa fa-paper-plane-o"></i> Các bài viết đã đăng -
					掲載された記事です。
				</p>
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
		<div id="resultAjaxProfile" style="display: none;"></div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Các đoạn script để đây -->
<link rel="stylesheet" href="css/extend.bootstrap.css">
<script type="text/javascript" src="js/edit.profile.validate.min.js"></script>
</html>