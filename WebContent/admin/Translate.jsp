<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="model.bean.BAIVIET"%>
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
<link rel="stylesheet" href="css/translate.css">
<script src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/translate.js"></script>
<title>Dịch bài</title>
</head>

<%
	//Receive data from server
	BAIVIET post = (BAIVIET) request.getAttribute("post");
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div id="content">


			<!-- Show result posts in database -->
			<%
				if (post != null) {
			%>
			<div>
				<div class="col-md-2" id="ribbon" style="overflow: hide">
					<div id="ribbon2" class="ribbon2">Tên bài viết - タイトル</div>
					<div id="ribbon2" class="ribbon2">Mô tả - 説明します</div>
					<div id="ribbon3" class="ribbon2">Nội dung - コンテンツ</div>					
				</div>
				<div class="col-md-5" id = "contentVi">
					<div id = "headerVi">
						<div class="ribbon5">
							<div>Việt Nam</div>
						</div>
					</div>
					<div>
						<input type="text" name="namePostVi" class="form-control"
							placeholder="Tên bài viết việt nam" id="namePostVi" value="<%if(post.getTenBaiVietVi() !=null){ %><%=post.getTenBaiVietVi()%><%}%>">
						<textarea class="form-control" rows="4" id="decription"
							name="decriptionVi" placeholder="Mô tả Việt Nam"><%if(post.getMoTaVi() !=null){ %><%=post.getMoTaVi() %><%}%></textarea>
						<textarea id="contentVi" name="contentVi" class="ckeditor"><%if(post.getNoiDungVi() !=null){ %><%=post.getNoiDungVi() %><%}%></textarea>
					</div>
				</div>
				<div class="col-md-5" id="contentJa">
					<div id = "headerJa">
						<div class="ribbon5">
							<div>日本</div>
						</div>
					</div>
					<input type="text" name="namePostJa" class="form-control"
						placeholder="タイトル" id="namePostJa" value="<%if(post.getTenBaiVietJa() !=null){ %><%=post.getTenBaiVietJa() %><%}%>">
					<textarea class="form-control" rows="4" id="decription"
						name="decriptionJa" placeholder="説明します"><%if(post.getMoTaJa() !=null){ %><%=post.getMoTaJa() %><%}%></textarea>
					<textarea id="contentJa" name="contentJa" class="ckeditor"><%if(post.getNoiDungJa() !=null){ %><%=post.getNoiDungJa() %><%}%></textarea>
				</div>
				<div class="col-md-8 col-md-offset-4" >

					<a href="SavePostServlet?idPost=<%=post.getIdBaiViet()%>"><button class="btn btn-1 btn-1c">
							<span class="glyphicon glyphicon-floppy-save"></span>Lưu bài -
							セーブ
						</button></a> <a href="UploadPostServlet?idPost=<%=post.getIdBaiViet()%>"><button class="btn btn-1 btn-1c">
							<span class="glyphicon glyphicon-send"></span>Gởi bài - 送信
						</button></a> <a href="ShowDetailPostsServlet?id=<%=post.getIdBaiViet()%>"><button class="btn btn-1 btn-1c">
							<span class="glyphicon glyphicon-share-alt"></span>Quay lại - バック
						</button></a>
				</div>
			</div>
			<%
				} else {
			%>
			<div class="alert alert-warning">
				<strong>Cảnh bảo - 警告 !</strong> Trang web không tìm thấy - ウェブサイトが見つかりません
			</div>
			<%
				}
			%>
			<!-- End show -->

		</div>

	</div>
</body>
</html>