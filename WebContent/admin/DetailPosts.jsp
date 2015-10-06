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
<title>Chi tiết bài viết - </title>
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
			<div class="col-md-10 col-md-offset-1">
				<div class="col-md-4">
					<div id="divInfor">
					<h2>Thông tin bài viết<br>..................</h2>
							<strong>User - ユーザー:</strong> 		<%=posts.getTaiKhoan().getTenTaiKhoan()%><br>
							<strong>Email - メール : </strong> 		<%=posts.getTaiKhoan().getEmail() %><br> 
							<strong>ID:</strong>    				<%=posts.getIdBaiViet()%><br>
							<strong>Trạng thái - 状態:</strong><%if(posts.getTrangThai().equals("OK")){ %><span class="label label-danger"><%}else if(posts.getTrangThai().equals("DangDich")){%><span class="label label-warning"><%}else if(posts.getTrangThai().equals("MoiDang")){%><span class="label label-primary"><%}else{%><span class="label label-default"><%}%><%=posts.getTrangThai()%></span><br>
							<strong>Lượt xem - 観覧回数:</strong>   	<%=posts.getLuotXem()%><br>
							<strong>Ngày đăng - 掲載の日付:</strong> <%=posts.getNgayDang()%><br>
							<strong><%if(posts.getGimTrangChu()==1){ %>Có<%}else{ %>Không<%} %> ghim lên trang chủ</strong>
							<%if(posts.getTrangThai().contains("DangDich")||posts.getTrangThai().contains("DichXong")){ %>
							<img src="../images/logoctv_left.jpg" class="img-responsive"  alt="CTV" width="250" height="200">
							<h2>Thông tin CTV<br>..................</h2>
							<p><strong>Tên cộng tác viên: </strong><%=history.getTaikhoan().getHoTen() %></p>
							<p><strong>Ngôn ngữ: </strong><%=history.getTaikhoan().getNgonNgu().equals("vi") ?"Việt Nam - 項目名":"Nhật Bản - 項目名"%></p>
							<%} %>							
					</div>
					
				</div>
				<div class="col-md-8 " id="content" style="margin-top: 5%">
				
