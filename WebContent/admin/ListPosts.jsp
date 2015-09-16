<%@page import="java.util.ArrayList"%>
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
<style type="text/css">

#btndetail:after{
	content: 'Chi tiết - 詳細';
	display: none;	
}

#btndetail:hover:after{
	display: inline-block;
}

#btnsend:after{
	content: 'Gởi bài - 送信';
	display: none;	
}

#btnsend:hover:after{
	display: inline-block;
}

#btnedit:after{
	content: 'Chỉnh sửa - 編集';
	display: none;	
}

#btnedit:hover:after{
	display: inline-block;
}

#btndelete:after{
	content: 'Xóa - 削除';
	display: none;	
}

#btndelete:hover:after{
	display: inline-block;
}
</style>
<script type="text/javascript">
$(document).ready(function(){ 
	
	   $("#btn_Send").click(function(){ 
		   alert("vào");
		   if($(".checkbox_Send").is(':checked')) {
			   alert($(".checkbox_Send:checked").val());
		   }
		 
	   }); 
	 }); 


</script>
<title>List Posts</title>
</head>

<%
	//Receive data from server
	BAIVIET[] posts = (BAIVIET[]) request.getAttribute("posts");	
	TAIKHOAN[] account = (TAIKHOAN[]) request.getAttribute("account");
	String resultEdit = (String) request.getAttribute("resultEdit");
	String resultDelete = (String) request.getAttribute("resultDelete");
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div style="margin-top: 10px">

			<!-- Show result Edit posts -->
			<%
				if (resultEdit != null) {
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Thông báo - お知らせ</div>
				<div class="panel-body"><%=resultEdit%>
				</div>
			</div>
			<%
				}
			%>
			<!-- Show result Delete posts -->
			<%
				if (resultDelete != null) {
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Thông báo - お知らせ</div>
				<div class="panel-body"><%=resultDelete%>
				</div>
			</div>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-1 form-group" style="float: right;">
					<a href="ShowRestoreServlet?type=posts"><button
							class="btn btn-success">Khôi phục</button></a>
				</div>
				<div class="col-md-1 form-group" style="float: right;">
				
<!-- 					<a href="#"><button id="btn_Send" -->
<!-- 							class="btn btn-success" >Send</button></a> -->
				</div>
			</div>
			<!-- Show result all posts in database -->
			<%
				if (posts != null) {
			%>
			<div class="table-responsive">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th></th>
							<th>ID</th>
							<th>Tên bài viết - 名前ポスト</th>
							<th>Danh mục - カテゴリ</th>
							<th>Người đăng - ユーザー</th>
							<th>Ngày đăng - 日付</th>
							<th>Mô tả - 説明</th>
							<th>Trạng thái - 状態</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < posts.length; i++) {
						%>
						<tr>
							<td>
								<div class="checkbox" style="margin-top: 0">
									<label><input type="checkbox" value="<%=posts[i].getIdBaiViet()%>" class="checkbox_Send"></label>
								</div>
							</td>
							<td><%=posts[i].getIdBaiViet()%></td>
							<td><%=posts[i].getTenBaiVietVi()%> - <%=posts[i].getTenBaiVietJa()%></td>
							<td><%=posts[i].getDanhMuc().getTenDanhMucVi()%> - <%=posts[i].getDanhMuc().getTenDanhMucJa()%></td>
							<td><%=posts[i].getTaiKhoan().getTenTaiKhoan()%></td>
							<td><%=posts[i].getNgayDang()%></td>
							<td><%=posts[i].getMoTaVi()%> - <%=posts[i].getMoTaJa()%></td>
							<td><%=posts[i].getTrangThai()%></td>


							<td><a
								href="ShowDetailPostsServlet?id=<%=posts[i].getIdBaiViet()%>"><button id="btndetail"
										type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-list-alt"></span>
									</button> </a></td>
<!-- 							<td><a -->
<%-- 								href="SendPostServlet?idPost=<%=posts[i].getIdBaiViet()%>&status=<%=posts[i].getTrangThai()%>"><button id="btnsend" --%>
<!-- 										type="button" class="btn btn-primary" > -->
<!-- 										<span class="glyphicon glyphicon-send"></span> -->
<!-- 									</button> </a></td> -->
							<td><a
								href="./ShowAdminEditPostsServlet?idPost=<%=posts[i].getIdBaiViet()%>"><button id="btnedit"
										type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil"></span> 
									</button></a></td>
							<td><button type="button" class="btn btn-primary" id="btndelete"
									data-toggle="modal"
									data-target="#delete<%=posts[i].getIdBaiViet()%>">
									<span class="glyphicon glyphicon-remove"></span> 
								</button></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
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
			<%
				if (posts != null) {
					for (int i = 0; i < posts.length; i++) {
			%>

			<!-- Model Delete -->
			<div class="modal fade" id="delete<%=posts[i].getIdBaiViet()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa bài viết(Admin)</h4>
						</div>
						<div class="modal-body">

							<form name="form_delete_posts_admin"
								action="AdminDeletePostsServlet" method="post">


								<div class="form-group">
									<label>ID Bài viết<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="10"
										name="Idposts" value="<%=posts[i].getIdBaiViet()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-lg">Xóa</button>
							</form>

						</div>
						<div class="modal-footer">
							<button type="button" id="btn" class="btn btn-default"
								data-dismiss="modal">Quay lại</button>
						</div>
					</div>
				</div>
			</div>

			<!-- End model delete -->
			<%
				}
				}
			%>
		</div>

	</div>
	<div class="menuPhanTrang">
		<%= request.getAttribute("pageNav") %>
	</div>
</body>
</html>