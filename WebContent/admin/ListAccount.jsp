<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<!-- ------------------CSS-------------------------- -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/listAccount.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>

<title>Quản lý người dùng - ユーザーの管理</title>
</head>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	ArrayList<TAIKHOAN> accounts = (ArrayList<TAIKHOAN>) request.getAttribute("accounts");
	String result = (String) request.getAttribute("result");
	ArrayList<TAIKHOAN> account = (ArrayList<TAIKHOAN>)request.getAttribute("account");
	String pageNavSearch = (String)request.getAttribute("pageNavSearch");
	String button = (String)request.getAttribute("button");		
	//Nhận lại kết quả khôi phục
	String result_Restore = (String)request.getAttribute("result_Restore");	 
%>
<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
			<div class="row">
				<%
					//Hiển thị kết quả chỉnh sửa và xóa, tạo tài khoản
					if (result != null) {
						if(result.contains("thành công")){
				%>
							<div class="notice col-md-6 col-md-offset-3 alert alert-info">
								<p><span class="glyphicon glyphicon-info-sign"></span><strong>Thông báo - 情報</strong></p>
								<p><%=result%></p>
							</div>
							<%}else{ %>
							<div class=" notice col-md-6 col-md-offset-3 alert alert-danger">
								<p><span class = "glyphicon glyphicon-exclamation-sign"></span><strong>Thông báo - 情報</strong></p>
								<p><%=result%></p>
							</div>
				<%}
					}
					//Hiển thị kết quả khôi phục
					if(result_Restore!=null){
						if(result_Restore.contains("thành công")){
				%>
							<div class=" notice col-md-6 col-md-offset-3 alert alert-info">
								<p><span class="glyphicon glyphicon-info-sign"></span><strong>Thông báo - 情報</strong></p>
								<p><%=result_Restore%></p>
							</div>
						<%}else{ %>
						<div class=" notice col-md-6 col-md-offset-3 alert alert-danger">
								<p><span class = "glyphicon glyphicon-exclamation-sign"></span><strong>Thông báo - 情報</strong></p>
								<p><%=result_Restore%></p>
							</div>
				<%}
					}
				%>
			</div>
			<div class="container-fluid">
				<form action="AdminSearchSevlet?type=User" method="post"
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
							<option value="QuyenQuanTri">Quyền quản trị - 管理者の権利</option>
						</select>
					</div>
					<div class="col-md-5 form-group">
						<input type="text" class="form-control" id="stringFind"
							name="stringFind">
					</div>
					<div class=" form-group">
						<button type="submit" name="btnFind" value="Find"
							class=" col-md-1 btn btn-primary" data-toggle="tooltip" title="Tìm kiếm - 検索" data-placement="bottom">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</form>
				<div class="form-group">
					<a href="ShowCreateAccount?type=user"><button
							class=" col-md-1 btn btn-success" data-toggle="tooltip" title="Tạo tài khoản - アカウントの作成" data-placement="bottom">
							<span class="glyphicon glyphicon-user"></span>
						</button></a>
				</div>
				<div class="form-group">
					<a href="ShowRestoreServlet?type=account&screen=User"><button
							class=" col-md-1 btn btn-success" data-toggle="tooltip" title="Khôi phục - 回復" data-placement="bottom">
							<span class="glyphicon glyphicon-share-alt"></span>
						</button></a>
				</div>
			</div>
			<%
				if (button != null) {
			%>

			<!--*********************** Hiển thị kết quả ******************************** -->
			<%
				if (account != null) {
			%>
			<div class="col-md-10 col-md-offset-1 panel panel-success">
				<div class="panel-heading">Kết quả - 結果</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover table-condensed table-striped ">
							<thead>
								<tr>
									<th>ID</th>
									<th>Họ tên<br>氏名</th>
									<th>Địa chỉ<br>住所</th>
									<th>Điện thoại<br>電話番号</th>
									<th>Email<br>メール</th>
									<th>Tài khoản<br>ユーザー名</th>
									<th>Phân quyền<br>管理者の権利</th>
									<th>Ngôn ngữ<br>言語</th>
									<th>Tình trạng<br>状態</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<%
								for (int i = 0; i < account.size(); i++) {
							%>
							<tbody>
								<tr>
									<td><p><%= (account.get(i).getIdTaiKhoan()== null)		? "" : account.get(i).getIdTaiKhoan()%></p></td>
									<td><p><%= (account.get(i).getHoTen() == null)			? "" : account.get(i).getHoTen()%></p></td>
									<td><p><%= (account.get(i).getDiaChi() == null)		? "" : account.get(i).getDiaChi()%></p></td>
									<td><p><%= (account.get(i).getDienThoai()== null)		? "" : account.get(i).getDienThoai()%></p></td>
									<td><p><%= (account.get(i).getEmail() == null) 		? "" : account.get(i).getEmail()%></p></td>
									<td><p><%= (account.get(i).getTenTaiKhoan() == null)	? "" : account.get(i).getTenTaiKhoan()%></p></td>
									<td><p><%= (account.get(i).getQuyenQuanTri() == null)	? "" :account.get(i).getQuyenQuanTri()%></p></td>
									<td><p><%= (account.get(i).getNgonNgu() == null)		? "" : (account.get(i).getNgonNgu().equals("vi") ?"Việt Nam <br> ベトナム":"Nhật Bản <br> 日本")%></p></td>
									<td>
										<div class="resultMessage_<%=account.get(i).getIdTaiKhoan()%>">
											<p><%=(account.get(i).getTinhTrang() == null)	? "" :(account.get(i).getTinhTrang().equals("MoiTao")? "Mới tạo <br>新規 " : (account.get(i).getTinhTrang().equals("CanhCao1")) ? "Cảnh cáo lần 1 <br>第1回目の警告" : (account.get(i).getTinhTrang().equals("CanhCao2")) ? "Cảnh cáo lần 2 <br>第2回目の警告 " : (account.get(i).getTinhTrang().equals("CanhCao3")) ? "Cảnh cáo lần 3 <br>第3回目の警告" : (account.get(i).getTinhTrang().equals("KhoaTK") )? "Khóa tài khoản <br>アカウントをロックする。" : "Mới tạo<br>新規")%></p>
										</div>
									</td>
										<td><button type="button"
											<%if(account.get(i).getQuyenQuanTri().equals("admin")){%>
											disabled="disabled" <%}%>
											id="<%=account.get(i).getIdTaiKhoan()%>"
											class="btn btn-warning btn-sm btnban" title="Chuyển trạng thái - 状態を変更する。" data-placement="bottom" onclick="banAcc()">
											<span class="glyphicon glyphicon-lock"></span>
										</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											data-toggle="modal" title="Chỉnh sửa - 修正" data-placement="bottom"
											data-target="#edit_<%=account.get(i).getIdTaiKhoan()%>">
											<span class="glyphicon glyphicon-pencil"></span> 
										</button>
									</td>
									<td><button type="button" <%if (account.get(i).getQuyenQuanTri().equals("admin")) {%>
											class="btn btn-danger btn-sm disabled" <%} else {%>
											data-toggle="modal" title="Xóa - 削除" data-placement="bottom"
											data-target="#delete_<%=account.get(i).getIdTaiKhoan()%>"
											class="btn btn-danger btn-sm" <%}%>>
											<span class="glyphicon glyphicon-remove"></span>
										</button>
									</td>
								</tr>
							</tbody>
							<%
								}
							%>
						</table>
					</div>
				</div>
				<%
					if(pageNavSearch!=null){
				%>
				<div id="divpage" class="menuPhanTrang">
					<%=pageNavSearch%>
				</div>
				<%
					}
				%>
			</div>
			<%
				for (int i = 0; i < account.size(); i++) {
			%>
			<!-------------------------- Modal chỉnh sửa--------------------------------->
			<div class="modal fade"
				id="edit_<%=account.get(i).getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Chỉnh sửa tài khoản(Admin) -
								アカウントの修正（管理者）</h4>
						</div>
						<div class="modal-body">

							<form id="formedit<%=i%>" name="form_edit_admin"
								action="AdminEditServlet?type=user" method="get">

								<div class="form-group">
									<label>Tên - 氏名<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=account.get(i).getHoTen()%>">

								</div>
								<div class="form-group">
									<label>Địa chỉ - 住所<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=account.get(i).getDiaChi()%>">

								</div>
								<div class="form-group">
									<label>Số điện thoại - 電話番号<span class="rq"> * </span>
									</label> <input type="text" class="form-control"
										name="phone" value="<%=account.get(i).getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email - メール<span class="rq"> * </span>
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=account.get(i).getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản - ユーザー名<span class="rq"> *
									</span>
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=account.get(i).getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Quyền quản trị - 管理者の権利</label> <select
										class="form-control" name="typeUser">
										<option value="admin"
											<%if (account.get(i).getQuyenQuanTri().equals("admin")) {%>
											selected="selected" <%}%>>Admin - 管理者</option>
										<option value="user"
											<%if (account.get(i).getQuyenQuanTri().equals("user")) {%>
											selected="selected"
											<%} if(account.get(i).getQuyenQuanTri().equals("admin")){%>
											disabled="disabled" <%}%>>User - ユーザー</option>
										<option value="CTV"
											<%if (account.get(i).getQuyenQuanTri().equals("ctv")) {%>
											selected="selected"
											<%} if(account.get(i).getQuyenQuanTri().equals("admin")){%>
											disabled="disabled" <%}%>>CTV - 協力者</option>
									</select>
								</div>
								<div class="form-group">
									<label>Ngôn ngữ - 言語</label> <select class="form-control"
										name="language">
										<option value="vi"
											<%if (account.get(i).getNgonNgu() != null && account.get(i).getNgonNgu().equals("vi")) {%>
													selected="selected" <%}%>>Tiếng việt - ベトナム語</option>
												<option value="ja"
													<%if (account.get(i).getNgonNgu() != null && account.get(i).getNgonNgu().equals("ja")) {%>
													selected="selected" <%}%>>Tiếng nhật - 日本語</option>
									</select>
								</div>
								<div class="form-group">
									<label>Tình trạng - 状況<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="State" value="<%=account.get(i).getTinhTrang()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-sm">Hoàn
									thành - 完成</button>
								<button type="button" id="btn"
									class="btn btn-default btn-sm btn_modal" data-dismiss="modal">Quay
									lại - 戻り</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!------------------------------------ Modal xóa -------------------------------------->
			<div class="modal fade"
				id="delete_<%=account.get(i).getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa tài khoản - アカウントの削除</h4>
						</div>
						<div class="modal-body">

							<form name="form_edit_admin"
								action="AdminDeleteServlet?type=user" method="post">
								<div class="form-group">
									<label>Tên tài khoản - ユーザー名<span class="rq"> *
									</span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=account.get(i).getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-sm">Xóa
									- 削除</button>
								<button type="button" id="btn"
									class="btn btn-default btn-sm btn_modal" data-dismiss="modal">Quay
									lại - 戻り</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<%
				}
									//Khi không tìm thấy kết quả nào
									else{
			%>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
				<strong>Thông báo - お知らせ</strong> Không tìm thấy kết quả nào - データベースにアカウントを存しません。
			</div>
			<%
				}
					}else{
						if (accounts != null) {
			%>
<!-- ********************Hiển thị danh sách người dùng******************************************* -->
			<div class="col-md-12 panel panel-primary">
				<div class="panel-heading">Danh sách người dùng - リストアカウント</div>
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
									<th>Phân quyền<br>管理者の権利</th>
									<th>Ngôn ngữ<br>言語</th>
									<th>Tình trạng<br>状態</th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<%
								for (int i = 0; i < accounts.size(); i++) {
							%>
							<tbody>
								<tr>
									<td><p><%= (accounts.get(i).getIdTaiKhoan()== null)		? "" : accounts.get(i).getIdTaiKhoan()%></p></td>
									<td><p><%= (accounts.get(i).getHoTen() == null)			? "" : accounts.get(i).getHoTen()%></p></td>
									<td><p><%= (accounts.get(i).getDiaChi() == null)		? "" : accounts.get(i).getDiaChi()%></p></td>
									<td><p><%= (accounts.get(i).getDienThoai()== null)		? "" : accounts.get(i).getDienThoai()%></p></td>
									<td><p><%= (accounts.get(i).getEmail() == null) 		? "" : accounts.get(i).getEmail()%></p></td>
									<td><p><%= (accounts.get(i).getTenTaiKhoan() == null)	? "" : accounts.get(i).getTenTaiKhoan()%></p></td>
									<td><p><%= (accounts.get(i).getQuyenQuanTri() == null)	? "" :accounts.get(i).getQuyenQuanTri()%></p></td>
									<td><p><%= (accounts.get(i).getNgonNgu() == null)		? "" : (accounts.get(i).getNgonNgu().equals("vi") ?"Việt Nam <br> ベトナム":"Nhật Bản <br> 日本")%></p></td>
									<td>
										<div class="resultMessage_<%=accounts.get(i).getIdTaiKhoan()%> number">
											<p><%=(accounts.get(i).getTinhTrang() == null)	? "" :(accounts.get(i).getTinhTrang().equals("MoiTao")? "Mới tạo <br>新規 " : (accounts.get(i).getTinhTrang().equals("CanhCao1")) ? "Cảnh cáo lần 1 <br>第1回目の警告" : (accounts.get(i).getTinhTrang().equals("CanhCao2")) ? "Cảnh cáo lần 2 <br>第2回目の警告 " : (accounts.get(i).getTinhTrang().equals("CanhCao3")) ? "Cảnh cáo lần 3 <br>第3回目の警告" : (accounts.get(i).getTinhTrang().equals("KhoaTK") )? "Khóa tài khoản <br>アカウントをロックする。" : "Mới tạo<br>新規")%></p>
										</div>
									</td>
									<td><button type="button"
											<%if(accounts.get(i).getQuyenQuanTri().equals("admin")){%>
											disabled="disabled" <%}%>
											id="<%=accounts.get(i).getIdTaiKhoan()%>"
											class="btn btn-warning btn-sm btnban" title="Chuyển trạng thái - 状態を変更する。" data-placement="bottom" onclick="banAcc()">
											<span class="glyphicon glyphicon-lock"></span>
											
										</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											data-toggle="modal" title="Chỉnh sửa - 修正" data-placement="bottom"
											data-target="#edit_<%=accounts.get(i).getIdTaiKhoan()%>">
											<span class="glyphicon glyphicon-pencil"></span> 
										</button>
									</td>
									<td><button type="button" <%if (accounts.get(i).getQuyenQuanTri().equals("admin")) {%>
											class="btn btn-danger btn-sm disabled" <%} else {%>
											data-toggle="modal" title="Xóa - 削除" data-placement="bottom"
											data-target="#delete_<%=accounts.get(i).getIdTaiKhoan()%>"
											class="btn btn-danger btn-sm" <%}%>>
											<span class="glyphicon glyphicon-remove"></span>
										</button>
									</td>
								</tr>
							</tbody>
							<%
								}
							%>
						</table>
					</div>
					<div class="alert alert-info">
						<p><strong>Tình trạng: </strong>Mới tạo(MoiTao) -> Cảnh cáo lần
						1(CanhCao1) -> Cảnh cáo lần 2(CanhCao2) -> Cảnh cáo lần
						3(CanhCao3) -> Khóa tài khoản(KhoaTK)</p>
						<p><strong>状況: </strong>新規 -> 第1回目の警告 -> 第2回目の警告-> 第3回目の警告 -> アカウントをロックする。</p>
					</div>
					<div id="divpage" class="menuPhanTrang">
						<%=request.getAttribute("pageNav")%>
					</div>
					<%
						for (int i = 0; i < accounts.size(); i++) {
					%>
					<!-------------------------- Modal chỉnh sửa--------------------------------->
					<div class="modal fade"
						id="edit_<%=accounts.get(i).getIdTaiKhoan()%>">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Chỉnh sửa tài khoản(Admin) -
										アカウントの修正（管理者）</h4>
								</div>
								<div class="modal-body">
									<form id="formedit<%=i%>" name="form_edit_admin"
										action="AdminEditServlet?type=user" method="post">

										<div class="form-group">
											<label>Tên - 氏名<span class="rq"> * </span>
											</label> <input class="form-control" maxlength="30" type="text"
												name="name" id="name"
												value="<%=accounts.get(i).getHoTen()%>">
										</div>
										<div class="form-group">
											<label>Địa chỉ - 住所<span class="rq"> * </span>
											</label> <input type="text" class="form-control" maxlength="100"
												name="adress" value="<%=accounts.get(i).getDiaChi()%>">

										</div>
										<div class="form-group">
											<label>Số điện thoại - 電話番号<span class="rq"> *</span>
											</label> <input type="text" class="form-control"
												name="phone" value="<%=accounts.get(i).getDienThoai()%>">
										</div>
										<div class="form-group">
											<label>Email - メール<span class="rq"> * </span>
											</label> <input type="text" class="form-control" maxlength="30"
												name="email" value="<%=accounts.get(i).getEmail()%>"
												readonly="readonly">
										</div>
										<div class="form-group">
											<label>Tên tài khoản - ユーザー名<span class="rq">* </span>
											</label> <input type="text" class="form-control" maxlength="20"
												name="username"
												value="<%=accounts.get(i).getTenTaiKhoan()%>"
												readonly="readonly">
										</div>
										<div class="form-group">
											<label>Quyền quản trị - 管理者の権利:</label> <select
												class="form-control" name="typeUser">
												<option value="admin"
													<%if (accounts.get(i).getQuyenQuanTri().equals("admin")) {%>
													selected="selected" <%}%>>Admin - 管理者</option>
												<option value="user"
													<%if (accounts.get(i).getQuyenQuanTri().equals("user")) {%>
													selected="selected"
													<%} if(accounts.get(i).getQuyenQuanTri().equals("admin")){%>
													disabled="disabled" <%}%>>User - ユーザー</option>
												<option value="CTV"
													<%if (accounts.get(i).getQuyenQuanTri().equals("ctv")) {%>
													selected="selected"
													<%} if(accounts.get(i).getQuyenQuanTri().equals("admin")){%>
													disabled="disabled" <%}%>>CTV - 協力者</option>
											</select>
										</div>
										<div class="form-group">
											<label>Ngôn ngữ - 言語</label> <select class="form-control"
												name="language">
												<option value="vi"
													<%if (accounts.get(i).getNgonNgu() != null && accounts.get(i).getNgonNgu().equals("vi")) {%>
													selected="selected" <%}%>>Tiếng việt - ベトナム語</option>
												<option value="ja"
													<%if (accounts.get(i).getNgonNgu() != null && accounts.get(i).getNgonNgu().equals("ja")) {%>
													selected="selected" <%}%>>Tiếng nhật - 日本語</option>
											</select>
										</div>
										<div class="form-group">
											<label>Tình trạng - 状況<span class="rq"> * </span>
											</label><input class="form-control" type="text" name="State"
														value="<%=accounts.get(i).getTinhTrang()%>"
														readonly="readonly">
										</div>
										<button type="submit" class="btn btn-success btn-sm">Hoàn
											thành - 完成</button>
										<button type="button" id="btn"
											class="btn btn-default btn-sm btn_modal" data-dismiss="modal">Quay
											lại - 戻り</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!------------------------------------ Modal xóa -------------------------------------->
					<div class="modal fade"
						id="delete_<%=accounts.get(i).getIdTaiKhoan()%>">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Xóa tài khoản - アカウントの削除</h4>
								</div>
								<div class="modal-body">

									<form name="form_edit_admin"
										action="AdminDeleteServlet?type=user" method="post">
										<div class="form-group">
											<label>Tên tài khoản - ユーザー名<span class="rq">
													* </span>:
											</label> <input type="text" class="form-control" maxlength="20"
												name="username"
												value="<%=accounts.get(i).getTenTaiKhoan()%>"
												readonly="readonly">
										</div>
										<button type="submit" class="btn btn-success btn-sm">Xóa
											- 削除</button>
										<button type="button" id="btn"
											class="btn btn-default btn-sm btn_modal" data-dismiss="modal">Quay
											lại - 戻り</button>
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
				</div>
			</div>
		</div>
	</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
	
</body>
<!-- ------------------JS-------------------------- -->
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<script type="text/javascript" src="js/listAccount.js"></script>
<%if(accounts!=null){ %>
<script>
$(document).ready(function() {	
	for(var i=0;i<<%=accounts.size()%>; i++) {
		var validator = $("#formedit" + i).validate(
			{
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
								name : "Hãy nhập tên đầy đủ - お客様の氏名を入力下さい。",
								adress : "Hãy nhập địa chỉ - お客様の住所を入力下さい。",
								phone : {
										required : "Hãy nhập số điện thoại - お客様の電話番号を入力下さい。",
										digits : "Số điện thoại phải là số - 電話番号は必ず？",
										minlength : "Số điện thoại ít nhất 10 ký tự - 電話番号は最低に10数字です。"
										},
								},
						});
				}
		});
</script>
<%
	}
%>
</html>