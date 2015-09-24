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
<link rel="stylesheet" href="css/listAccount.css">
<title>Quản lý người dùng - ユーザーの管理</title>
<script type="text/javascript">

function delayer(){	
    window.location = "ListAccountServlet"
}

</script>
<style type="text/css">
</style>
</head>


<%
	TAIKHOAN[] listAccount = (TAIKHOAN[]) request.getAttribute("listAccount");
	String result = (String) request.getAttribute("result");
	System.out.println("resultlistAcc: "+result);
	TAIKHOAN[] account = (TAIKHOAN[])request.getAttribute("account");
	String button = (String)request.getAttribute("button");		
	//Nhận lại kết quả khôi phục
	String result_Restore = (String)request.getAttribute("result_Restore");	 
%>
<%if(listAccount!=null){ %>
<script>
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
	function checkValidate(typeFind, stringFind, lengthStringFind) {
		if (stringFind == "") {
			alert("Bạn phải nhập từ cần tìm - 検索したい単語を入力してください");
			return false;
		}
		if (stringFind.length > lengthStringFind) {
			alert(typeFind + " tối đa - 最大 " + lengthStringFind + " ký tự - キャラクター");
			return false;
		}
		if (typeFind == "DienThoai") {
			var patt = /\d{10,11}/;
			if (!patt.test(stringFind)) {
				alert("Số điện thoại không hợp lệ - 電話は無効です。");
				return false;
			}
		}
		if (typeFind == "Email") {
			var patt = /^\w+@\w.+\w$/;
			if (!patt.test(stringFind)) {
				alert("Email không hợp lệ - メールが無効です");
				return false;
			}
		}
		if (typeFind == "TenTaiKhoan") {
			var patt = /\W+/;
			if (patt.test(stringFind)) {
				alert("TenTaiKhoan không được chứa ký tự đặt biệt - ユーザー名は、特殊文字が含まれていません");
				return false;
			}
		}
		if (typeFind == "QuyenQuanTri") {
			if (!(stringFind == "admin" || stringFind == "user" || stringFind == "CTV")) {
				alert("Quyền quản trị phải là: admin, user, CTV - 管理者必見管理者、ユーザー、CTVです");
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
<body onLoad="setTimeout('delayer()', 15000)">
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="divcontent">	
		<%
			//Hiển thị kết quả chỉnh sửa và xóa
				if (result != null) {
			%>
						<div class="col-md-4 col-md-offset-4 alert alert-info">
						  <strong>Thông báo - 情報!</strong><%=result %>
						</div>
			<%
				}
			//Hiển thị kết quả khôi phục
			if(result_Restore!=null){
				%>
				<div class="col-md-4 col-md-offset-4 alert alert-info">
						  <strong>Thông báo - 情報!</strong><%=result_Restore %>
						</div>
			<%
			}
			%>	
					
		
			<%
				if (listAccount != null) {
			%>
			<div class="col-md-10 col-md-offset-1">				
				<form action="AdminSearchSevlet" method="post"
					onsubmit="return checkValidateSearch()">
					<h4 class="col-md-2">Tìm kiếm - 見附る</h4>
					<div class="col-md-2 form-group">
						<select class="form-control" id="typeFind" name="typeFind">
							<option value="IdTaiKhoan">ID</option>
							<option value="HoTen">Họ tên - 名前</option>
							<option value="DiaChi">Địa chỉ - 住所</option>
							<option value="DienThoai">Địện thoại - 電話</option>
							<option value="Email">Email - Eメール</option>
							<option value="TenTaiKhoan">Tên tài khoản - ユーザ名</option>
							<option value="QuyenQuanTri">Quyền quản trị - 管理者</option>
						</select>
					</div>
					<div class="col-md-5 form-group">
						<input type="text" class="form-control" id="stringFind"
							name="stringFind">
					</div>
					<div class=" form-group">
						<button type="submit" name="btnFind" value="Find"
							class=" col-md-1 btn btn-primary btn-sm">Tìm kiếm<br>見附る</button>
					</div>
				</form>
				<div class="form-group">
					<a href="ShowCreateAccount"><button class=" col-md-1 btn btn-success btn-sm">Tạo tài khoản<br>アカウントを作成する
							</button></a>
				</div>
				<div class="form-group">
					<a href="ShowRestoreServlet?type=account"><button class=" col-md-1 btn btn-success btn-sm">Khôi phục<br>リストア
					</button></a>
				</div>
			</div>
			
<!--*********************** Hiển thị kết quả ******************************** -->
			<%
				if (button != null) {
					if (account != null) {
			%>
				<div class="col-md-10 col-md-offset-1 panel panel-default">
  					<div class="panel-heading">Kết quả - 結果</div>
  					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover table-condensed table-striped ">
								<thead>
									<tr>
										<th>ID</th>
										<th>Họ tên<br>名前</th>
										<th>Địa chỉ<br>住所</th>
										<th>Điện thoại<br>電話</th>
										<th>Email<br>Eメール</th>
										<th>Tài khoản<br>ユーザ名</th>
										<th>Phân quyền<br>タイプ</th>
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
										<td><button type="button" class="btn btn-default btn-sm"
											data-toggle="modal"
											data-target="#<%=account[i].getIdTaiKhoan()%>">
											<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa<br>編集
											</button>
										</td>
										<td><button type="button" class="btn btn-default btn-sm"
											<%if(account[i].getQuyenQuanTri().equals("admin")){ %>
												disabled="disabled"
											<%} %>
											data-toggle="modal"
											data-target="#delete<%=account[i].getIdTaiKhoan()%>">
											<span class="glyphicon glyphicon-remove"></span> Xóa<br>デリート										
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
				</div>
			<%
				}
					//Khi không tìm thấy kết quả nào
					else{
			%>			
						<div class="col-md-6 col-md-offset-3 alert alert-info">
						  <strong>Thông báo - 情報!</strong> Không tìm thấy kết quả nào - することはできません発見.
						</div>
			<%
					}
				}
			%>			
<!-- ********************Hiển thị danh sách người dùng******************************************* -->
		<div class="col-md-10 col-md-offset-1 panel panel-primary">
			<div class="panel-heading">Danh sách người dùng - リストアカウント</div>
  			<div class="panel-body">
			<div class="table-responsive">
				<table class=" table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Họ tên<br>名前</th>
							<th>Địa chỉ<br>住所</th>
							<th>Điện thoại<br>電話</th>
							<th>Email<br>Eメール</th>
							<th>Tài khoản<br>ユーザ名</th>
							<th>Phân quyền<br>タイプ</th>
							<th>Ngôn ngữ<br>言語</th>
<!-- 							<th>Tình trạng<br>状態</th> -->
							<th></th>
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
							<td><%=listAccount[i].getNgonNgu() %>								
							</td>
<%-- 							<td><%=listAccount[i].getTinhTrang() %></td> --%>
							<td><button type="button" <%if(listAccount[i].getQuyenQuanTri().equals("admin")){ %> disabled="disabled" <%} %> id="<%=listAccount[i].getIdTaiKhoan()%>" data-toggle="tooltip" title="Tình trạng: <%=listAccount[i].getTinhTrang() %>" class="btn btn-default btn-sm btnban" onclick="banAcc()"><span class="glyphicon glyphicon-lock"></span></button></td>
							<td><button type="button" class="btn btn-default btn-sm"
									data-toggle="modal"
									data-target="#<%=listAccount[i].getIdTaiKhoan()%>">
									<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa<br>編集
								</button></td>
							<td><button type="button" data-toggle="modal"
									data-target="#delete<%=listAccount[i].getIdTaiKhoan()%>"
									<%if (listAccount[i].getQuyenQuanTri().equals("admin")) {%>
									class="btn btn-default btn-sm disabled" <%} else {%>
									class="btn btn-default btn-sm" <%}%>>
									<span class="glyphicon glyphicon-remove"></span> Xóa<br>デリート
								</button></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>							
			</div>
			<div class="alert alert-info">
			<strong>Tình trạng: </strong>Mới tạo(MoiTao) -> Cảnh cáo lần 1(CanhCao1) -> Cảnh cáo lần 2(CanhCao2) -> Cảnh cáo lần 3(CanhCao3) -> Khóa tài khoản(KhoaTK)
			</div>	
			<div id="divpage" class="menuPhanTrang">
				<%= request.getAttribute("pageNav") %>
			</div>
			<%
				} else {
			%>
			<div class="alert alert-info">
  				<strong>Thông báo - 情報!</strong> Không có người dùng nào - ユーザーがいません.
			</div>
			<a href="CreateAccount.jsp"><button
							class="btn btn-success">Tạo tài khoản<br>アカウントを作成する</button></a> <br>				
			<a href="ShowRestoreServlet?type=account"><button class="btn btn-success">Khôi phục<br>リストア</button></a>
		</div>		
		</div>
		
			<%
				}
				if (listAccount != null) {
					for (int i = 0; i < listAccount.length; i++) {
			%>
<!-------------------------- Modal chỉnh sửa--------------------------------->
			<div class="modal fade" id="<%=listAccount[i].getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Chỉnh sửa tài khoản(Admin) - 編集アカウント(管理者)</h4>
						</div>
						<div class="modal-body">

							<form id="formedit<%=i%>" name="form_edit_admin"
								action="AdminEditServlet" method="post">

								<div class="form-group">
									<label>Tên - 名前<span class="rq"> * </span>:
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=listAccount[i].getHoTen()%>">

								</div>
								<div class="form-group">
									<label>Địa chỉ - 住所<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=listAccount[i].getDiaChi()%>">

								</div>
								<div class="form-group">
									<label>Số điện thoại - 電話<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="11"
										name="phone" value="<%=listAccount[i].getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email - Eメール<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=listAccount[i].getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản - ユーザ名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=listAccount[i].getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Quyền quản trị - タイプ:</label> <select class="form-control"
										name="typeUser">
										<option value="admin"
											<%if (listAccount[i].getQuyenQuanTri().equals("admin")) {%>
											selected="selected" <%}%> >Admin - 管理者</option>
										<option value="user"
											<%if (listAccount[i].getQuyenQuanTri().equals("user")) {%>
											selected="selected" <%} if(listAccount[i].getQuyenQuanTri().equals("admin")){%>
											disabled="disabled"
											<%}%>>User - ユーザー</option>
										<option value="CTV"
											<%if (listAccount[i].getQuyenQuanTri().equals("ctv")) {%>
											selected="selected" <%} if(listAccount[i].getQuyenQuanTri().equals("admin")){%>
											disabled="disabled"
											<%}%>>CTV</option>											
									</select>
								</div>								
								<div class="form-group">
									<label>Ngôn ngữ - 言語</label> <select class="form-control"
										name="language">
										<option value="vj"
											<%if (listAccount[i].getNgonNgu().equals("vi")) {%>
											selected="selected" <%}%> >Tiếng việt</option>
										<option value="ja"
											<%if (listAccount[i].getNgonNgu().equals("ja")) {%>
											selected="selected"<%} %>>日本</option>																		
									</select>
								</div>						
									<div class="form-group">
									<label>Tình trạng - 状態<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="status"  value="<%=listAccount[i].getTinhTrang()%>" disabled="disabled">
								</div>
							
								<button type="submit" class="btn btn-success btn-sm">Hoàn
									thành - 完全な</button>
								<button type="button" id="btn" class="btn btn-default btn-sm btn_modal"
								data-dismiss="modal">Quay lại - バック </button>
							</form>

						</div>						
					</div>
				</div>
			</div>
<!------------------------------------ Modal xóa -------------------------------------->
			<div class="modal fade"
				id="delete<%=listAccount[i].getIdTaiKhoan()%>">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Xóa tài khoản(Admin) - アカウントを削除(管理者)</h4>
						</div>
						<div class="modal-body">

							<form name="form_edit_admin" action="AdminDeleteServlet"
								method="post">
								<div class="form-group">
									<label>Tên tài khoản - ユーザ名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=listAccount[i].getTenTaiKhoan()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-sm">Xóa - 削除します</button>
								<button type="button" id="btn" class="btn btn-default btn-sm btn_modal"
								data-dismiss="modal">Quay lại - バック</button>
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
		<div id="resultMessage" style="display:none;">
</div>		
	</div>
	
</body>
<script type="text/javascript">
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip(); 	   
	});
	$(".btnban").click(function(){
		var returnValue = confirm("Bạn có muốn thay đổi tình trạng người dùng hay không?"); 		  
if(returnValue == true)
    {
       
    
			$.ajax({
				url : "BanAccountServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					id 	: this.id					
				}, //dữ liệu gửi
				async : true, //
				success : function(res) {				
					$("#resultMessage").html(res);
					window.location = "ListAccountServlet"
					alert($("#resultMessage").children("#result").text());					
				},
				error : function() {
					alert('Có lỗi xảy ra');
					$("#load").html("");
				}
			});	
    }
else{
	window.location = "ListAccountServlet"
}
	});
	
	</script>
</html>