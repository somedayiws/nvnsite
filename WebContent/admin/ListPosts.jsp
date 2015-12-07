<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="model.bean.BAIVIET"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<!-- _____________________________CSS_______________________________- -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/listPost.css">
<!-- _________________________________JS____________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>


<title>Quản lý bài viết - 記事の管理</title>
</head>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");
	//Receive data from server
	ArrayList<BAIVIET> posts = (ArrayList<BAIVIET>) request.getAttribute("posts");	
	ArrayList<TAIKHOAN> accounts = (ArrayList<TAIKHOAN>) request.getAttribute("accounts");
	//Nhận kết quả xóa từ servlet AdminDeletePostsServlet
	String resultDelete = (String) request.getAttribute("resultDelete");
	//Nhận kết quả khôi phục tu servlet showrestoreServlet
	String result_Restore = (String)request.getAttribute("result_Restore");
	
	//Lấy tất cả danh mục
	ArrayList<DANHMUC> category =(ArrayList<DANHMUC>) request.getAttribute("category");
%>

<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div id="divcontent">
			<div class="row">
			<!-- Show result Delete posts -->
			<%
				if (resultDelete != null) {
			%>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
				<strong>Thông báo - お知らせ</strong>
				<p><%=resultDelete%></p>
			</div>

			<%
				}if(result_Restore!=null){
					%>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
				<strong>Thông báo - お知らせ</strong>
				<p><%=result_Restore%></p>
			</div>
			<%
				}
			%>			
