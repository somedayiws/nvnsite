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
<script src="../ckeditor/ckeditor.js"></script>
<title>Detail Posts</title>
<style type="text/css">
h3 {
	text-align: center;
}

.ribbon2 {
	font: bold 16px Cambria, Georgia, Times, Serif;
	color: #fff;
	background: #01943C;
	position: relative;
	line-height: 48px;
	box-shadow: 10px 10px 50px green;
	margin-right: 10px;
	margin-top: 80px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	background: #01943C;
}

.ribbon2:before {
	content: "";
	position: absolute;
	top: 0px;
	right: 100%;
	width: 0px;
	height: 0px;
	border: 24px solid #01943C;
	border-left-color: transparent;
	box-shadow: 10px 10px 50px green;
}

.ribbon2:after {
	content: "";
	position: absolute;
	top: 0px;
	left: 100%;
	width: 0px;
	height: 0px;
	border: 24px solid transparent;
	border-left-color: #01943C;
}

input {
	margin-bottom: 50px;
}

.ribbon5 {
	font: bold 16px Cambria, Georgia, Times, Serif;
	color: #fff;
	width: 70%;
	text-align: center;
	padding: 0px 30px;
	background: #AF3605;
	position: relative;
	line-height: 48px;
	margin: 20px auto;
}

.ribbon5:before {
	content: "";
	position: absolute;
	top: 100%;
	left: 0px;
	width: 0px;
	height: 0px;
	border-width: 5px;
	border-style: solid;
	border-color: #76290A #76290A transparent transparent;
}

.ribbon5:after {
	content: "";
	position: absolute;
	top: 100%;
	right: 0px;
	width: 0px;
	height: 0px;
	border-width: 5px;
	border-style: solid;
	border-color: #76290A transparent transparent #76290A;
}

.ribbon5 div {
	width: 100%;
}

.ribbon5 div:before, .ribbon5 div:after {
	content: "";
	position: absolute;
	width: 0px;
	height: 0px;
	border: 24px solid #983912;
	top: 10px;
	z-index: -1;
}

.ribbon5 div:before {
	border-left-color: transparent;
	right: 100%;
	margin-right: -10px;
}

.ribbon5 div:after {
	border-right-color: transparent;
	left: 100%;
	margin-left: -10px;
}

.btn {
	border: none;
	font-family: inherit;
	font-size: inherit;
	color: inherit;
	background: none;
	cursor: pointer;
	padding: 10px;
	display: inline-block;
	margin: 15px 30px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	outline: none;
	position: relative;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	cursor: pointer;
}

.btn:after {
	content: '';
	position: absolute;
	z-index: -1;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	position: absolute;
}

/* Pseudo elements for icons */
.btn:before, .icon-heart:after, .icon-star:after, .icon-plus:after,
	.icon-file:before {
	font-family: 'icomoon';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	position: relative;
	-webkit-font-smoothing: antialiased;
}

.btn-1 {
	border: 3px solid green;
	color: green;
}

.btn-1c:after {
	width: 0%;
	height: 100%;
	top: 0;
	left: 0;
}

.btn-1c:hover, .btn-1c:active {
	color: white;
}

.btn-1c:hover:after, .btn-1c:active:after {
	background: green;
	width: 100%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		if ($(document).width() < 1300) {
			$("#ribbon").hide();
		}

		// 		  $("button").click(function(){
		// // 		        var txt = "";
		// // 		        txt += "Document width/height: " + $(document).width();
		// // 		        txt += "x" + $(document).height() + "\n";
		// // 		        txt += "Window width/height: " + $(window).width();
		// // 		        txt += "x" + $(window).height();

		// 		    });

	});
</script>
</head>

<%
	//Receive data from server
	BAIVIET post = (BAIVIET) request.getAttribute("post");
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div style="margin-top: 10px">


			<!-- Show result posts in database -->
			<%
				if (post != null) {
			%>
			<div>
				<div class="col-md-2" id="ribbon" style="overflow: hide">
					<div id="ribbon2" class="ribbon2">Tên bài viết - タイトル</div>
					<div id="ribbon2" class="ribbon2">Mô tả - 説明します</div>
					<div id="ribbon2" class="ribbon2"
						style="position: fixed; width: 180px">Nội dung - コンテンツ</div>
					<!-- 					<button>Click me</button> -->
				</div>
				<div class="col-md-5"
					style="border: 1px solid green; border-radius: 20px;">
					<div style="position: relative; z-index: 1;">
						<div class="ribbon5">
							<div>Việt Nam</div>
						</div>
					</div>
					<div>
						<input type="text" name="namePostVi" class="form-control"
							placeholder="Tên bài viết việt nam" style="margin-top: 10px" value="<%if(post.getTenBaiVietVi() !=null){ %><%=post.getTenBaiVietVi()%><%}%>">
						<textarea class="form-control" rows="4" id="decription"
							name="decriptionVi" placeholder="Mô tả Việt Nam"><%if(post.getMoTaVi() !=null){ %><%=post.getMoTaVi() %><%}%></textarea>
						<textarea id="contentVi" name="contentVi" class="ckeditor"><%if(post.getNoiDungVi() !=null){ %><%=post.getNoiDungVi() %><%}%></textarea>
					</div>
				</div>
				<div class="col-md-5"
					style="border: 1px solid green; border-radius: 20px;">
					<div style="position: relative; z-index: 1;">
						<div class="ribbon5">
							<div>日本</div>
						</div>
					</div>
					<input type="text" name="namePostJa" class="form-control"
						placeholder="タイトル" style="margin-top: 10px" value="<%if(post.getTenBaiVietJa() !=null){ %><%=post.getTenBaiVietJa() %><%}%>">
					<textarea class="form-control" rows="4" id="decription"
						name="decriptionJa" placeholder="説明します"><%if(post.getMoTaJa() !=null){ %><%=post.getMoTaJa() %><%}%></textarea>
					<textarea id="contentJa" name="contentJa" class="ckeditor"><%if(post.getNoiDungJa() !=null){ %><%=post.getNoiDungJa() %><%}%></textarea>
				</div>
				<div class="col-md-8 col-md-offset-4" sty>

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