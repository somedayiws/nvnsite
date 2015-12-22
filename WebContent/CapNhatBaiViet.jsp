<%@page import="java.util.Date"%>
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
<title>Cập nhật bài viết - 記事をまだアップデートしない</title>
<%@include file="script.jsp"%>
<script src="ckeditor/ckeditor.js"></script>
<style type="text/css">
.modal-body img {
	width: 100%;
}

.modal-content {
	max-width: 100%;
}
</style>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Bài viết chỉnh cần chỉnh sửa */
			BAIVIET baiviet = (BAIVIET)request.getAttribute("baiviet");
	%>
	<div id="wrapper">
		<%@include file="header.jsp"%>
		<input type="hidden" id="sotu"
			value="<%=request.getAttribute("sotu")%>"> <input
			type="hidden" id="giavn" value="<%=request.getAttribute("giaVN")%>">
		<input type="hidden" id="giaja"
			value="<%=request.getAttribute("giaJA")%>">

		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet">
				<form action="Cap-nhat-bai-viet" method="post" id="fdangbai"
					enctype="multipart/form-data">
					<!-- hiển thị nội dung chính ở đây -->
					<%
						int ngonngu = 0;
						if(baiviet.getTenBaiVietVi()!=null && baiviet.getTenBaiVietJa()!=null) 
							ngonngu=2;
						else if(baiviet.getTenBaiVietJa()!=null) 
							ngonngu=1;
					%>
					<input type="hidden" name="id" value="<%=baiviet.getIdBaiViet()%>">
					<input type="hidden" name="NgonNgu" value="<%=ngonngu%>">
					<%
						if(ngonngu==0) {
					%>
					<div class="donngu">
						<div class="form-group">
							<label>Tiêu đề - タイトル</label> <input id="TieuDe" name="TieuDe"
								type="text" class="form-control"
								value="<%=baiviet.getTenBaiVietVi()%>"></input>
						</div>
						<div class="form-group">
							<label>Mô tả - 説明</label>
							<textarea id="MoTa" name="MoTa" rows="5" cols="30" 
								class="form-control"><%=baiviet.getMoTaVi()%></textarea>
						</div>
					</div>
					<%
						} else if(ngonngu==1) {
					%>
					<div class="donngu">
						<div class="form-group">
							<label>Tiêu đề - タイトル</label> <input id="TieuDe" name="TieuDe"
								type="text" class="form-control"
								value="<%=baiviet.getTenBaiVietJa()%>"></input>
						</div>
						<div class="form-group">
							<label>Mô tả - 説明</label>
							<textarea id="MoTa" name="MoTa" rows="5" cols="30"
								class="form-control"><%=baiviet.getMoTaJa()%></textarea>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="dangu">
						<div class="col-sm-6 col-md-6 tviet">
							<div class="form-group">
								<label>Tiêu đề</label> <input id="TieuDeVi" name="TieuDeVi"
									type="text" class="form-control"
									value="<%=baiviet.getTenBaiVietVi()%>"></input>
							</div>
							<div class="form-group">
								<label>Mô tả</label>
								<textarea id="MoTaVi" name="MoTaVi" rows="5" cols="30"
									class="form-control"><%=baiviet.getMoTaVi()%></textarea>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 tnhat">
							<div class="form-group">
								<label>タイトル</label> <input id="TieuDeJa" name="TieuDeJa"
									type="text" class="form-control"
									value="<%=baiviet.getTenBaiVietJa()%>"></input>
							</div>
							<div class="form-group">
								<label>概要</label>
								<textarea id="MoTaJa" name="MoTaJa" rows="5" cols="30"
									class="form-control"><%=baiviet.getMoTaJa()%></textarea>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<div class="form-group">
						<label>Thể loại - 種類</label> <select id="TheLoai" name="TheLoai"
							class="form-control">
							<%
								i = 0;
								while(listdanhmuc != null && i < listdanhmuc.size()) {
								if(!listdanhmuc.get(i).getIdDanhMuc().equals(baiviet.getDanhMuc().getIdDanhMuc())) {
							%>
							<option value="<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>
								-
								<%=listdanhmuc.get(i).getTenDanhMucJa()%></option>
							<%
								} else {
							%>
							<option selected="selected"
								value="<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>
								-
								<%=listdanhmuc.get(i).getTenDanhMucJa()%></option>
							<%
								} i++; }
							%>
						</select>
					</div>
					<%
						if(ngonngu==0) {
					%>
					<div class="donngu">
						<div class="form-group">
							<label>Nội dung - 内容</label>
							<textarea id="NoiDung" name="NoiDung" class="ckeditor"><%=baiviet.getNoiDungVi()%></textarea>
						</div>
					</div>
					<%
						} else if(ngonngu==1){
					%>
					<div class="donngu">
						<div class="form-group">
							<label>Nội dung - 内容</label>
							<textarea id="NoiDung" name="NoiDung" class="ckeditor"><%=baiviet.getNoiDungJa()%></textarea>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="dangu">
						<div class="col-sm-6 col-md-6 tviet">
							<div class="form-group">
								<label>Nội dung</label>
								<textarea id="NoiDungVi" name="NoiDungVi" class="ckeditor"><%=baiviet.getNoiDungVi()%></textarea>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 tnhat">
							<div class="form-group">
								<label>内容</label>
								<textarea id="NoiDungJa" name="NoiDungJa" class="ckeditor"><%=baiviet.getNoiDungJa()%></textarea>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<div class="col-sm-12 col-md-12">
						<div class="form-group">
							<label>Hình ảnh - 画像</label> <input type="file" id="HinhAnh"
								name="HinhAnh" onchange="xem(this);" />
							<p class="help-block">
								Chọn file .png, .jpg ...<br>png, .jpg ...のファイルを選択して下さい<br> <input type="hidden"
									name="linkan" value="<%=baiviet.getLienKet()%>"> <img
									alt="Ảnh đại diện-プロファイルの画像" src="<%=baiviet.getLienKet()%>" id="fu1">
								<img alt="Ảnh thay thế-交換の画像" src="" id="fu2">
							</p>
						</div>
						<input type="hidden" id="dichbai" name="dichbai" value="khong">
						<input type="hidden" id="dangbai" name="dangbai" value="Đăng bài -">
						<div class="form-group">
							<input type="submit" value="Lưu bài - 記事を保存する" name="luubai"
								class="btn btn-success" onclick="LuuBai();" /> <input type="button"
								value="Đăng bài - 投稿" onclick="DichBai1();" name="dangbai"
								class="btn btn-success" data-toggle="modal"
								data-target="#xacnhandich" /> <input type="button"
								value="Quay lại - 戻り " class="btn" onclick="history.go(-1);" />
						</div>
					</div>
				</form>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="xacnhandich" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Dịch bài viết song
								ngữ Việt-Nhật</br>ベトナム語-日本語を翻訳する。</h4>
						</div>
						<div class="modal-body">
							Báo giá dịch thuật Việt-Nhật <br>ベトナム語-日本語の翻訳の価格です。 </br> <img alt=""
								src="<%=request.getAttribute("banggiadich")%>"> <br>
							<label id="thongbaodich"></label> </br>Bạn
							có muốn dịch bài viết này không??? </br>あなたはこの記事を翻訳したいですか？
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" onclick="DichBai(false);">Không
								dịch-いいえ</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" onclick="DichBai(true);">Dịch bài-はい</button>
						</div>
					</div>
				</div>
			</div>
			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
<script type="text/javascript" src="js/edit.post.client.min.js"></script>
</html>