<!-------------------------------- Hiển thị kết quả và các nút nhấn --------------------------------->
					<div class="col-md-12 ">
					
		
						<a href="<%if ((posts.getTrangThai().contains("DangDich") && history.getTrangThai()!=null && !history.getTrangThai().equals("LoiDich"))||posts.getTrangThai().contains("DichXong")||posts.getTrangThai().contains("KhongDich")|| posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("OK")){ %>#<%}else{ %>SendPostServlet?idPost=<%=posts.getIdBaiViet()%>&status=<%=posts.getTrangThai()%><%}%>">
							<button <%if ((posts.getTrangThai().contains("DangDich") && history.getTrangThai()!=null && !history.getTrangThai().equals("LoiDich"))||posts.getTrangThai().contains("DichXong")||posts.getTrangThai().contains("KhongDich")|| posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("OK")){ %> disabled="disabled" <%} %>class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-send"></span> Chuyển bài</button>
						</a> 
						<a
							href="<%if(posts.getTrangThai().contains("OK")|| posts.getTrangThai().contains("DangDich") || posts.getTrangThai().contains("SoanThao")){ %>#<%}else{%>ShowAdminEditPostsServlet?idPost=<%=posts.getIdBaiViet()%>&from=detail<%}%>">
							<button <%if(posts.getTrangThai().contains("OK") || posts.getTrangThai().contains("DangDich") || posts.getTrangThai().contains("SoanThao")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span> Chỉnh sửa - 修正</button>
						</a>
						<a
							href="<%if(posts.getTrangThai().contains("OK") ||posts.getTrangThai().contains("DichXong") || ( posts.getTrangThai().contains("DangDich")) || posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("KhongDich")){ %>#<%}else{ %>TranslateServlet?idPost=<%=posts.getIdBaiViet()%><%}%>">
							<button <%if(posts.getTrangThai().contains("OK")||posts.getTrangThai().contains("DichXong")|| ( posts.getTrangThai().contains("DangDich")) || posts.getTrangThai().contains("SoanThao") || posts.getTrangThai().contains("KhongDich")){ %> disabled="disabled"  <%} %>
								class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-subtitles"></span> Dịch bài - </button>
						</a>
						<a
							href="<%if(posts.getTrangThai().contains("OK")|| posts.getTrangThai().contains("DangDich")){ %>#<%}else{%>UploadPostServlet?idPost=<%=posts.getIdBaiViet()%><%}%>&type=detail&btn=btnDetail">
							<button <%if(posts.getTrangThai().contains("OK")|| posts.getTrangThai().contains("DangDich")){ %> disabled="disabled"  <%}%>
								class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài - </button>
						</a>
						<button class="btn btn-primary btn-sm " onclick="history.go(-1);"><span class="glyphicon glyphicon-share-alt"></span>Quay lại - 戻り</button>
					</div>
					<br>
					<hr>
					
					<!-- Hiển thị kết quả -->
						
						<%if(history.getTrangThai()!=null && history.getTrangThai().contains("DangBai")&& posts.getTrangThai().equals("DichXong")){%>
						<div class="panel panel-primary">
     						 <div class="panel-heading">Thông báo - お知らせ</div>
      						<div class="panel-body">
      							<h4>Tin nhắn bài viết - </h4>
      							<div style="max-height: 200px;overflow: scroll">
	      							<%if(posts.getGhiChu()!=null){ %>
	      								<%=posts.getGhiChu() %>
	      							<%}else{ %>
	      								<p>Không có tin nhắn nào</p>
	      							<%} %>
      							</div>
      							<div class="alert alert-info">
									<strong>Bài đăng đã dịch, chờ duyệt</strong>
								</div>
      							
      							<a href="UploadPostServlet?idPost=<%=posts.getIdBaiViet()%>&type=detail&btn=btnDetail"><button class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pushpin" ></span>Duyệt bài</button></a>
      							<a href="SendAgainServlet?idPost=<%=posts.getIdBaiViet()%>"><button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-share-alt"></span>Gởi lại - </button></a>
      						</div>
    					</div>
    				<%} %>
    				<%if(history.getTrangThai()!=null && history.getTrangThai().contains("HuyDich")&& posts.getTrangThai().equals("HuyDich")){%>
						<div class="panel panel-primary">
     						 <div class="panel-heading">Thông báo - お知らせ</div>
      						<div class="panel-body">Bài đăng đã được hủy bởi <%=history.getTaikhoan().getHoTen() %></div>
    					</div>
    				<%} %>
    				<%if(resultTranslate!=null){ %>
    					<div class="alert alert-info">
							<strong>Thông báo - 情報</strong><%=resultTranslate%> 
						</div>
    				<%} %>
    				<%if(resultOK!=null){ %>	
    					<div class="alert alert-info">
							<strong>Thông báo - 情報</strong><%=resultOK%>
						</div>
					<%} %>
					<%if(resultSave!=null){ %>
						<div class="alert alert-info">
							<strong>Thông báo - 情報</strong><%=resultSave%>
						</div>
					<%} %>
					<%if(resultSend!=null){ %>
						<div class="alert alert-info">
							<strong>Thông báo - 情報</strong><%=resultSend%> <%=history.getTaikhoan().getHoTen() %>
						</div>
					<%} %>
    				<!-- --------------------- -->
					<div id="ContentVi" class="col-md-6 content">
					<button id="btnVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-forward"></span></button>
					<button id="btnbackVi" class="btn btn-primary"><span class="glyphicon glyphicon-fast-backward"></span></button>
						<h3>Việt Nam - 項目名</h3>
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
						<h3>Nhật Bản - 項目名</h3>
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