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
<title>Detail Posts</title>
<style type="text/css">
h3 {
	text-align: center;
}

#ImageAccount {
	position: relative;
	height: 102px;
}

#ImageAccount img {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 0;
}

#ImageAccount .details {
	opacity: .9;
	position: absolute;
	top: 50;
	left: 150;
	z-index: 999;
	-webkit-transform: scale(0);
	-webkit-transition-timing-function: ease-out;
	-webkit-transition-duration: 250ms;
}

#ImageAccount:hover .details {
	-webkit-transform: scale(1);
	-webkit-transition-timing-function: ease-out;
	-webkit-transition-duration: 250ms;
}
.content{
	border: 1px solid black;
		-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
}
.content:hover{
	box-shadow: 10px 10px 20px black;
}
#message{
	border: 2px solid #505050;
	border-radius:10px;
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#background").css("height",$(window).height());
	$(".idAcc").click(function(){
		$("#message").slideToggle(1000);
		});
		
		if ($(window).width() < 1300) {
			$("#Infor").css("position", "inherit")
			$("#ImageAccount").css("display","none");
			$("#background").css({"height": "0", "magrin-bottom": "10px"});
			$("#content").css("margin-top","15%");
			$("#btnVi").css("display","none");
			$("#btnJa").css("display","none");
		}else{
			
			$("#btnVi").click(function(){
				$("#ContentVi").css("width","100%")
				$("#ContentJa").hide();
				$("#btnVi").hide();
				$("#btnbackVi").show();
				})
			$("#btnbackVi").click(function(){
				$("#ContentVi").css("width","50%")
				$("#ContentJa").show(500);
				$("#btnVi").show();
				$("#btnbackVi").hide();
				})
			$("#btnJa").click(function(){
				$("#ContentJa").css("width","100%")
				$("#ContentVi").hide();
				$("#btnJa").hide();
				$("#btnbackJa").show();
				})
			$("#btnbackJa").click(function(){
				$("#ContentVi").show(500);		
				$("#ContentJa").css("width","50%")		
				$("#btnJa").show();
				$("#btnbackJa").hide();
				})
		}
		
// 		$(window).scroll(function(){
// 			alert($(window).height());
// 			$("#background").css("height",$(window).height());
		
// 		$("#btn").click(function(){

			
		//     var txt = "";
		//     txt += "Document width/height: " + $(document).width();
		//     txt += "x" + $(document).height() + "\n";
		//     txt += "Window width/height: " + $(window).width();
		//     txt += "x" + $(window).height();
		//     alert(txt);
// 		});
	});
</script>
</head>

