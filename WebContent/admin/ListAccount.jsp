<%@page import="model.bean.TAIKHOAN"%>
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
<title>Manager</title>
</head>


<%
	TAIKHOAN[] listAccount = (TAIKHOAN[]) request.getAttribute("listAccount");
	String result = (String) request.getAttribute("result");
	TAIKHOAN[] account = (TAIKHOAN[])request.getAttribute("account");
	String button = (String)request.getAttribute("button");
	
	
%>
<%if(listAccount!=null){ %>
<script type="text/javascript">
$(document).ready(function() {	
	for(var i=0;i<<%=listAccount.length%>
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
					name : "Hãy nhập tên của bạn",
					adress : "Hãy nhập địa chỉ của bạn",
					phone : {
						required : "Hãy nhập số điện thoại của bạn",
						digits : "Số điện thoại phải là số",
						minlength : "Số điện thoại ít nhất 10 ký tự"
					},

				},

			});
		}
	});
	function checkValidate(typeFind, stringFind, lengthStringFind) {
		if (stringFind == "") {
			alert("Bạn phải nhập từ cần tìm");
			return false;
		}
		if (stringFind.length > lengthStringFind) {
			alert(typeFind + " tối đa " + lengthStringFind + " ký tự");
			return false;
		}
		if (typeFind == "DienThoai") {
			var patt = /\d{10,11}/;
			if (!patt.test(stringFind)) {
				alert("Số điện thoại không hợp lệ");
				return false;
			}
		}
		if (typeFind == "Email") {
			var patt = /^\w+@\w.+\w$/;
			if (!patt.test(stringFind)) {
				alert("Email không hợp lệ");
				return false;
			}
		}
		if (typeFind == "TenTaiKhoan") {
			var patt = /\W+/;
			if (patt.test(stringFind)) {
				alert("TenTaiKhoan không được chứa ký tự đặt biệt");
				return false;
			}
		}
		if (typeFind == "QuyenQuanTri") {
			if (!(stringFind == "admin" || stringFind == "user" || stringFind == "CTV")) {
				alert("Quyền quản trị phải là: admin, user, CTV");
				return false;
			}
		}
		return true;

	}
	function checkValidateSearch() {
		var typeFind = document.getElementById("typeFind").value;
		var stringFind = document.getElementById("stringFind").value;
		var lengthStringFind;
		if (typeFind == "IdTaiKhoan")
			lengthStringFind = 10;
		else if (typeFind == "HoTen")
			lengthStringFind = 30;
		else if (typeFind == "DiaChi")
			lengthStringFind = 50;
		else if (typeFind == "DienThoai")
			lengthStringFind = 11;
		else if (typeFind == "Email")
			lengthStringFind = 30;
		else if (typeFind == "TenTaiKhoan")
			lengthStringFind = 20;
		else if (typeFind == "QuyenQuanTri")
			lengthStringFind = 5;
		else
			lengthStringFind = 100;
		if (checkValidate(typeFind, stringFind, lengthStringFind)) {
			return true;
		}
		return false;

	}
</script>
<%
	}
