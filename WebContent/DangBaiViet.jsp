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
<title>Đăng bài viết - 記事を掲載する</title>
<!-- ck -->
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
	<div id="wrapper">
	<%@include file="header.jsp"%>
	<input type="hidden" id="sotu" value="<%= request.getAttribute("sotu") %>">
	<input type="hidden" id="giavn" value="<%= request.getAttribute("giaVN") %>">
	<input type="hidden" id="giaja" value="<%= request.getAttribute("giaJA") %>">
	<div id="mainContent">
		<!-- hiển thị nội dung chính ở đây -->
		<div class="col-sm-9 col-md-9" id="baiviet">
			<form action="Dang-bai-viet" method="post" id="fdangbai"
				enctype="multipart/form-data">
				<!-- hiển thị nội dung chính ở đây -->
				<div class="form-group">
					<label>Ngôn ngữ - 言語</label> <select id="NgonNgu"
						name="NgonNgu" class="form-control" onchange="hienan();">
						<option value=""></option>
						<option value="0">Tiếng Việt - ベトナム語</option>
						<option value="1">Tiếng Nhật - 日本語</option>
						<option value="2">Song ngữ - 両方の言語</option>
					</select>
				</div>
				<div class="donngu">
					<div class="form-group">
						<label>Tiêu đề - タイトル</label> <input id="TieuDe" name="TieuDe"
							type="text" class="form-control" onblur="check();"></input>
					</div>
					<div class="form-group">
						<label>Mô tả - 説明</label>
						<textarea id="MoTa" name="MoTa" rows="5" cols="30"
							class="form-control"></textarea>
					</div>
				</div>
				<div class="dangu" style="display: none;">
					<div class="col-sm-6 col-md-6 tviet">
						<div class="form-group">
							<label>Tiêu đề</label> <input id="TieuDeVi" name="TieuDeVi"
								type="text" class="form-control" onblur="check();"></input>
						</div>
						<div class="form-group">
							<label>Mô tả</label>
							<textarea id="MoTaVi" name="MoTaVi" rows="5" cols="30"
								class="form-control"></textarea>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 tnhat">
						<div class="form-group">
							<label>タイトル</label> <input id="TieuDeJa" name="TieuDeJa"
								type="text" class="form-control" onblur="check();"></input>
						</div>
						<div class="form-group">
							<label>説明</label>
							<textarea id="MoTaJa" name="MoTaJa" rows="5" cols="30"
								class="form-control"></textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>Danh Mục - 項目</label> 
					<div id="ghichu">(Chọn đúng danh mục - 項目を正しく選択する)</div>
					<select id="TheLoai" name="TheLoai"
						class="form-control">
						<option value=""></option>
						<%
							i = 0;
									while(listdanhmuc != null && i < listdanhmuc.size()) {
						%>
						<option value="<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>
							-
							<%=listdanhmuc.get(i).getTenDanhMucJa()%></option>
						<%
							i++; }
						%>
					</select>
				</div>
				<div class="donngu">
					<div class="form-group">
						<label>Nội dung - 内容</label>
						<textarea id="NoiDung" name="NoiDung" class="ckeditor"></textarea>
					</div>
				</div>
				<div class="dangu" style="display: none;">
					<div class="col-sm-6 col-md-6 tviet">
						<div class="form-group">
							<label>Nội dung</label>
							<textarea id="NoiDungVi" name="NoiDungVi" class="ckeditor"></textarea>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 tnhat">
						<div class="form-group">
							<label>内容</label>
							<textarea id="NoiDungJa" name="NoiDungJa" class="ckeditor"></textarea>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-12">
					<div class="form-group">
						<label>Hình ảnh - 画像</label> <input type="file" id="HinhAnh"
							name="HinhAnh" onchange="xem(this);" />
						<p class="help-block">
							Chọn file .png, .jpg ...<br>png, .jpg ...のファイルを選択して下さい<br> <img alt="Ảnh đại diện" src=""
								id="fu2">
						</p>
					</div>
					<input type="hidden" id="dichbai" name="dichbai" value="luu">
					<input type="hidden" id="dangbai" name="dangbai" value="Đăng bài -">
					<div class="form-group">
						<input type="submit" value="Lưu bài - 記事を保存する"  onclick="LuuBai();" name="luubai" class="btn btn-success" />
						<input type="button" value="Đăng bài - 投稿" onclick="DichBai1();" name="dangbai" class="btn btn-success" data-toggle="modal" data-target="#xacnhandich"/> 
						<input type="button" value="Quay lại - 戻り" class="btn" onclick="history.go(-1);" />
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
		<!-- Quảng cáo lung tung -->
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="clearfix"></div>
	<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
<script type="text/javascript" src="js/edit.post.client.min.js">
</script>
</html>