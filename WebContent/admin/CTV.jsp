<%@page import="model.bean.CTV"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<!-- ______________________________JS________________________________________ -->
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<!-- ___________________________CSS_______________________________________ -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/listAccount.css">
<title>Quản lý cộng tác viên - 協力者の管理</title>
<%

//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");
	ArrayList<CTV> ctv =(ArrayList<CTV>) request.getAttribute("ctv");
	String result = (String)request.getAttribute("result");
%>
</head>
<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
			<%if(result!=null){ %>
				<div class="col-md-4 col-md-offset-4 alert alert-info">
					<strong>Thông báo - お知らせ</strong><%=result %>
				</div>
			<%}
			%>	
			<div class="col-md-10 col-md-offset-1">				
				<form action="CTVServlet" method="post"
					onsubmit="return checkValidateSearch()">
					<h4 class="col-md-2">Tìm kiếm - 検索</h4>
					<div class="col-md-2 form-group">
						<select class="form-control" id="typeFind" name="typeFind">
							<option value="IdTaiKhoan">ID</option>
							<option value="HoTen">Họ tên - 氏名</option>
							<option value="DiaChi">Địa chỉ - 住所</option>
							<option value="DienThoai">Địện thoại - 電話番号</option>
							<option value="Email">Email - メール</option>
							<option value="TenTaiKhoan">Tên tài khoản - ユーザー名</option>		
							<option value="NgonNgu">Ngôn ngữ - 言語</option>					
						</select>
					</div>
					<div class="col-md-5 form-group">
						<input type="text" class="form-control" id="stringFind"
							name="stringFind">
					</div>
					<div class=" form-group">
						<button type="submit" name="btnFind" value="Find"
							class=" col-md-1 btn btn-primary btn-sm">Tìm kiếm<br>検索</button>
					</div>
				</form>
				<div class="form-group">
					<a href="ShowCreateAccount?type=CTV"><button class=" col-md-1 btn btn-success btn-sm">Tạo tài khoản<br>アカウントの作成
							</button></a>
				</div>
				<div class="form-group">
					<a href="ShowRestoreServlet?type=account&screen=CTV"><button class=" col-md-1 btn btn-success btn-sm">Khôi phục<br>回復
					</button></a>
				</div>
			</div>
					<%if(ctv!=null){ %>
<!---------------------- Liệt kê tất cả cộng tác viên và thông tin ------------------->
			<div class="col-md-12 panel panel-primary">
			<div class="panel-heading">Danh sách Cộng tác viên - 協力者のリスト</div>
  			<div class="panel-body">
			<div class="table-responsive">
				<table class=" table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Họ tên<br>氏名</th>
							<th>Địa chỉ<br>住所</th>
							<th>Điện thoại<br>電話番号</th>
							<th>Email<br>メール</th>
							<th>Tài khoản<br>ユーザー名</th>
							<th>Ngôn ngữ<br>言語</th>
							<th>Tổng số bài viết<br>全ての記事</th>
							<th>Bài đã dịch<br>翻訳された記事</th>		
							<th>Bài đang dịch<br>翻訳中の記事</th>						
							<th>Bài đã gởi<br>送信した記事</th>
							<th>Bài bị lỗi<br>エラされた記事</th>
							<th>Bài đã hủy<br>削除された記事</th>
							<th>Bài mới nhận<br>新しい記事を受け取る</th>		
							<th></th>
							<th></th>
						</tr>
					</thead>
					<%
						for (int i = 0; i < ctv.size(); i++) {							
					%>		
					<tbody>
						
						<tr>
							<%if(ctv.get(i).getTaikhoan()!=null){ %>						
								<td><%=ctv.get(i).getTaikhoan().getIdTaiKhoan()%></td>
								<td><%=ctv.get(i).getTaikhoan().getHoTen()%></td>
								<td><%=ctv.get(i).getTaikhoan().getDiaChi()%></td>
								<td><%=ctv.get(i).getTaikhoan().getDienThoai()%></td>
								<td><%=ctv.get(i).getTaikhoan().getEmail()%></td>
								<td><%=ctv.get(i).getTaikhoan().getTenTaiKhoan()%></td>
								<td><%=ctv.get(i).getTaikhoan().getNgonNgu().equals("vi") ?"Việt Nam - ベトナム":"Nhật Bản - 日本"%></td>
								<td><%=ctv.get(i).getNumberPosts() %></td>
							<%} %>
							<%if(ctv.get(i).getArray_ListPost()!=null ){
									for(int j = 0;j<ctv.get(i).getArray_ListPost().size();j++)
									{
										/* 	0: Bài viết đã dịch
											1: Bài viết đang dịch
											2: Bài viết đã gởi
											3: Bài viết bị lỗi
											4: Bài viết đã hủy
											5: Bài viết mới nhận
										
										*/
										if(ctv.get(i).getArray_ListPost().get(j)!=null){
								%>
								<td><%=ctv.get(i).getArray_ListPost().get(j).size()%><br> <%if(ctv.get(i).getArray_ListPost().get(j).size()!=0){ %><button type="button" class="btn btn-default btn-sm"
									data-toggle="modal"
									data-target="#modalListPosts_<%=i%>_<%=j%>">
									<span class="glyphicon glyphicon-list-alt"></span></button><%} %></td>
								<%
											}else{
								%>
								<td>0</td>
								<%
											}
										
										
									}
							}
								%>
							
							<td></td>							
							<td><button type="button" class="btn btn-default btn-sm"
									data-toggle="modal"
									data-target="#<%if(ctv.get(i).getTaikhoan()!=null){ %><%=ctv.get(i).getTaikhoan().getIdTaiKhoan()%><% }%>">
									<span class="glyphicon glyphicon-pencil"></span>Chỉnh sửa<br>修正
								</button></td>
							<td>
								<button class="btn btn-default btn-sm" type="button" data-toggle="modal" <%if(ctv.get(i).getNumberPosts()!=0){%> disabled="disabled" <% }%> data-target="#delete<%if(ctv.get(i).getTaikhoan()!=null){ %><%=ctv.get(i).getTaikhoan().getIdTaiKhoan()%><% }%>">
									<span class="glyphicon glyphicon-remove"></span>Xóa<br>削除
								</button>
							</td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<div class="menuPhanTrang" id = "divpage">
					<%= request.getAttribute("pageNav") %>
				</div>
			</div>
					<%} %>
		</div>
		</div>
		<%
			if(ctv!=null) {
					for (int i = 0; i < ctv.size(); i++) {
						if(ctv.get(i).getTaikhoan()!=null){
			%>
<!-------------------------- Modal chỉnh sửa--------------------------------->
			<div class="modal fade" id="<%=ctv.get(i).getTaikhoan().getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Chỉnh sửa cộng tác viên - 協力者の修正</h4>
						</div>
						<div class="modal-body">

							<form id="formedit<%=i%>" name="form_edit_admin"
								action="AdminEditServlet?type=CTV" method="post">

								<div class="form-group">
									<label>Tên - 氏名<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=ctv.get(i).getTaikhoan().getHoTen()%>">
								</div>
								<div class="form-group">
									<label>Địa chỉ - 住所<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=ctv.get(i).getTaikhoan().getDiaChi()%>">
								</div>
								<div class="form-group">
									<label>Số điện thoại - 電話番号<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="11"
										name="phone" value="<%=ctv.get(i).getTaikhoan().getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email - メール<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=ctv.get(i).getTaikhoan().getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản - ユーザー名<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=ctv.get(i).getTaikhoan().getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Quyền quản trị - 管理者の権利<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="20"
										name="typeUser" value="ctv"
										readonly="readonly">
								</div>								
								<div class="form-group">
									<label>Ngôn ngữ - 言語</label> <select class="form-control"
										name="language">
										<option value="vi"
											<%if (ctv.get(i).getTaikhoan().getNgonNgu().equals("vi")) {%>
											selected="selected" <%}%> >Tiếng việt - ベトナム語</option>
										<option value="ja"
											<%if (ctv.get(i).getTaikhoan().equals("ja")) {%>
											selected="selected"<%} %>>Tiếng nhật - 日本語</option>																		
									</select>
								</div>	
								<div class="form-group">
									<label>Tình trạng - 状況<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="20"
										name="status" value="<%=ctv.get(i).getTaikhoan().getTinhTrang()%>"
										readonly="readonly">
								</div>													
								<button type="submit" class="btn btn-success btn-sm">Hoàn
									thành - 完成</button>
								<button type="button" id="btn" class="btn btn-default btn-sm btn_modal"
								data-dismiss="modal">Quay lại - 戻り </button>
							</form>

						</div>						
					</div>
				</div>
			</div>
<!------------------------------------ Modal xóa -------------------------------------->
			<div class="modal fade"
				id="delete<%=ctv.get(i).getTaikhoan().getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa tài khoản cộng tác viên - 協力者を削除する</h4>
						</div>
						<div class="modal-body">

							<form name="form_edit_admin" action="AdminDeleteServlet?type=CTV"
								method="post"">
								<div class="form-group">
									<label>Tên tài khoản - ユーザー名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=ctv.get(i).getTaikhoan().getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-sm">Xóa - 削除</button>
								<button type="button" id="btn" class="btn btn-default btn-sm btn_modal"
								data-dismiss="modal">Quay lại - 戻り</button>
							</form>
						</div>						
					</div>
				</div>
			</div>		
			<%
				}
				}
			}
			%>
		<%if(ctv!=null){
			for (int i = 0; i < ctv.size(); i++) {
			if(ctv.get(i).getArray_ListPost()!=null ){
				for(int j = 0;j< ctv.get(i).getArray_ListPost().size();j++)
				{
					/* 	0: Bài viết đã dịch
						1: Bài viết đang dịch
						2: Bài viết đã gởi
						3: Bài viết bị lỗi
						4: Bài viết đã hủy
						5: Bài viết mới nhận
					
					*/
					if(ctv.get(i).getArray_ListPost().get(j)!=null){		
		%>
			<div class="modal fade"
				id="modalListPosts_<%=i %>_<%=j%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Danh sách bài viết - 記事のリスト</h4>
						</div>
						<div class="modal-body">
								
								<div class="table-responsive">
									<table class=" table table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>Tên bài viết<br>記事名</th>
												<th>Danh mục<br> 項目</th>
												<th>Người đăng<br> ユーザー</th>
												<th>Ngày đăng<br> 掲載の日付</th>											
												<th></th>
											</tr>
										</thead>
										<tbody>
											<%for(int k = 0; k<ctv.get(i).getArray_ListPost().get(j).size(); k++){
											%>
												<tr>
													<td><%=ctv.get(i).getArray_ListPost().get(j).get(k).getIdBaiViet() %></td>													
													<td>
														<%if(ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietVi()== null && ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietJa()==null){ %>
															<span class="label label-default">Không có tên bài viết - 記事のタイトルが無い</span>
														<%}else{ %>
															<%if(ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietVi()!= null){%>
																<p><%=ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietVi()%></p> 
															<%}%>
															<%if(ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietJa()!= null){%>
																<p><%=ctv.get(i).getArray_ListPost().get(j).get(k).getTenBaiVietJa()%></p> 
															<%}
														} %>
												</td>
													<td>
														<%=ctv.get(i).getArray_ListPost().get(j).get(k).getDanhMuc().getTenDanhMucVi() %> - 
														<%=ctv.get(i).getArray_ListPost().get(j).get(k).getDanhMuc().getTenDanhMucJa() %>
													</td>
													<td><%=ctv.get(i).getArray_ListPost().get(j).get(k).getTaiKhoan().getTenTaiKhoan()%></td>
													<td><%=ctv.get(i).getArray_ListPost().get(j).get(k).getNgayDang() %></td>
													<td><a href="ShowDetailPostsServlet?id=<%=ctv.get(i).getArray_ListPost().get(j).get(k).getIdBaiViet()%>">
															<button type="button" class="btn btn-primary btn-sm">Chi tiết - 詳細</button>
														</a>
													</td>
												</tr>
											<%} %>
										</tbody>
										</table>
									</div>
						</div>						
					</div>
				</div>
			</div>
		<%}
					}
					}
					}
					}%>
		</div>
	</div>	
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
<%if(ctv!=null){%>
<script>
$(document).ready(function() {	
	for(var i=0;j<<%=ctv.size()%>
	; i++) {
			var validator = $("#formedit" + i).validate({

				rules : {
					name : "required",
					adress : "required",
					phone : {
						required : true,
						digits : true,
						minlength : 10,
					},
				},
				messages : {
					name : "Hãy nhập tên đầy đủ - 完全な名前を入力してください",
					adress : "Hãy nhập địa chỉ - アドレスを入力してください",
					phone : {
						required : "Hãy nhập số điện thoại - 携帯電話を入力します。",
						digits : "Số điện thoại phải là số - 電話番号です",
						minlength : "Số điện thoại ít nhất 10 ký tự - 電話は10文字が含まれています"
					},

				},

			});
		}
	});
</script>
<%}%>
</html>