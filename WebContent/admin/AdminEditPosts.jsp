<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<!-- _______________________CSS_________________________________________ -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/editPost.css">
<!-- __________________________________JS_________________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="../js/jquery-ui.js"></script>
<title>Chỉnh sửa bài viết - 記事の修正</title>
</head>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	
		
	/**Reveice data from server*/
	ArrayList<DANHMUC> categorys = (ArrayList<DANHMUC>) request.getAttribute("categorys");
	ArrayList<TAIKHOAN> accounts = (ArrayList<TAIKHOAN>) request.getAttribute("accounts");
	BAIVIET post = (BAIVIET) request.getAttribute("post");
	String from = (String)request.getAttribute("from");
	//Lấy kết quả chỉnh sửa từ ShowAdminEditPost
	String resultEdit = (String)request.getAttribute("resultEdit");
%>
<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<!-- Content -->
		<div id="divcontent">
			<%
				if (post != null) {
			%>
<!-------------------Hiển thị kết quả chỉnh sửa bài viết---------------------  -->
			<%if(resultEdit!=null){ %>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
				<strong>Thông báo - お知らせ</strong><%=resultEdit%>
			</div>
			<%} %>
<!-- ------------------------------------------------------------------------- -->
			<div class="col-md-8 col-md-offset-2 panel panel-primary">		
			 	<div class="panel-heading">Chỉnh sửa bài viết - 記事の修正</div>	
			 	<div class="panel-body">
				<form action="AdminEditPostsServlet" method="post" id="formAdminEditPost"
					name="formAdminEditPost" onsubmit="return checkData()">
					<!-- Id bài viết -->
					<div class="form-group">
						<label>ID</label> <input type="text" class="form-control"
							name="IdPost" value="<%=post.getIdBaiViet()%>"
							readonly="readonly">
					</div>
					<!-- Danh mục -->
					<div class="form-group">
					<%if(categorys != null){ %>
					<label>Danh mục - 項目</label>
					<select name="category" class="form-control">
						<%for(int i=0;i<categorys.size();i++){ %>
							<option value="<%=categorys.get(i).getIdDanhMuc()%>"
									<%if (categorys.get(i).getIdDanhMuc().equals(post.getDanhMuc().getIdDanhMuc())) {%>
								selected="selected" <%}%>>
								<%=categorys.get(i).getTenDanhMucVi()%> - <%=categorys.get(i).getTenDanhMucJa()%> 
							</option>
						<%}%>
					</select>
					<%}else{ %>
					<div class="panel panel-info">
						<div class="panel-heading">Danh mục - 項目</div>
						<div class="panel-body">
							Không có danh mục trong cơ sở dữ liệu - データベースに全ての項目を存しない。<br>
							<a href="../ListCategoryServlet"><button
									class="btn btn-success">Tạo danh mục - 項目の作成</button></a>
						</div>
					</div>
					<%} %>
					</div>
					<!-- Tài khoản -->
					<%
						if (accounts != null) {
					%>
						<label>Tên tài khoản - アカウント名</label> <select name="account"
							class="form-control">
							<%
								for (int i = 0; i < accounts.size(); i++) {
							%>
							<option value="<%=accounts.get(i).getIdTaiKhoan()%>"
								<%if (accounts.get(i).getIdTaiKhoan().equals(
								post.getTaiKhoan().getIdTaiKhoan())) {%>
								selected="selected" <%}%>><%=accounts.get(i).getTenTaiKhoan()%></option>
							<%
								}
							%>
						</select>
					<%
						} else {
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Tài khoản- アカウント</div>
						<div class="panel-body">
							Không có tài khoản trong cơ sở dữ liệu - データベースにアカウントを存しない。<br>
							<a href="../AdminCreateServet"><button
									class="btn btn-success">Tạo tài khoản - アカウントの作成</button></a>
						</div>
					</div>
					<%
						}
					%>
					<!-- Trạng thái -->
					<div class="form-group">
						<label>Trạng thái - 状態<span class="rq"> * </span></label>
						<input type="text" class="form-control"
							name="Status" 
							value="<%if(post.getTrangThai().equals("MoiDang")) {%>Mới đăng - 新たな掲載<%}else if(post.getTrangThai().equals("DangDich")){ %>Đang dịch - 翻訳中<%}else if(post.getTrangThai().equals("OK")){%>Đã duyệt - 承認された。<%}else if(post.getTrangThai().equals("KhongDich")){ %>Không dịch - 翻訳しない。<%}else if(post.getTrangThai().equals("HuyDich")){ %>Hủy dịch - 翻訳をキャンセルした。<%}else if(post.getTrangThai().equals("DichXong")){ %>Dịch xong - 翻訳を完了した<%}else{%>Trạng thái khác - 別の状態<%=post.getTrangThai()%><%} %>"
							readonly="readonly">				
					</div>
					
					<!--Ghi chú  -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>Ghi chú - メーモ</label> -->
<%-- 						<textarea rows="10" cols="20" class="form-control" name="note" readonly="readonly"><%if(post.getGhiChu()!=null){%><%=post.getGhiChu()%><%} %></textarea> --%>
<!-- 					</div> -->
					<!-- Tên bai viet -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên bài viết(Tiếng Việt) - 記事名（ベトナム語）<span class="rq"> *</span>
								</label><input type="text" class="form-control" id="namePostVi"
									maxlength="300" name="namePostVi" <%if(post.getTenBaiVietVi() == null || post.getTenBaiVietVi().trim() == ""){%> disabled="disabled" <%} %>
									value="<%if (post.getTenBaiVietVi() != null) {%><%=post.getTenBaiVietVi()%><%}%>">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên bài viết(Tiếng Nhật) - 記事名（日本語）<span class="rq"> * </span>
								</label><input type="text" class="form-control" id="namePostJa"
									maxlength="300" name="namePostJa"  <%if(post.getTenBaiVietJa() == null || post.getTenBaiVietJa().trim() == ""){%> disabled="disabled" <%} %>
									value="<%if (post.getTenBaiVietJa() != null) {%><%=post.getTenBaiVietJa()%><%}%>">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Nội dung (Tiếng Việt) - 内容（ベトナム語）</label>
								<textarea id="contentVi" name="contentVi"  <%if(post.getNoiDungVi() == null || post.getNoiDungVi().trim() == ""){%> disabled="disabled" <%} %> class="ckeditor"><%if(post.getNoiDungVi()!=null){%><%=post.getNoiDungVi() %><%} %></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Nội dung (Tiếng Nhật) - 内容（日本語）</label>
								<textarea id="contentJa" name="contentJa"  <%if(post.getNoiDungJa() == null || post.getNoiDungJa().trim() == ""){%> disabled="disabled" <%} %> class="ckeditor"><%if(post.getNoiDungJa()!=null){%><%=post.getNoiDungJa() %><%} %></textarea>
							</div>
						</div>
					</div>
					<!-- Mô tả -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Mô tả (Tiếng Việt) - 説明（ベトナム語）</label>
								<textarea id="descriptionVi" name="descriptionVi" rows="5" cols="10"  <%if(post.getMoTaVi() == null || post.getMoTaVi().trim() == ""){%> disabled="disabled" <%} %> class="form-control"><%if(post.getMoTaVi()!=null){%><%=post.getMoTaVi() %><%} %></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Mô tả (Tiếng Nhật) - 説明（日本語）</label>
								<textarea id="descriptionJa" name="descriptionJa" rows="5" cols="10"  <%if(post.getMoTaJa() == null || post.getMoTaJa().trim() == ""){%> disabled="disabled" <%} %> class="form-control"><%if(post.getMoTaJa()!=null){%><%=post.getMoTaJa() %><%} %></textarea>
							</div>
						</div>
					</div>
					<!-- Lượt xem -->
					<div class="form-group">
						<label>Lượt xem - 観覧回数</label>
						<input type="text" name="view" class="form-control" value="<%=post.getLuotXem()%>" readonly="readonly">
					</div>
					
					<!-- Liên kết -->
					<div class="form-group">
						<label>Liên kết - 連結</label>
						<input type="text" name="link" class="form-control" value="<%if(post.getLienKet()!=null){%><%=post.getLienKet()%><%} %>" readonly="readonly">
					</div>
					
					<!-- Ngày đăng -->
					<div class="form-group">
						<label>Ngày đăng - 掲載の日付</label>
						<input type="text" name="date" class="form-control" value="<%if(post.getNgayDang()!=null){ %><%=post.getNgayDang()%><%} %>" readonly="readonly">
					</div>
					<!-- Ghim trang chủ -->
					<div class="form-group">
						<label>Ghim trang chủ - ホームページに固定する。</label>
						<select class="form-control" id="ghim" name="ghim">
							<option value="1" <%if(post.getGimTrangChu()==1){ %> selected="selected" <%} %> disabled="disabled" >Ghim trang chủ - ホームページに固定する。</option>
							<option value="0" <%if(post.getGimTrangChu()==0){ %> selected="selected" <%} %> disabled="disabled">Không ghim trang chủ - ホームページに固定することができない</option>									
						</select>
					</div>
					<div class="col-md-6 col-md-offset-3 form-group">
						<button class="btn btn-primary" type="submit">Chỉnh sửa - 修正</button>
						<a href="<%if(from.equals("list")){%>ListPostsServlet<%}else{%>ShowDetailPostsServlet?id=<%=post.getIdBaiViet()%><%}%>"><button type="button" class="btn btn-default">Quay lại - 戻り</button></a>
					</div>
				</form>
			</div>
			<%
				}else{
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Bài viết- 記事</div>
				<div class="panel-body">
					Không có bài viết trong cơ sở dữ liệu - データベースに記事を存しない。<br>					
				</div>
			</div>
			<%} %>
			</div>
		</div>
	</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
<!-- __________________________________JS_________________________________ -->
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
</html>