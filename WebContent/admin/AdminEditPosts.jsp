<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<link rel="stylesheet" href="css/register.css">
<script src="../ckeditor/ckeditor.js"></script>
<script src="../js/jquery-ui.js"></script>
<title>Chỉnh sửa bài viết</title>
</head>
<%
	/**Reveice data from server*/
	ArrayList<DANHMUC> categorys = (ArrayList<DANHMUC>) request.getAttribute("categorys");
	TAIKHOAN[] account = (TAIKHOAN[]) request.getAttribute("account");
	BAIVIET post = (BAIVIET) request.getAttribute("post");

	
	
%>
<script>
	function checkData(){
		var namePostVi = document.getElementById("namePostVi").value;
		alert(namePostVi);
		return false;
	}
</script>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<!-- Content -->
		<div style="margin-top: 10px">
			<%
				if (post != null) {
			%>
			<div class="col-md-8 col-md-offset-2">
			
			
				<form action="AdminEditPostsServlet" method="get" id="formAdminEditPost"
					name="formAdminEditPost" onsubmit="return checkData()">


					<!-- Id danh muc -->

					<div class="form-group">
						<label>ID bài viết</label> <input type="text" class="form-control"
							name="IdPost" value="<%=post.getIdBaiViet()%>"
							readonly="readonly">
					</div>
					<!-- Tài khoản -->
					<%
						if (account != null) {
					%>
					
						<label>Tên tài khoản - Username</label> <select name="account"
							class="form-control">
							<%
								for (int i = 0; i < account.length; i++) {
							%>
							<option value="<%=account[i].getIdTaiKhoan()%>"
								<%if (account[i].getIdTaiKhoan().equals(
								post.getTaiKhoan().getIdTaiKhoan())) {%>
								selected="selected" <%}%>><%=account[i].getTenTaiKhoan()%></option>
							<%
								}
							%>
						</select>
				
					<%
						} else {
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Tài khoản- お知らせ</div>
						<div class="panel-body">
							Không có tài khoản trong cơ sở dữ liệu - データベース内のエントリがありません<br>
							<a href="../AdminCreateServet"><button
									class="btn btn-success">Tạo tài khoản - 記事を作成</button></a>
						</div>
					</div>
					<%
						}
					%>
					<!-- Trạng thái -->
					<div class="form-group">
						<label>Trạng thái<span class="rq"> * </span></label>
						<input type="text" class="form-control"
							name="Status" value="<%=post.getTrangThai()%>"
							readonly="readonly">				
					</div>
					
					<!--Ghi chú  -->
					<div class="form-group">
						<label>Ghi chú - Note</label>
						<textarea rows="10" cols="20" class="form-control" name="note" readonly="readonly"><%=post.getGhiChu() %></textarea>
					</div>
					<!-- Tên bai viet -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên bài viết(Việt Nam)<span class="rq"> *
								</span>:
								</label><input type="text" class="form-control" id="namePostVi"
									maxlength="300" name="namePostVi"
									value="<%if (post.getTenBaiVietVi() != null) {%><%=post.getTenBaiVietVi()%><%}%>">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Name post(Japan)<span class="rq"> * </span>:
								</label><input type="text" class="form-control" id="namePostJa"
									maxlength="300" name="namePostJa"
									value="<%if (post.getTenBaiVietJa() != null) {%><%=post.getTenBaiVietJa()%><%}%>">
							</div>
						</div>
					</div>

					<!-- Danh muc -->
					
					<%
						if (categorys != null) {
					%>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Danh mục Việt Nam<span class="rq"> * </span>
								</label> <select name="categoryVi" class="form-control">
									<%
										for (int i = 0; i < categorys.size(); i++) {
									%>
									<option value="<%=categorys.get(i).getIdDanhMuc()%>"
										<%if (categorys.get(i).getIdDanhMuc().equals(
								post.getDanhMuc().getIdDanhMuc())) {%>
										selected="selected" <%}%>><%=categorys.get(i).getTenDanhMucVi()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Category Japan<span class="rq"> * </span>
								</label> <select name="categoryJa" class="form-control">
									<%
										for (int i = 0; i < categorys.size(); i++) {
									%>
									<option value="<%=categorys.get(i).getIdDanhMuc()%>"
										<%if (categorys.get(i).getIdDanhMuc().equals(
								post.getDanhMuc().getIdDanhMuc())) {%>
										selected="selected" <%}%>><%=categorys.get(i).getTenDanhMucJa()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>
					<%
						} else {
					%>

					<div class="panel panel-info">
						<div class="panel-heading">Danh mục- お知らせ</div>
						<div class="panel-body">
							Không có danh mục trong cơ sở dữ liệu - データベース内のエントリがありません<br>
							<a href="../ListCategoryServlet"><button
									class="btn btn-success">Tạo danh mục - 記事を作成</button></a>
						</div>
					</div>

					<%
						}
					%>


					


					<!-- Nội dung -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Nội dung Việt Nam</label>
								<textarea id="contentVi" name="contentVi" class="ckeditor"><%=post.getNoiDungVi() %></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Content Japan</label>
								<textarea id="contentJa" name="contentJa" class="ckeditor"><%=post.getNoiDungJa() %></textarea>
							</div>
						</div>
					</div>
					
					
					
					<!-- Mô tả -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Mô tả Việt Nam</label>
								<textarea id="descriptionVi" name="descriptionVi" rows="5" cols="10" class="form-control"><%=post.getMoTaVi() %></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Description Japan</label>
								<textarea id="descriptionJa" name="descriptionJa" rows="5" cols="10" class="form-control"><%=post.getMoTaJa() %></textarea>
							</div>
						</div>
					</div>
					
					<!-- Lượt xem -->
					<div class="form-group">
						<label>Lượt xem - View</label>
						<input type="text" name="view" class="form-control" value="<%=post.getLuotXem()%>" readonly="readonly">
					</div>
					
					<!-- Liên kết -->
					<div class="form-group">
						<label>Liên kết - Link</label>
						<input type="text" name="link" class="form-control" value="<%=post.getLienKet()%>" readonly="readonly">
					</div>
					
					<!-- Ngày đăng -->
					<div class="form-group">
						<label>Ngày đăng - Date</label>
						<input type="text" name="date" class="form-control" value="<%=post.getNgayDang()%>" readonly="readonly">
					</div>
					
					<button class="btn btn-primary">Chỉnh sửa - Edit</button>
					

				</form>
			</div>
			<%
				}else{
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Bài viết- お知らせ</div>
				<div class="panel-body">
					Không có bài viết trong cơ sở dữ liệu - データベース内のエントリがありません<br>
					<a href="../DangBaiVietServlet"><button class="btn btn-success">Tạo
							bài viết - 記事を作成</button></a>
				</div>
			</div>
			<%} %>
		</div>

	</div>
</body>
</html>