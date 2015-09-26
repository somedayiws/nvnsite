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
<script type="text/javascript" src="js/detailPost.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/detailPost.css">
<title>Chi tiết bài viết</title>
</head>

<%
	//Receive data from server
	BAIVIET posts = (BAIVIET) request.getAttribute("post");
	String result_Send = (String) request.getAttribute("result");
	String status =(String)request.getAttribute("status");	
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="content">


			<!-- Show result posts in database -->
			<%
				if (posts != null) {
			%>
			<div class="col-md-10 col-md-offset-1">
				<div class="col-md-3">
					<div id="divInfor">
					<strong>User - ユーザー:<%=posts.getTaiKhoan().getTenTaiKhoan()%><br>
							Email - :<%=posts.getTaiKhoan().getEmail() %> 
									<br> ID:<%=posts.getIdBaiViet()%><br> Trạng thái -
									状態:<%=posts.getTrangThai()%><br> Lượt xem - 見晴らし:<%=posts.getLuotXem()%><br>
									Ngày đăng - 日付:<%=posts.getNgayDang()%><br>
									<%if(posts.getGimTrangChu()==1){ %>Có<%}else{ %>Không<%} %> ghim lên trang chủ
								</strong>
					</div>
				</div>
<!-- 				<div class="col-md-3" > -->
<!-- 					<div id="background" -->
<!-- 						style="position: relative; background-color: #8D8D8D"> -->
<!-- 						Image -->
<!-- 						<div id="Infor" style="position: fixed;margin-top: 10px"> -->
<!-- 							<div class="col-md-10"> -->
<!-- 								<div id="ImageAccount" -->
<!-- 									style="overflow: hidden; border: 1px solid #999999"> -->
<!-- 									<img alt="Image" src="../images/unknown.png" width="100%" -->
<!-- 										height="100px"> <a href="#" -->
<!-- 										style="width: 200px; padding-left: 5%; padding-top: 80px;" -->
<!-- 										id="image" class="details">Chỉnh sửa - 編集ト</a> -->

<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							Information user -->
<!-- 							<div class="col-md-12 "> -->
<%-- 								<strong>User - ユーザー:<%=posts.getTaiKhoan().getTenTaiKhoan()%> --%>
<%-- 									<br> ID:<%=posts.getIdBaiViet()%><br> Trạng thái - --%>
<%-- 									状態:<%=posts.getTrangThai()%><br> Lượt xem - 見晴らし:<%=posts.getLuotXem()%><br> --%>
<%-- 									Ngày đăng - 日付:<%=posts.getNgayDang()%><br> --%>
<!-- 								</strong> -->
<!-- 														<a><button class="btn btn-primary" style="float: right;"><span class="glyphicon glyphicon-eye-open"></span></button></a> -->


<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="col-md-9 " id="content" style="margin-top: 5%">
					<div class="col-md-12 ">
					<%if(status!=null && status.equals("DangBai")){ %>
						<div class="panel panel-primary">
      <div class="panel-heading">Thông báo</div>
      <div class="panel-body">Bài đăng đã dịch, chờ duyệt</div>
    </div>
    <%} %>
						<a href=" <%if((posts.getTrangThai().equals("DangDich")||posts.getTrangThai().equals("KhongDich")|| posts.getTrangThai().equals("SoanThao") || posts.getTrangThai().equals("OK")) || (status!=null && !status.equals("HuyDich"))){ %>#<%}else{ %>SendPostServlet?idPost=<%=posts.getIdBaiViet()%>&status=<%=posts.getTrangThai()%><%}%>">
						<button
								class="btn btn-primary btn-sm" <%if((posts.getTrangThai().equals("DangDich")||posts.getTrangThai().equals("KhongDich")|| posts.getTrangThai().equals("SoanThao") || posts.getTrangThai().equals("OK")) || (status!=null && !status.equals("HuyDich"))){ %> disabled="disabled" <%} %>><span class="glyphicon glyphicon-send"></span> Chuyển bài</button>
						</a> 
						<a
							href="<%if(posts.getTrangThai().equals("OK") || posts.getTrangThai().equals("DangDich") || posts.getTrangThai().equals("SoanThao")){ %>#<%}else{%>ShowAdminEditPostsServlet?idPost=<%=posts.getIdBaiViet()%>&from=detail<%}%>"><button <%if(posts.getTrangThai().equals("OK") || posts.getTrangThai().equals("DangDich") || posts.getTrangThai().equals("SoanThao")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span> Chỉnh sửa</button>
						</a>
						<a
							href="<%if(posts.getTrangThai().equals("OK")|| posts.getTrangThai().equals("DangDich") || posts.getTrangThai().equals("SoanThao")){ %>#<%}else{ %>TranslateServlet?idPost=<%=posts.getIdBaiViet()%><%}%>"><button <%if(posts.getTrangThai().equals("OK")|| posts.getTrangThai().equals("DangDich") || posts.getTrangThai().equals("SoanThao")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-subtitles"></span> Dịch bài</button>
						</a>
						<a
							href="<%if(posts.getTrangThai().equals("OK")){ %>#<%}else{%>UploadPostServlet?idPost=<%=posts.getIdBaiViet()%><%}%>"><button <%if(posts.getTrangThai().equals("OK")){ %> disabled="disabled"  <%}%>
								class="btn btn-primary btn-sm <%if(status!=null && status.equals("Ok")){ %> btn_animation <%} %>"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài</button>
						</a>
<!-- 						<a -->
<%-- 							href="SendAgainServlet?idPost=<%=posts.getIdBaiViet()%>"><button <%if(status!=null && !status.equals("LoiDich")){ %> disabled="disabled"  <%} %> --%>
<!-- 								class="btn btn-primary"><span class="glyphicon glyphicon-pushpin" ></span>Gởi lại</button> -->
<!-- 						</a> -->
						
						<a href="ListPostsServlet"><button class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-share-alt"></span>Quay
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
					<div id="ContentVi" class="col-md-6 content">
					<button id="btnVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnbackVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-backward"></span></button>
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
						<div class="row">
							<div class="col-md-10">
						<label><span class="glyphicon glyphicon-comment"></span><%=posts.getBinhLuanVi().get(i).getTaiKhoan()
								.getTenTaiKhoan()%>								
						</label>
							</div>
							<div class="col-md-2">
								<label><span id="<%=posts.getBinhLuanVi().get(i).getIdComent() %>" class="glyphicon glyphicon-remove removeIcon"></span></label>
							</div>
						</div>						
						<p><%=posts.getBinhLuanVi().get(i).getNgayDang()%></p>
						<p class="pcomment"><%=posts.getBinhLuanVi().get(i).getPhanHoiVi()%></p>
						<%
							}
								}
						%>
					</div>
					<div id="ContentJa" class="col-md-6 content">
					<button id="btnbackJa" class="btn btn-primary"><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnJa"  class="btn btn-primary"><span class="glyphicon glyphicon-fast-backward"></span></button>
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
						<div class="row">
						<div class="col-md-10">
						<label><span class="glyphicon glyphicon-comment"></span><%=posts.getBinhLuanJa().get(i).getTaiKhoan()
								.getTenTaiKhoan()%></label>
						</div>
						<div class="col-md-2">
								<label><span id="<%=posts.getBinhLuanJa().get(i).getIdComent() %>" class="glyphicon glyphicon-remove removeIcon"></span></label>
						</div>
						</div>
						<p><%=posts.getBinhLuanVi().get(i).getNgayDang()%></p>
						<p class="pcomment"><%=posts.getBinhLuanJa().get(i).getPhanHoiJa()%></p>
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
				</div>
			</div>
			<%
				}
			%>
			<!-- End show -->

		</div>
<div id="resultMessage" style="display:none;"></div>
	</div>
	
</body>
<script type="text/javascript">
$(".removeIcon").click(function(){	
		$.ajax({
			url : "RemoveCommentSetvlet", //file 
			type : "POST", //phuong thức gưi
			data : {
				id 	: this.id					
			}, //dữ liệu gửi
			async : true, //
			success : function(res) {	
				$("#resultMessage").html(res);
				alert($("#resultMessage").children("#result").text());	
				window.location = "ShowDetailPostsServlet?id=<%=posts.getIdBaiViet()%>"
			},
			error : function() {
				alert('Có lỗi xảy ra');
				$("#load").html("");
			}
		});	

});
</script>
</html>