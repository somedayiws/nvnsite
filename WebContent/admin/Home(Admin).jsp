<%@page import="model.bean.BAIVIET"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<!------------- CSS ---------------------->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/home.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<!-- __________________JS_____________________ -->
<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<title>Trang chủ - ホーム</title>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "CheckDataBaiViet",
			type : "post",
			success : function(result) {
				$("#baicanxem").html(result);
			}
		});
		var refreshId = setInterval(function() {
			$.ajax({
				url : "CheckDataBaiViet",
				type : "post",
				success : function(result) {
					
					$("#baicanxem").html(result);
				}
			});
		}, 300000);
	});
</script>
</head>
<%
	//Kiểm tra session có tồn tại hay không
	HttpSession session_user = request.getSession();
	String username =(String)session_user.getAttribute("username");	
	//Nhận các bài viết mới nhất
	ArrayList<BAIVIET> postsNew = (ArrayList<BAIVIET>) request.getAttribute("postsNew");
%>
<body>
	<%if(username!=null){ %>
	<div class="container-fluid" >
		<%@include file="header_ver_1.jsp"%>	
		<%@include file="Menu.jsp"%>
			<div id="baicanxem">
			</div>
		<div class="row">
	
<!-- 			<div class="col-md-12" id="title"> -->
<!-- 				<h2><strong><marquee behavior="alternate" width="10%">>></marquee>Chào mừng bạn đến với trang Admin - 管理者のホームページへようこそ<marquee behavior="alternate" width="10%"><<</marquee></strong></h2> -->
<!-- 			</div> -->
<!-- |--------------------------------------------------------------| -->
<!-- |-------------------Hiển thị hình ảnh--------------------------| -->
<!-- |--------------------------------------------------------------| -->		
			<!-- <div class = "col-md-3" id = "div_show_image">
				<div class="col-md-10 col-md-offset-1" >
					<img src="../images/congthongtin.png" class="img-responsive img-rounded" alt="Cổng thông tin" data-spy="affix">
				</div>
			</div> -->
<!-- |--------------------------------------------------------------| -->
<!-- |-------------Hiển thị bài viết mới nhất- ---------------------| -->
<!-- |--------------------------------------------------------------| -->				
			<div class = "col-md-9" id = "div_show_post_new">
				<%if(postsNew!=null){ %>
					<div class="col-md-12 table-responsive panel panel-primary">
				<div class="panel-heading">Bài viết - 記事</div>
				<div class="panel-body">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tên bài viết<br> 記事名
								</th>
								<th>Danh mục<br> 項目
								</th>
								<th>Người đăng<br> ユーザー名
								</th>
								<th>Ngày đăng<br> 掲載の日付
								</th>
								<% if(request.getParameter("view")!=null && request.getParameter("view").equals("all")) { %><th>Trạng thái<br> 状態 <% } %>
								</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < postsNew.size(); i++) {
						%>
							<tr>
								<td><%=postsNew.get(i).getIdBaiViet()%></td>
								
								<td>
												<%if(postsNew.get(i).getTenBaiVietVi()== null && postsNew.get(i).getTenBaiVietJa()==null){ %>
													<span class="label label-default">Không có tên bài viết - 記事のタイトルが無い</span>
												<%}else{ %>
													<%if(postsNew.get(i).getTenBaiVietVi()!= null){%>
														<%=postsNew.get(i).getTenBaiVietVi()%><br>
													<%} %>
														 
													<%if(postsNew.get(i).getTenBaiVietJa()!= null){%>
														<%=postsNew.get(i).getTenBaiVietJa()%> 
													<%} %>
														
													<%
												} %>
								</td>
								
								<td><%=postsNew.get(i).getDanhMuc().getTenDanhMucVi()%><br><%=postsNew.get(i).getDanhMuc().getTenDanhMucJa()%></td>
								<td><%=postsNew.get(i).getTaiKhoan().getTenTaiKhoan()%></td>
								<td><%=postsNew.get(i).getNgayDang()%></td>
								<td>
									<%if(postsNew.get(i).getTrangThai().equals("MoiDang")){ %>
										<a href="SendPostServlet?idPost=<%=postsNew.get(i).getIdBaiViet()%>&status=MoiDang" data-toggle="tooltip" title="Chuyển dịch - 転換する。"><button
											type="button" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-send"></span>
										</button></a>
									<%}else if(postsNew.get(i).getTrangThai().equals("DangDich")) {%>
										<a href="#" data-toggle="tooltip" title="Hủy dịch - 翻訳をキャンセルした。"><button
											type="button" class="btn btn-warning btn-sm"
											data-toggle="modal"
											data-target="#delete<%=postsNew.get(i).getIdBaiViet()%>">
											<span class="glyphicon glyphicon-exclamation-sign"></span>
										</button></a>
									<%}else if(postsNew.get(i).getTrangThai().equals("DichXong")) {%>
										<a href="ShowDetailPostsServlet?id=<%=postsNew.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Duyệt bài - 記事を承認する。"><button
											type="button" class="btn btn-default btn-sm">
											<span><img src="../images/icons/arrow .gif" style="width: 20px; margin-right: -9px;"></span>
										</button></a>
									<%}else if(postsNew.get(i).getTrangThai().equals("KhongDich")) {%>
										<a href="ShowDetailPostsServlet?id=<%=postsNew.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Duyệt bài - 記事を承認する。"><button
											type="button" class="btn btn-default btn-sm">
											<span><img src="../images/icons/arrow .gif" style="width: 20px; margin-right: -9px;"></span>
										</button></a>
									<%}else if(postsNew.get(i).getTrangThai().equals("HuyDich")){ %>
										<a href="SendPostServlet?idPost=<%=postsNew.get(i).getIdBaiViet()%>&status=HuyDich" data-toggle="tooltip" title="Chuyển dịch - 転換する。"><button
											type="button" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-send"></span>
										</button></a>
									<%}%>
								</td>
								<td>
									<div id="resultMessage_<%=postsNew.get(i).getIdBaiViet()%>">
										<button type="button" id="<%=postsNew.get(i).getIdBaiViet()%>"
											data-toggle="tooltip"
											<%if(postsNew.get(i).getGimTrangChu()==1) {%>
											title="Đã ghim - 固定された。"
											<% }else{%>title="Chưa ghim - まだ固定しない。"<%}%>
											<%if (postsNew.get(i).getGimTrangChu()==1) { %>
											class="btn btn-warning btn-sm btnbookmark" <%}else {%>
											class="btn btn-primary btn-sm btnbookmark" <%}%>
											onclick="changeBookmark('<%=postsNew.get(i).getIdBaiViet()%>')">
											<span class="glyphicon glyphicon-bookmark"></span>
										</button>
									</div>
								</td>
								<td><a
									href="ShowDetailPostsServlet?id=<%=postsNew.get(i).getIdBaiViet()%>"
									data-toggle="tooltip" title="Chi tiết - 詳細"><button
											type="button" class="btn btn-info btn-sm">
											<span class="glyphicon glyphicon-list-alt"></span>
										</button> </a></td>
								<td><a
									href="<%if(postsNew.get(i).getTrangThai().contains("OK") || postsNew.get(i).getTrangThai().contains("DangDich") ){ %>#<%}else{ %> ./ShowAdminEditPostsServlet?idPost=<%=postsNew.get(i).getIdBaiViet()%>&from=list<%}%>"
									data-toggle="tooltip" title="Chỉnh sửa - 修正"><button
											type="button" class="btn btn-primary btn-sm"
											<%if(postsNew.get(i).getTrangThai().contains("OK") || postsNew.get(i).getTrangThai().contains("DangDich")){ %>
											disabled="disabled" <%} %>>
											<span class="glyphicon glyphicon-pencil"> </span>
										</button></a></td>
								<td><a href="#" data-toggle="tooltip" title="Xóa - 削除"><button
											type="button" class="btn btn-danger btn-sm"
											data-toggle="modal"
											data-target="#delete<%=postsNew.get(i).getIdBaiViet()%>">
											<span class="glyphicon glyphicon-remove"></span>
										</button></a></td>
							</tr>
							<%
							}
						%>
						</tbody>
					</table>

					<div id="page" class="menuPhanTrang">
						<%= request.getAttribute("pageNav") %>
					</div>
				</div>
					</div>
				<%} %>
			</div>
		</div>	
			<%
				if (postsNew != null) {
					for (int i = 0; i < postsNew.size(); i++) {
			%>
<!-- |--------------------------------------------------------------| -->
<!-- |-------------Modal xóa- ---------------------| -->
<!-- |--------------------------------------------------------------| -->	
			<div class="modal fade" id="delete<%=postsNew.get(i).getIdBaiViet()%>">
				<div class="modal-dialog">
<!---------------------- Modal content ------------------->
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
									</label> <input type="text" class="form-control"
										name="Idposts" value="<%=postsNew.get(i).getIdBaiViet()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-sm">Xóa - 削除</button>
								<button type="button" id="btn" class="btn btn-default" data-dismiss="modal">Quay lại - 戻り</button>
							</form>
						</div>
					</div>
				</div>
			</div>		
			<%
				}
				}
			%>	
			
	</div>
	<div id="resultMessage"></div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>				
</body>
<!-- ---------- JS ------------------------->

<script type="text/javascript" src="js/Home(Admin).js"></script>
</html>