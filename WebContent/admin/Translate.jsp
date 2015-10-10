<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="model.bean.BAIVIET"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<!-- __________________________________CSS______________________________ -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/translate.css">

<title>Dịch bài - 記事を翻訳する。</title>
</head>

<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	//Receive data from server
	BAIVIET post = (BAIVIET) request.getAttribute("post");
%>

<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="content">
			<!-- Show result posts in database -->
			<%
				if (post != null) {
			%>
			<div>
				<form action ="UploadPostServlet?idPost=<%=post.getIdBaiViet()%>&type=translate" method="post">
				<div class="col-md-2" id="ribbon">
					<div id="ribbon2" class="ribbon2">Tên bài viết - 記事名</div>
					<div id="ribbon2" class="ribbon2">Mô tả - 説明</div>
					<div id="ribbon3" class="ribbon2">Nội dung - 内容</div>					
				</div>
				<div class="col-md-5" id = "contentVi">
					<div id = "headerVi">
						<div class="ribbon5">
							<div>Việt Nam - 項目名</div>
						</div>
					</div>
					<div>
						<input type="text" name="namePostVi" class="form-control"
							placeholder="Tên bài viết Việt Nam - 記事名ベトナム語" id="namePostVi" value="<%if(post.getTenBaiVietVi() !=null){ %><%=post.getTenBaiVietVi()%><%}%>">
						<textarea class="form-control" rows="4" id="decription"
							name="decriptionVi" placeholder="Mô tả Việt Nam - 説明ベトナム語"><%if(post.getMoTaVi() !=null){ %><%=post.getMoTaVi() %><%}%></textarea>
						<textarea id="contentVi" placeholder="Nội dung Việt Nam - 内容ベトナム語" name="contentVi" class="ckeditor"><%if(post.getNoiDungVi() !=null){ %><%=post.getNoiDungVi() %><%}%></textarea>
					</div>
				</div>
				<div class="col-md-5" id="contentJa">
					<div id = "headerJa">
						<div class="ribbon5">
							<div>Nhật Bản - 項目名</div>
						</div>
					</div>
					<input type="text" name="namePostJa" class="form-control"
						placeholder="Tên bài viết Nhật Bản - 記事名日本語" id="namePostJa" value="<%if(post.getTenBaiVietJa() !=null){ %><%=post.getTenBaiVietJa() %><%}%>">
					<textarea class="form-control" rows="4" id="decription"
						name="decriptionJa" placeholder="Mô tả Nhật Bản - 説明日本語"><%if(post.getMoTaJa() !=null){ %><%=post.getMoTaJa() %><%}%></textarea>
					<textarea id="contentJa" placeholder="Nội dung Nhật Bản - 内容日本語" name="contentJa" class="ckeditor"><%if(post.getNoiDungJa() !=null){ %><%=post.getNoiDungJa() %><%}%></textarea>
				</div>
				<div class="col-md-8 col-md-offset-4" >

						<button class="btn btn-1 btn-1c"  name="btn" value="btnSave" type="submit">
							<span class="glyphicon glyphicon-floppy-save"></span>Lưu bài - 記事を保存する。
						</button>
					<button class="btn btn-1 btn-1c" name = "btn" value="btnOk" type="submit">
							<span class="glyphicon glyphicon-send"></span>Duyệt bài - 記事を承認する。
					</button>
					 <a href="ShowDetailPostsServlet?id=<%=post.getIdBaiViet()%>&type=back&btn=btnBack">
					 	<button type="button" class="btn btn-1 btn-1c">
							<span class="glyphicon glyphicon-share-alt"></span>Quay lại - 戻り
						</button>
					</a>
				</div>
				</form>
			</div>
			<%
				} else {
			%>
			<div class="alert alert-warning">
				<strong>Cảnh bảo -  警告する。!</strong> Trang web không tìm thấy - ウェブページを見つからない
			</div>
			<%
				}
			%>
			<!-- End show -->
		</div>
	</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
<!-- ___________________________________JS__________________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/translate.js"></script>
</html>