</div>
			<!----------------------- Form tìm kiếm ----------------------->
			<div class="row">
				<form action="SearchPostServlet" method="get" id="formSearchPost">
					<h4 class="col-sm-2">Tìm kiếm - 検索</h4>
					<div class="col-sm-3 form-group">
						<select class="form-control" id="typeFind" name="typeFind">
							<option value="IdBaiViet">ID</option>
							<option value="TenBaiVietVi">Tên bài viết - Tiếng Việt /
								記事名 - ベトナム語</option>
							<option value="TenBaiVietJa">Tên bài viết - Tiếng Nhật /
								記事名 - 日本語</option>
							<option value="IdDanhMuc">Danh mục / 項目</option>
							<option value="IdTaiKhoan">Tài khoản /ユーザー名</option>
							<option value="NoiDungVi">Nội dung - Tiếng Việt/内容 -
								ベトナム語</option>
							<option value="NoiDungJa">Nội dung - Tiếng Nhật/内容 - 日本語</option>
							<option value="TrangThai">Trạng thái / 状態</option>
							<option value="GhiChu">Ghi chú / メーモ</option>
							<option value="MoTaVi">Mô tả - Tiếng Việt / 説明 - ベトナム語</option>
							<option value="MoTaJa">Mô tả - Tiếng Nhật / 説明 - 日本語</option>
							<option value="LuotXem">Lượt xem / 観覧回数</option>
							<option value="NgayDang">Ngày đăng / 掲載の日付</option>
							<option value="GimTrangChu">Bài viết đã Ghim / 記事が固定できた</option>
						</select>
					</div>
					<div class="col-sm-4 form-group" id="typeDifference">
						<input type="text" class="form-control" id="stringFind"
							name="stringFind">
					</div>
					<div class="col-sm-4 form-group" id="typeView">
						<select class="form-control" id="stringFindView"
							name="stringFindView">
							<option value="0" selected="selected" disabled="disabled">Chọn
								lượt xem - 観覧回数を選択する</option>
							<option value="1">Tăng dần - 徐々に増加する。</option>
							<option value="2">Giảm dần - 徐々に減少する。</option>
						</select>
					</div>
					<div class="col-sm-4 form-group" id="typeDay">
						<input type="date" class="form-control" id="stringFindDay"
							name="stringFindDay">
					</div>

					<div class="col-sm-4 form-group" id="typeCategory">
						<%if(category!=null){ %>
						<select class="form-control" id="stringFind"
							name="stringFindCategory">
							<option value="0" selected="selected" disabled="disabled">Chọn
								danh mục - 項目を選択する</option>
							<%for(int i=0;i<category.size();i++){ %>
							<option value="<%=category.get(i).getIdDanhMuc()%>"><%=category.get(i).getTenDanhMucVi()%>
								-
								<%=category.get(i).getTenDanhMucJa()%></option>
							<%} %>

						</select>
						<%}else{ %>
						<div class="alert alert-info">
							<strong>Thông báo - お知らせ</strong> Không có danh mục nào trong cơ
							sở dữ liệu - データベースに全ての項目を存しない。
						</div>
						<%} %>
					</div>

					<div class="col-sm-4 form-group" id="typeAccount">
						<%if(accounts!=null){ %>
						<select class="form-control" id="stringFind"
							name="stringFindAccount">
							<option value="0" selected="selected" disabled="disabled">Chọn
								tài khoản - アカウントを選択する</option>
							<%for(int i=0;i<accounts.size();i++){ %>
							<option value="<%=accounts.get(i).getIdTaiKhoan()%>"><%=accounts.get(i).getTenTaiKhoan()%></option>
							<%} %>

						</select>
						<%}else{ %>
						<div class="alert alert-info">
							<strong>Thông báo - お知らせ</strong> Không có tài khoản nào trong cơ
							sở dữ liệu - データベースにアカウントを存しません。
						</div>
						<%} %>
					</div>
					<div class="col-sm-1 form-group">
						<button type="submit" name="btnFind" value="Find"
							class="btn btn-primary btn-sm">Tìm kiếm - 検索</button>
					</div>
				</form>
						<div class="col-md-1 form-group">
					<a href="ShowRestoreServlet?type=posts"><button
							class="btn btn-success btn-sm">Khôi phục - 回復</button></a>
				</div>
				
			</div>
			<!----------------------- End form tìm kiếm ------------------->
			<!-- ------------------------------------------------------- -->
			<!-- ----------Show result all posts in database------------ -->
			<!-- ------------------------------------------------------- -->
			<%
				if (posts != null) {
			%>
			<div class="col-md-12 table-responsive panel panel-primary">
				<div class="panel-heading">Bài viết - </div>			
				<div class="panel-body">
					<button type="button" class="btn btn-info" onclick="showFlag()">Thông tin thêm</button>
					<script type="text/javascript">
						function showFlag($param) {
							 $(".flag").slideToggle();
						}
					</script>
					<div class="flag" style="display: none">
						<p><img alt="dang dich" src="../images/icons/checkered-flag-icon.png"><span>Đã duyệt - 承認された。</span></p>
						<p><img alt="dang dich" src="../images/icons/Actions-flag-blue-icon.png"><span>Đang dịch - 翻訳中</span></p>
						<p><img alt="dang dich" src="../images/icons/Actions-flag-yellow-icon.png"><span>Mới đăng - 新たな掲載</span></p>
						<p><img alt="dang dich" src="../images/icons/Actions-flag-black-icon.png"><span>Không dịch - 翻訳しない。</span></p>
						<p><img alt="dang dich" src="../images/icons/Actions-flag-green-icon.png"><span>Dịch xong - 翻訳を完了した</span></p>
						<p><img alt="dang dich" src="../images/icons/Actions-flag-red-icon.png"><span>Hủy dịch - 翻訳をキャンセルした。</span></p>
					</div>
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th></th>
								<th>ID</th>
								<th>Tên bài viết<br> 記事名
								</th>
								<th>Danh mục<br> 項目
								</th>
								<th>Người đăng<br> ユーザー名
								</th>
								<th>Ngày đăng<br> 掲載の日付
								</th>
								<th>Mô tả<br> 説明
<!-- 								</th> -->
<%-- 								<% if(request.getParameter("view")!=null && request.getParameter("view").equals("all")) { %><th>Trạng thái<br> 状態 <% } %> --%>
<!-- 								</th> -->
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < posts.size(); i++) {
						%>
							<tr>
								<td>
									<%if(posts.get(i).getTrangThai().equals("OK")){ %><img src="../images/icons/checkered-flag-icon.png"><%} %><%else if(posts.get(i).getTrangThai().equals("DangDich")){ %><img src="../images/icons/Actions-flag-blue-icon.png"><%}%><%else if(posts.get(i).getTrangThai().equals("MoiDang")){ %><img src="../images/icons/Actions-flag-yellow-icon.png"><%} %><%else if(posts.get(i).getTrangThai().equals("KhongDich")){ %><img src="../images/icons/Actions-flag-black-icon.png"><%} %><%else if(posts.get(i).getTrangThai().equals("DichXong")){ %><img src="../images/icons/Actions-flag-green-icon.png"><%} %><%else{%> <img src="../images/icons/Actions-flag-red-icon.png"><%} %>
								</td>
								<td><%=posts.get(i).getIdBaiViet()%></td>
								
								<td>
												<%if(posts.get(i).getTenBaiVietVi()== null && posts.get(i).getTenBaiVietJa()==null){ %>
													<span class="label label-default">Không có tên bài viết<br>記事のタイトルが無い</span>
												<%}else{ %>
													<%if(posts.get(i).getTenBaiVietVi()!= null){%>
														<p><%=posts.get(i).getTenBaiVietVi()%></p> 
													<%} %>
														 
													<%if(posts.get(i).getTenBaiVietJa()!= null){%>
														<%=posts.get(i).getTenBaiVietJa()%> 
													<%} %>
														
													<%
												} %>
								</td>
								
								<td><%=posts.get(i).getDanhMuc().getTenDanhMucVi()%> - <%=posts.get(i).getDanhMuc().getTenDanhMucJa()%></td>
								<td><%=posts.get(i).getTaiKhoan().getTenTaiKhoan()%></td>
								<td><%=posts.get(i).getNgayDang()%></td>
								<td>
									<%if(posts.get(i).getMoTaVi() == null && posts.get(i).getMoTaJa() == null){ %>
										<span class="label label-default">Không có mô tả<br>記事の内容を述べない。</span>
									<%}else{ %>
										<%if(posts.get(i).getMoTaVi() != null ){ %>
											<p><%=posts.get(i).getMoTaVi()%></p> 
										<%}%>
										
										<%if(posts.get(i).getMoTaJa() != null ){  %>
											<p><%=posts.get(i).getMoTaJa()%></p>
										<%}}%>
									 
								</td>
<%-- 								<% if(request.getParameter("view")!=null && request.getParameter("view").equals("all")) { %> --%>
<!-- 								<td> -->
<%-- 									<%if(posts.get(i).getTrangThai().equals("MoiDang")){ %> --%>
<!-- 										<p class="bg-success">Mới đăng - 新たな掲載</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("DangDich")) {%> --%>
<!-- 										<p class="bg-info">Đang dịch - 翻訳中</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("OK")){ %> --%>
<!-- 										<p class="bg-info">Đã duyệt - 承認された。</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("DichXong")){ %> --%>
<!-- 										<p class="bg-primary">Dịch xong - 翻訳を完了した</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("HuyDich")){ %> --%>
<!-- 										<p class="bg-danger"> Hủy dịch - 翻訳をキャンセルした。</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("KhongDich")){ %> --%>
<!-- 										<p class="bg-info">Không dịch - 翻訳しない。</p> -->
<%-- 									<%}else if(posts.get(i).getTrangThai().equals("XoaBai")){ %> --%>
<!-- 										<p class="bg-danger"> Xóa bài - 記事を削除うする。</p> -->
<%-- 									<%}else{ %> --%>
<%-- 										<%=posts.get(i).getTrangThai()%> --%>
<%-- 									<%} %> --%>
<!-- 								</td> -->
<%-- 								<% } %> --%>
								<td>
									<%if(posts.get(i).getTrangThai().equals("MoiDang")){ %>
										<a href="SendPostServlet?idPost=<%=posts.get(i).getIdBaiViet()%>&status=MoiDang" data-toggle="tooltip" title="Chuyển dịch - 転換する。"><button
											type="button" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-send"></span>
										</button></a>
									<%}else if(posts.get(i).getTrangThai().equals("DangDich")) {%>
										<a href="#" data-toggle="tooltip" title="Hủy dịch - 翻訳をキャンセルした。"><button
											type="button" class="btn btn-warning btn-sm" onclick="HuyBaiDich('<%=posts.get(i).getIdBaiViet()%>');">
											<span class="glyphicon glyphicon-exclamation-sign"></span>
										</button></a>
									<%}else if(posts.get(i).getTrangThai().equals("DichXong")) {%>
										<a href="ShowDetailPostsServlet?id=<%=posts.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Duyệt bài - 記事を承認する。"><button
											type="button" class="btn btn-default btn-sm">
											<span><img src="../images/icons/arrow .gif" style="width: 20px; margin-right: -9px;"></span>
										</button></a>
									<%}else if(posts.get(i).getTrangThai().equals("KhongDich")) {%>
										<a href="ShowDetailPostsServlet?id=<%=posts.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Duyệt bài - 記事を承認する。"><button
											type="button" class="btn btn-default btn-sm">
											<span><img src="../images/icons/arrow .gif" style="width: 20px; margin-right: -9px;"></span>
										</button></a>
									<%}else if(posts.get(i).getTrangThai().equals("HuyDich")){ %>
										<a href="SendPostServlet?idPost=<%=posts.get(i).getIdBaiViet()%>&status=HuyDich" data-toggle="tooltip" title="Chuyển dịch - 転換する。"><button
											type="button" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-send"></span>
										</button></a>
									<%}%>
								</td>
								<td>
									<div id="resultMessage_<%=posts.get(i).getIdBaiViet()%>">
										<button type="button" id="<%=posts.get(i).getIdBaiViet()%>"
											data-toggle="tooltip"
											<%if(posts.get(i).getGimTrangChu()==1) {%>
											title="Đã ghim - 固定された。"
											<% }else{%>title="Chưa ghim - まだ固定しない。"<%}%>
											<%if (posts.get(i).getGimTrangChu()==1) { %>
											class="btn btn-warning btn-sm btnbookmark" <%}else {%>
											class="btn btn-primary btn-sm btnbookmark" <%}%>
											onclick="changeBookmark('<%=posts.get(i).getIdBaiViet()%>')">
											<span class="glyphicon glyphicon-bookmark"></span>
										</button>
									</div>
								</td>
								<td><a
									href="ShowDetailPostsServlet?id=<%=posts.get(i).getIdBaiViet()%>"
									data-toggle="tooltip" title="Chi tiết - 詳細"><button
											type="button" class="btn btn-info btn-sm">
											<span class="glyphicon glyphicon-list-alt"></span>
										</button> </a></td>
								<td><a
									href="<%if(posts.get(i).getTrangThai().contains("DangDich") ){ %>#<%}else{ %> ./ShowAdminEditPostsServlet?idPost=<%=posts.get(i).getIdBaiViet()%>&from=list<%}%>"
									data-toggle="tooltip" title="Chỉnh sửa - 修正"><button
											type="button" class="btn btn-primary btn-sm"
											<%if(posts.get(i).getTrangThai().contains("DangDich")){ %>
											disabled="disabled" <%} %>>
											<span class="glyphicon glyphicon-pencil"> </span>
										</button></a></td>
								<td><a href="#" data-toggle="tooltip" title="Xóa - 削除"><button
											type="button" class="btn btn-danger btn-sm"
											<%if(!(posts.get(i).getTrangThai().contains("MoiDang") || posts.get(i).getTrangThai().contains("OK")||posts.get(i).getTrangThai().contains("KhongDich"))){ %>
												disabled="disabled"
											<%} %>
											data-toggle="modal"
											data-target="#delete<%=posts.get(i).getIdBaiViet()%>">
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
			<%
				} else {
			%>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
				<strong>Thông báo - お知らせ</strong>Không có bài viết trong cơ sở dữ
				liệu - データベースに記事を存しない。
			</div>
			<%
				}
			%>
			<!-- End show -->
			<%
				if (posts != null) {
					for (int i = 0; i < posts.size(); i++) {
			%>

			<!-- Model Delete -->
			<div class="modal fade" id="delete<%=posts.get(i).getIdBaiViet()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa bài viết(Admin) - 記事の削除（管理者）</h4>
						</div>
						<div class="modal-body">

							<form name="form_delete_posts_admin"
								action="AdminDeletePostsServlet" method="post" onsubmit="return check_existMessage()">
								<div class="form-group">
									<label>ID<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="10"
										name="Idposts" value="<%=posts.get(i).getIdBaiViet()%>"
										readonly="readonly">
								</div>
								<!------------------------------------------
									 fix by Hai  
									 Date: 05 - 12 - 2015
									 fix delete posts, send message to user
								-------------------------------------------->
								<div class = "form-group">
									<label>Tin nhắn thông báo</label>
									<p class="help-block">Gởi tin nhắn đến người dùng đăng bài viết này</p>
									<textarea autofocus rows="5" cols="20" class = "form-control" name = "message_input" id = "message_input">
									</textarea>
								</div>
								<div class = "checkbox">
									<label>
										<input type = "checkbox" name="rd_message" id = "rd_message"  onchange="showMessageDefault()">
										Chọn tin nhắn mặc định
									</label>
								</div>
								<div class = "form-group">
									<select name = "message_default" class = "form-control" id = "message_default">
										<option value = "message_1">Bài viết của bạn đã bị xóa</option>
										<option value = "message_2">Bài viết của bạn đã bị xóa vì không đúng nội quy của website</option>
									</select>
								</div>
								<!------------------------------------------
									 End fix 05 - 12 - 2015
								-------------------------------------------->
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
			<%
				}
				}
			%>
		</div>
	</div>
	<div id="resultMessage" style="display: none;"></div>
<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
<!-- ___________________________________JS_________________________________ -->
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<script type="text/javascript" src="js/listPost.js"></script>
</html>