<%
	//Receive data from server
	BAIVIET posts = (BAIVIET) request.getAttribute("post");
	String result_Send = (String) request.getAttribute("result");
	String status =(String)request.getAttribute("status");
	System.out.println("status_detail: "+status);
	System.out.println("status_post_detail: "+posts.getTrangThai());
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div>


			<!-- Show result posts in database -->
			<%
				if (posts != null) {
			%>
			<div class="col-md-10 col-md-offset-1">
				<div class="col-md-3">
					<div id="background"
						style="position: relative; background-color: #8D8D8D">
						<!-- Image -->
						<div id="Infor" style="position: fixed;margin-top: 10px">
							<div class="col-md-10">
								<div id="ImageAccount"
									style="overflow: hidden; border: 1px solid #999999">
									<img alt="Image" src="../images/unknown.png" width="100%"
										height="100px"> <a href="#"
										style="width: 200px; padding-left: 5%; padding-top: 80px;"
										id="image" class="details">Chỉnh sửa - 編集ト</a>

								</div>
							</div>
							<!-- Information user -->
							<div class="col-md-12 ">
								<strong>User - ユーザー:<%=posts.getTaiKhoan().getTenTaiKhoan()%>
									<br> ID:<%=posts.getIdBaiViet()%><br> Trạng thái -
									状態:<%=posts.getTrangThai()%><br> Lượt xem - 見晴らし:<%=posts.getLuotXem()%><br>
									Ngày đăng - 日付:<%=posts.getNgayDang()%><br>
								</strong>
								<!-- 						<a><button class="btn btn-primary" style="float: right;"><span class="glyphicon glyphicon-eye-open"></span></button></a> -->


							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 " id="content" style="margin-top: 5%">
					<div class="col-md-12 ">
						<a href="SendPostServlet?idPost=<%=posts.getIdBaiViet()%>&status=<%=posts.getTrangThai()%>">
						<button
								class="btn btn-primary" <%if((posts.getTrangThai().equals("DangDich") || posts.getTrangThai().equals("OK")) || (status!=null && !status.equals("HuyDich"))){ %> disabled="disabled" <%} %> data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-send"></span> Chuyển bài</button>
						</a> 
								<a
							href="ShowAdminEditPostsServlet?idPost=<%=posts.getIdBaiViet()%>"><button <%if(posts.getTrangThai().equals("OK")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span> Chỉnh sửa</button></a> <a
							href="TranslateServlet?idPost=<%=posts.getIdBaiViet()%>"><button <%if(posts.getTrangThai().equals("OK")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary"><span class="glyphicon glyphicon-subtitles"></span> Dịch bài</button></a>
						<a
							href="UploadPostServlet?idPost=<%=posts.getIdBaiViet()%>"><button <%if(posts.getTrangThai().equals("OK")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài</button></a>
						<a
							href="SendAgainServlet?idPost=<%=posts.getIdBaiViet()%>"><button <%if(posts.getTrangThai().equals("OK")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary"><span class="glyphicon glyphicon-pushpin" ></span>Gởi lại</button></a>
						
						<a href="ListPostsServlet"><button class="btn btn-primary"><span class="glyphicon glyphicon-share-alt"></span>Quay
								lại</button></a>
<!-- 						<button id="btn">Click me</button> -->
					</div>
					<br>
					<hr>
					<%
						if (result_Send != null) {
								if (result_Send.contains("Admin đã chuyển")) {
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Thông báo -</div>
						<div class="panel-body">
							Đã chuyển thành công -<br>
						</div>
					</div>
					<%
						}
							}
					%>
					<div id="ContentVi" class="col-md-6 content" style="padding-right: 0;">
					<button id="btnVi" class="btn btn-primary" style="float:right;background-color:black; "><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnbackVi" class="btn btn-primary" style="float:right;background-color:black; display: none; "><span class="glyphicon glyphicon-fast-backward"></span></button>
						<h3>Việt Nam</h3>
						Tên bài viết:
						<%=posts.getTenBaiVietVi()%><br> Mô tả:
						<%=posts.getMoTaVi()%><br> Nội dung:<%=posts.getNoiDungVi()%>

						<%
							if (posts.getBinhLuanVi() != null) {
						%>
						<hr>
						<%
							for (int i = 0; i < posts.getBinhLuanVi().size(); i++) {
						%>
						<label><span class="glyphicon glyphicon-comment"></span><%=posts.getBinhLuanVi().get(i).getTaiKhoan()
								.getTenTaiKhoan()%></label>
						<p style="margin-left: 5%"><%=posts.getBinhLuanVi().get(i).getPhanHoiVi()%></p>
						<%
							}
								}
						%>
					</div>
					<div id="ContentJa" class="col-md-6 content" style="padding-right: 0;height: 100%">
					<button id="btnbackJa" class="btn btn-primary" style="float:right;background-color:black;display: none; "><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnJa"  class="btn btn-primary" style="float:right;background-color:black; "><span class="glyphicon glyphicon-fast-backward"></span></button>
						<h3>Japan</h3>
						Tên bài viết:
						<%=posts.getTenBaiVietJa()%><br> Mô tả:
						<%=posts.getMoTaJa()%><br> Nội dung:<%=posts.getNoiDungJa()%>
						<%
							if (posts.getBinhLuanJa() != null) {
						%>
						<hr>
						<%
							for (int i = 0; i < posts.getBinhLuanJa().size(); i++) {
						%>
						<label><span class="glyphicon glyphicon-comment"></span><%=posts.getBinhLuanJa().get(i).getTaiKhoan()
								.getTenTaiKhoan()%></label>
						<p style="margin-left: 5%"><%=posts.getBinhLuanJa().get(i).getPhanHoiJa()%></p>
						<%
							}
								}
						%>
					</div>

				</div>
			</div>

			<%
				} else {
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Thông báo - お知らせ</div>
				<div class="panel-body">
					Không có bài viết trong cơ sở dữ liệu - データベース内のエントリがありません<br>
					<a href="../DangBaiVietServlet"><button class="btn btn-success">Tạo
							bài viết - 記事を作成</button></a>
				</div>
			</div>
			<%
				}
			%>
			<!-- End show -->

		</div>

	</div>
</body>
</html>