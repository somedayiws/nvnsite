<%@page import="model.bean.LICHSU"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="model.bean.BAIVIET"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<!-- _______________________CSS_________________________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/detailPost.css">
<title>Chi tiết bài viết - 詳細な記事</title>
</head>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		
	//Receive data from server
	BAIVIET posts = (BAIVIET) request.getAttribute("post");
	
	LICHSU history =(LICHSU)request.getAttribute("history");
	
	//Nhận lại kết quả dịch
	String resultTranslate = (String)request.getAttribute("resultTranslate");
	//Nhận lại kết quả duyệt bài
	String resultOK = (String)request.getAttribute("resultOK");
	//Nhận lại kết quả lưu bài viết
	String resultSave = (String)request.getAttribute("resultSave");
	//Nhận kết quả khi gởi bài viết
	String resultSend = (String)request.getAttribute("resultSend");
%>
<body>
	<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="content">
<!---------------------------Show result posts in database ------------------------------------>
			<%
				if (posts != null) {
			%>
			<div class="container-fluid" style="background: #EBEBE0;">
			<div class="col-md-6 col-md-offset-3" style=" margin-top: 1%">
					
		
						<a href="<%if ((posts.getTrangThai().contains("DangDich") && history.getTrangThai()!=null && history.getTrangThai().equals("LoiDich"))||posts.getTrangThai().contains("DichXong")||posts.getTrangThai().contains("KhongDich")|| posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("OK")){ %>#<%}else{ %>SendPostServlet?idPost=<%=posts.getIdBaiViet()%>&status=<%=posts.getTrangThai()%><%}%>">
							<button <%if ((posts.getTrangThai().contains("DangDich") && history.getTrangThai()!=null && history.getTrangThai().equals("LoiDich"))||posts.getTrangThai().contains("DichXong")||posts.getTrangThai().contains("KhongDich")|| posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("OK")){ %> disabled="disabled" <%} %>class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-send"></span> Chuyển bài<br>記事を転換する。</button>
						</a> 
						<a
							href="<%if(posts.getTrangThai().contains("DangDich") || posts.getTrangThai().contains("SoanThao")){ %>#<%}else{%>ShowAdminEditPostsServlet?idPost=<%=posts.getIdBaiViet()%>&from=detail<%}%>">
							<button <%if( posts.getTrangThai().contains("DangDich") || posts.getTrangThai().contains("SoanThao")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span> Chỉnh sửa<br>修正</button>
						</a>
						<a
							href="<%if(posts.getTrangThai().contains("OK") ||posts.getTrangThai().contains("DichXong") || ( posts.getTrangThai().contains("DangDich")) || posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("KhongDich")){ %>#<%}else{ %>TranslateServlet?idPost=<%=posts.getIdBaiViet()%><%}%>">
							<button <%if(posts.getTrangThai().contains("OK")||posts.getTrangThai().contains("DichXong")|| ( posts.getTrangThai().contains("DangDich")) || posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("KhongDich")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-subtitles"></span> Dịch bài<br>記事を翻訳する。</button>
						</a>
						<a
							href="<%if(posts.getTrangThai().contains("OK")|| posts.getTrangThai().contains("DangDich")){ %>#<%}else{%>UploadPostServlet?idPost=<%=posts.getIdBaiViet()%><%}%>&type=detail&btn=btnDetail">
							<button <%if(posts.getTrangThai().contains("OK")|| posts.getTrangThai().contains("DangDich")){ %> disabled="disabled"  <%}%>
								class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài<br>記事を承認する</button>
						</a>
						<a href="#" data-toggle="tooltip" >
							<button <%if(!(posts.getTrangThai().contains("MoiDang") || posts.getTrangThai().contains("OK")||posts.getTrangThai().contains("KhongDich"))){ %>
												disabled="disabled"
											<%} %>
											data-toggle="modal"
											data-target="#delete<%=posts.getIdBaiViet()%>"
								class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove" ></span>Xóa<br>削除</button>
						</a>
						<button class="btn btn-primary btn-sm " onclick="history.go(-1);"><span class="glyphicon glyphicon-share-alt"></span>Quay lại<br>戻り</button>
					</div>
					<br>
					<hr class="hr_detail">
				</div>
				<div class="container-fluid" style="background-color: #003D66;">
					<div  class="col-md-3"  id="divInfor">
					<h2>Thông tin bài viết<br>記事の情報</h2>
							<strong>User - ユーザー:</strong> 		<%=posts.getTaiKhoan().getTenTaiKhoan()%><br>
							<strong>Email - メール : </strong> 		<%=posts.getTaiKhoan().getEmail() %><br> 
							<strong>ID:</strong>    				<%=posts.getIdBaiViet()%><br>
							<strong>Trạng thái - 状態:</strong><%if(posts.getTrangThai().equals("OK")){ %><span class="label label-danger"><%}else if(posts.getTrangThai().equals("DangDich")){%><span class="label label-warning"><%}else if(posts.getTrangThai().equals("MoiDang")){%><span class="label label-primary"><%}else{%><span class="label label-default"><%}%><%=posts.getTrangThai()%></span><br>
							<strong>Lượt xem - 観覧回数:</strong>   	<%=posts.getLuotXem()%><br>
							<strong>Ngày đăng - 掲載の日付:</strong> <%=posts.getNgayDang()%><br>
							<strong>Danh mục - 項目:</strong> <%=posts.getDanhMuc().getTenDanhMucVi()%> - <%=posts.getDanhMuc().getTenDanhMucJa()%><br>
							<strong><%if(posts.getGimTrangChu()==1){ %>Có ghim lên trang chủ - ホームページに固定する。<%}else{ %>Không ghim lên trang chủ - ホームページに固定しない<%} %> </strong>
							<%if(posts.getTrangThai().contains("DangDich")||posts.getTrangThai().contains("DichXong")){ %>
							<img src="../images/logoctv_left.jpg" class="img-responsive"  alt="CTV" width="250" height="200">
							<h2>Thông tin CTV<br>協力者のプロファイル</h2>
							<p><strong>Tên cộng tác viên<br>協力者の氏名 </strong><%=history.getTaikhoan().getHoTen() %></p>
							<p><strong>Ngôn ngữ<br>言語 </strong><%=history.getTaikhoan().getNgonNgu().equals("vi") ?"Việt Nam - 項目名":"Nhật Bản - 項目名"%></p>
							<%} %>							
					</div>
					
				
				<div class="col-md-9" id="content" style="position: relative;left: 26%;min-height: 500px">
				
<!-------------------------------- Hiển thị kết quả và các nút nhấn --------------------------------->
					
					<!-- Hiển thị kết quả -->
						
						<%if(history.getTrangThai()!=null && history.getTrangThai().contains("DangBai")&& posts.getTrangThai().equals("DichXong")){%>
						<div class="panel panel-primary">
     						 <div class="panel-heading">Thông báo - お知らせ</div>
      						<div class="panel-body">
      							<h4>Tin nhắn bài viết - 記事についてのメッセージ</h4>
      							<div style="max-height: 200px;overflow: scroll">
	      							<%if(posts.getGhiChu()!=null){ %>
	      								<%=posts.getGhiChu() %>
	      							<%}else{ %>
	      								<p>Không có tin nhắn nào - メッセージが無い</p>
	      							<%} %>
      							</div>
      							<div class="alert alert-info">
									<strong>Bài viết đã dịch, chờ duyệt<br>記事が翻訳され、承認するところです。</strong>
								</div>
      							
      							<a href="UploadPostServlet?idPost=<%=posts.getIdBaiViet()%>&type=detail&btn=btnDetail"><button class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài<br>記事を承認する</button></a>
      							<a href="SendAgainServlet?idPost=<%=posts.getIdBaiViet()%>"><button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-share-alt"></span>Gởi lại<br>再送信する。 </button></a>
      						</div>
    					</div>
    				<%} %>
    				<%if(history.getTrangThai()!=null && history.getTrangThai().contains("HuyDich")&& posts.getTrangThai().equals("HuyDich")){%>
						<div class="panel panel-primary">
     						 <div class="panel-heading">Thông báo - お知らせ</div>
      						<div class="panel-body">Bài đăng đã được hủy bởi cộng tác viên - 掲載した記事が協力者により削除した: <%=history.getTaikhoan().getHoTen() %></div>
    					</div>
    				<%} %>
    				<%if(resultTranslate!=null){ %>
    					<div class="alert alert-info">
							<strong>Thông báo - 情報</strong>
							<p><%=resultTranslate%></p> 
						</div>
    				<%} %>
    				<%if(resultOK!=null){ %>	
    					<div class="alert alert-info">
							<strong>Thông báo - 情報</strong>
							<p><%=resultOK%></p>
						</div>
					<%} %>
					<%if(resultSave!=null){ %>
						<div class="alert alert-info">
							<strong>Thông báo - 情報</strong>
							<p><%=resultSave%></p>
						</div>
					<%} %>
					<%if(resultSend!=null){ %>
						<div class="alert alert-info">
							<strong>Thông báo - 情報</strong>
							<p><%=resultSend%> <%=history.getTaikhoan().getHoTen() %></p>
						</div>
					<%} %>
    				<!-- --------------------- -->
    				<div class = "ct" >
					<div id="ContentVi" class="col-md-6 content">
					<button id="btnVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnbackVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-backward"></span></button>
						<h3>Việt Nam - ベトナム</h3>
						<strong>Tên bài viết - 記事名:</strong>	<p><%if(posts.getTenBaiVietVi()!=null){%><%=posts.getTenBaiVietVi()%><%} %></p><br>
						<strong> Mô tả - 説明:</strong> 			<p><%if(posts.getMoTaVi()!=null){%><%=posts.getMoTaVi()%><%} %></p><br>
						<strong>Nội dung - 内容:</strong> 		<p><%if(posts.getNoiDungVi()!=null){%><%=posts.getNoiDungVi()%><%} %></p>
						<%
							if (posts.getBinhLuanVi() != null) {
						%>
						<hr>
						<%
							for (int i = 0; i < posts.getBinhLuanVi().size(); i++) {
								if(posts.getBinhLuanVi().get(i).getPhanHoiVi()!=null){
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
						<%}
							}
								}
						%>
					</div>
					<div id="ContentJa" class="col-md-6 content">
						<button id="btnbackJa" class="btn btn-primary"><span class="glyphicon glyphicon-fast-forward"></span></button>
						<button id="btnJa"  class="btn btn-primary"><span class="glyphicon glyphicon-fast-backward"></span></button>
						<h3>Nhật Bản - 日本</h3>
						<strong>Tên bài viết - 記事名:</strong>	<p><%if(posts.getTenBaiVietJa()!=null){%><%=posts.getTenBaiVietJa()%><%} %></p><br>
						<strong> Mô tả - 説明:</strong> 			<p><%if(posts.getMoTaJa()!=null){%><%=posts.getMoTaJa()%><%} %></p><br>
						<strong>Nội dung - 内容:</strong> 		<p><%if(posts.getNoiDungJa()!=null){%><%=posts.getNoiDungJa()%><%} %></p>
						<%
							if (posts.getBinhLuanJa() != null) {
						%>
						<hr>
						<%
							for (int i = 0; i < posts.getBinhLuanJa().size(); i++) {
								if(posts.getBinhLuanVi().get(i).getPhanHoiVi()!=null){
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
						<%}
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
					Không có bài viết trong cơ sở dữ liệu - データベースに記事を存しない。<br>					
				</div>
			</div>
		</div>
			<%
				}
			%>
			<!-- End show -->
		</div>
	<div id="resultMessage"></div>
	</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
	<!-- Model Delete -->
	<div class="modal fade" id="delete<%=posts.getIdBaiViet()%>">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Xóa bài viết(Admin) - 記事の削除（管理者）</h4>
				</div>
				<div class="modal-body">

					<form name="form_delete_posts_admin"
						action="AdminDeletePostsServlet" method="post">


						<div class="form-group">
							<label>ID<span class="rq"> * </span>:
							</label> <input type="text" class="form-control" maxlength="10"
								name="Idposts" value="<%=posts.getIdBaiViet()%>"
								readonly="readonly">
						</div>
						<button type="submit" class="btn btn-success btn-sm">Xóa
							- 削除</button>
						<button type="button" id="btn" class="btn btn-default"
							data-dismiss="modal">Quay lại - 戻り</button>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- End model delete -->
</body>
<!-- _______________________________________JS___________________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<script type="text/javascript" src="js/detailPost.js"></script>
</html><script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>