%>
<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>

		
			<%@include file="Menu.jsp"%>

		

		<div  style="margin-top: 10px">
			
			<%
				if (listAccount != null) {
			%>
			<div class="row">
				<form action="AdminSearchSevlet" method="post"
					onsubmit="return checkValidateSearch()">
					<h4 class="col-md-1 col-md-offset-1">Tìm kiếm</h4>
					<div class="col-md-2 form-group">
						<select class="form-control" id="typeFind" name="typeFind">
							<option value="IdTaiKhoan">ID</option>
							<option value="HoTen">Họ tên</option>
							<option value="DiaChi">Địa chỉ</option>
							<option value="DienThoai">Địện thoại</option>
							<option value="Email">Email</option>
							<option value="TenTaiKhoan">Tên tài khoản</option>
							<option value="QuyenQuanTri">Quyền quản trị</option>
						</select>
					</div>
					<div class="col-md-5 form-group">
						<input type="text" class="form-control" id="stringFind"
							name="stringFind">
					</div>
					<div class="col-md-1 form-group">
						<button type="submit" name="btnFind" value="Find"
							class="btn btn-primary">Search</button>
					</div>
				</form>
				<div class="col-md-1 form-group">
					<a href="CreateAccount.jsp"><button class="btn btn-success">Create
							</button></a>
				</div>
				<div class="col-md-1 form-group">
					<a href="ShowRestoreServlet?type=account"><button class="btn btn-success">Restore</button></a>
				</div>
			</div>
			
			<!--*********************** Display result ******************************** -->
			<%
				if (button != null) {
					if (account != null) {
			%>
			<div class="panel panel-default">
  <div class="panel-heading">Kết quả</div>
  <div class="panel-body">
			<div class="table-responsive">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>ID</th>
							<th>Họ tên</th>
							<th>Địa chỉ</th>
							<th>Điện thoại</th>
							<th>Email</th>
							<th>Tài khoản</th>
							<th>Phân quyền</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<%
						for (int i = 0; i < account.length; i++) {
					%>
					<tbody>
						<tr>
							<td><%=account[i].getIdTaiKhoan()%></td>
							<td><%=account[i].getHoTen()%></td>
							<td><%=account[i].getDiaChi()%></td>
							<td><%=account[i].getDienThoai()%></td>
							<td><%=account[i].getEmail()%></td>
							<td><%=account[i].getTenTaiKhoan()%></td>
							<td><%=account[i].getQuyenQuanTri()%></td>
							<td><button type="button" class="btn btn-default"
									data-toggle="modal"
									data-target="#<%=account[i].getIdTaiKhoan()%>">
									<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa
								</button></td>
							<td><button type="button" class="btn btn-default"
									data-toggle="modal"
									data-target="#delete<%=account[i].getIdTaiKhoan()%>">
									<span class="glyphicon glyphicon-remove"></span> Xóa
								</button></td>
						</tr>
					</tbody>


					<%
						}
					%>
				</table>
			</div>
			</div>
</div>
			<%
				} 
			
			
			
				}
			%>
			<%
				if (result != null) {
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Thông báo</div>
				<div class="panel-body"><%=result%></div>
			</div>
			<%
				}
			%>
			
			<!-- ********************************************************************** -->
			<div class="table-responsive">
				<table class=" table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Họ tên</th>
							<th>Địa chỉ</th>
							<th>Điện thoại</th>
							<th>Email</th>
							<th>Tài khoản</th>
							<th>Phân quyền</th>
							<th>Ngôn ngữ</th>
							<th>Tình trạng</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<%
						for (int i = 0; i < listAccount.length; i++) {
					%>
		
					<tbody>
						<tr>
							<td><%=listAccount[i].getIdTaiKhoan()%></td>
							<td><%=listAccount[i].getHoTen()%></td>
							<td><%=listAccount[i].getDiaChi()%></td>
							<td><%=listAccount[i].getDienThoai()%></td>
							<td><%=listAccount[i].getEmail()%></td>
							<td><%=listAccount[i].getTenTaiKhoan()%></td>
							<td><%=listAccount[i].getQuyenQuanTri()%></td>
							<td><%if(listAccount[i].getQuyenQuanTri().equals("CTV")){ %>
									<%=listAccount[i].getNgonNgu() %>
								<%} %>
							</td>
							<td><%=listAccount[i].getTinhTrang() %></td>
							<td><button type="button" class="btn btn-default"
									data-toggle="modal"
									data-target="#<%=listAccount[i].getIdTaiKhoan()%>">
									<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa
								</button></td>
							<td><button type="button" data-toggle="modal"
									data-target="#delete<%=listAccount[i].getIdTaiKhoan()%>"
									<%if (listAccount[i].getQuyenQuanTri().equals("admin")) {%>
									class="btn btn-default disabled" <%} else {%>
									class="btn btn-default" <%}%>>
									<span class="glyphicon glyphicon-remove"></span> Xóa
								</button></td>
						</tr>
					</tbody>


					<%
						}
					%>
				</table>
			</div>
			<%
				} else {
			%>
			<div class="panel panel-info">
				<div class="panel-heading">Thông báo</div>
				<div class="panel-body">
					Không có tài khoản trong cơ sở dữ liệu 
				</div>
			</div>
			<a href="CreateAccount.jsp"><button
							class="btn btn-success">Create Account</button></a> <br>				
			<a href="ShowRestoreServlet?type=account"><button class="btn btn-success">Restore</button></a>		
			<%
				}
				if (listAccount != null) {
					for (int i = 0; i < listAccount.length; i++) {
			%>

			<!-- Modal -->
			<div class="modal fade" id="<%=listAccount[i].getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Chỉnh sửa tài khoản(Admin)</h4>
						</div>
						<div class="modal-body">

							<form id="formedit<%=i%>" name="form_edit_admin"
								action="AdminEditServlet" method="post">

								<div class="form-group">
									<label>Tên<span class="rq"> * </span>:
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=listAccount[i].getHoTen()%>">

								</div>
								<div class="form-group">
									<label>Địa chỉ<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=listAccount[i].getDiaChi()%>">

								</div>
								<div class="form-group">
									<label>Số điện thoại<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="11"
										name="phone" value="<%=listAccount[i].getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=listAccount[i].getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=listAccount[i].getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Quyền quản trị:</label> <select class="form-control"
										name="typeUser">
										<option value="admin"
											<%if (listAccount[i].getQuyenQuanTri().equals("admin")) {%>
											selected="selected" <%}%> >Admin</option>
										<option value="user"
											<%if (listAccount[i].getQuyenQuanTri().equals("user")) {%>
											selected="selected" <%} if(listAccount[i].getQuyenQuanTri().equals("admin")){%>
											disabled="disabled"
											<%}%>>User</option>
										<option value="CTV"
											<%if (listAccount[i].getQuyenQuanTri().equals("CTV")) {%>
											selected="selected" <%} if(listAccount[i].getQuyenQuanTri().equals("admin")){%>
											disabled="disabled"
											<%}%>>CTV</option>											
									</select>
								</div>
								<%if(listAccount[i].getQuyenQuanTri().equals("CTV")){ %>
								<div class="form-group">
									<label>Ngôn ngữ</label> <select class="form-control"
										name="language">
										<option value="Tiếng việt"
											<%if (listAccount[i].getNgonNgu().equals("Tiếng việt")) {%>
											selected="selected" <%}%> >Tiếng việt</option>
										<option value="日本"
											<%if (listAccount[i].getNgonNgu().equals("日本")) {%>
											selected="selected"<%} %>>日本</option>																		
									</select>
								</div>
									<div class="form-group">
									<label>Tình trạng<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="status"  value="<%=listAccount[i].getTinhTrang()%>">

								</div>
							<%} %>
								<button type="submit" class="btn btn-success btn-lg">Hoàn
									thành</button>
							</form>

						</div>
						<div class="modal-footer">
							<button type="button" id="btn" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


			<!-- end Modal -->


			<!-- Modal -->
			<div class="modal fade"
				id="delete<%=listAccount[i].getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa tài khoản(Admin)</h4>
						</div>
						<div class="modal-body">

							<form name="form_edit_admin" action="AdminDeleteServlet"
								method="post">


								<div class="form-group">
									<label>Tên tài khoản<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=listAccount[i].getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-lg">Xóa</button>
							</form>

						</div>
						<div class="modal-footer">
							<button type="button" id="btn" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


			<!-- end Modal -->
			<%
				}
				}
			%>
		</div>
	
	</div>
</body>
</html>