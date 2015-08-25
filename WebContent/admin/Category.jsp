<%@page import="model.bean.DANHMUC"%>
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
<title>Danh mục</title>

<%
	//Receive inforrmation insert from Server
	String resultInsert = (String) request.getAttribute("resultInsert");

	//Receive information list category
	DANHMUC[] category = (DANHMUC[]) request.getAttribute("category");

	//Receive result edit category
	String resultUpdate = (String) request.getAttribute("resultUpdate");
	
	//Receive result delete category
	String resultDelete = (String) request.getAttribute("resultDelete");
	
	//Receive result search category
	DANHMUC[] category_after_search = (DANHMUC[])request.getAttribute("category_after_search");
	String button = (String)request.getAttribute("button");
%>
<script type="text/javascript">
	/*---------------Check validate form Insert---------------*/
	function checkValidFormInsert() {		
		var nameCategoryVi = document.getElementById("nameCategoryVi").value;
		var nameCategoryJa = document.getElementById("nameCategoryJa").value;
				
		var c_value = 0;
		if (nameCategoryVi == "" || nameCategoryJa == "") {

			alert("Bạn phải nhập tên danh mục(vừa tiếng việt vừa tiếng nhật)");
			return false;
		}
		for (var i = 0; i < document.formcreateCategory.display.length; i++) {
			if (document.formcreateCategory.display[i].checked) {
				c_value = 1;
			}
		}
		if (c_value == 0) {
			alert("Bạn phải chọn có hiển thị lên trang chủ hay không");
			return false;
		} 
		return true;
	}
	/*------------------End check form insert---------------------*/
	
	/*------------------Check validate form edit-----------------*/
	$(document).ready(function() {
		<%if(category!=null){%>
	for(var i=0;i<<%=category.length%>
	; i++) {
			var validator = $("#formedit" + i).validate({

				rules : {
					nameCategoryVi : "required",
					nameCategoryJa : "required",
				},
				messages : {
					nameCategoryVi : "Hãy nhập tên danh mục tiếng việt",
					nameCategoryJa : "Hãy nhập tên danh mục tiếng nhật",
				},

			});
		}
	<%}%>
	});
	
	/*------------------End check validate form edit-------------*/

	/*----------------- Check validate form Search --------------*/
	//Check validate
	function checkValidate(typeFind, stringFind, lengthStringFind) {
		if (stringFind == "") {
			alert("Bạn phải nhập từ cần tìm");
			return false;
		}
		if (stringFind.length > lengthStringFind) {
			alert(typeFind + " tối đa " + lengthStringFind + " ký tự");
			return false;
		}
		if (typeFind == "HienThi") {
			if (!(stringFind == "1" || stringFind == "0")) {
				alert(stringFind);
				alert("Bạn phải nhập số 1(hiển thị) hoặc 0(không hiển thị)");
				return false;
			}
		}
		return true;
	}

	//Check form Search
	function checkValidateSearch() {
		var typeFind = document.getElementById("typeFind").value;
		var stringFind = document.getElementById("stringFind").value;
		var lengthStringFind;
		if (typeFind == "IdDanhMuc")
			lengthStringFind = 10;
		else if (typeFind == "TenDanhMucVi")
			lengthStringFind = 300;
		else if (typeFind == "TenDanhMucJa")
			lengthStringFind = 50;
		else if (typeFind == "HienThi")
			lengthStringFind = 10;
		else
			lengthStringFind = 100;
		if (checkValidate(typeFind, stringFind, lengthStringFind)) {
			return true;
		}
		return false;

	}
	/*----------------- End check validate form Search -----------*/
</script>
</head>

<body>
	<div class="container-fluid">
	<%@include file="header_ver_1.jsp"%>
	
		
				<%@include file="Menu.jsp"%>
			
	
		<div style="margin-top: 10px">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 panel panel-primary">
				<div class="panel-heading">Thêm danh mục</div>
				<div class="panel-body">
					<form class="form-horizontal" name="formcreateCategory"
						action="CreateCategoryServlet" method="post"
						onsubmit="return checkValidFormInsert()">
						<div class="form-group">
							<label>Tên danh mục(Việt Nam)<span class="rq"> * </span>:
							</label><input type="text" class="form-control" id="nameCategoryVi"
								maxlength="300" name="nameCategoryVi">
						</div>
						<div class="form-group">
							<label>Tên danh mục(Nhật Bản)<span class="rq"> * </span>:
							</label><input type="text" class="form-control" id="nameCategoryJa"
								maxlength="300" name="nameCategoryJa">
						</div>
						<label>Hiện thị lên thanh menu<span class="rq"> * </span>:
						</label>
						<div class="radio-inline">
							<label><input type="radio" id="display" name="display"
								value="yes">Có</label>
						</div>
						<div class="radio-inline">
							<label><input type="radio" id="display" name="display"
								value="no">Không</label>
						</div>
						<br>
						<button type="submit" class="btn btn-primary btn-md">Tạo
							danh mục</button>
					</form>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>


		<!-- Panel show result -->
		<%
			if (resultInsert != null) {
		%>
		<div class="panel panel-info">
			<div class="panel-heading">Thông báo</div>
			<div class="panel-body">Thêm danh mục thành công</div>
		</div>
		<%
			}
			if (resultUpdate != null) {
		%>
		<div class="panel panel-info">
			<div class="panel-heading">Thông báo</div>
			<div class="panel-body">
				<%
					if (resultUpdate.contains("success")) {
				%>
				Chỉnh sửa danh mục thành công
				<%
					} else {
				%>
				Chỉnh sửa danh mục thất bại
				<%
					}
				%>
			</div>
		</div>
		<%
			}
			if (resultDelete != null) {
		%>
		<div class="panel panel-info">
			<div class="panel-heading">Thông báo</div>
			<div class="panel-body">
				<%
					if (resultDelete.contains("success")) {
				%>
				Xóa danh mục thành công
				<%
					} else {
				%>
				Xóa danh mục thất bại
				<%
					}
				%>
			</div>
		</div>
		<%
			}
		%>
		<!-- End panel result -->


		<%
			if (category != null) {
		%>

		<!----------------------- Form tìm kiếm ----------------------->
		<div class="row">
			<form action="SearchCategoryServlet" method="post"
				onsubmit="return checkValidateSearch()">
				<h4 class="col-sm-2">Tìm kiếm</h4>
				<div class="col-sm-2 form-group">
					<select class="form-control" id="typeFind" name="typeFind">
						<option value="IdDanhMuc">ID</option>
						<option value="TenDanhMucVi">Tên - Tiếng Việt</option>
						<option value="TenDanhMucJa">Tên - Tiếng Nhật</option>
						<option value="HienThi">Hiển thị(1: có,0: không)</option>
					</select>
				</div>
				<div class="col-sm-5 form-group">
					<input type="text" class="form-control" id="stringFind"
						name="stringFind">
				</div>
				<div class="col-sm-1 form-group">
				<button type="submit" name="btnFind" value="Find"
					class="btn btn-primary">Search</button>
					</div>
				</form>
					<div class="col-sm-1 form-group">
				<a href="ShowRestoreServlet?type=category"><button type="submit" name="btnRestore" 
					class="btn btn-primary">Restore</button></a>
					</div>
			
		</div>
		<!----------------------- End form tìm kiếm ---------------- -->


		<!-- Show result Search -->
		<%
			if (button != null) {//Press button Search
					if (category_after_search != null) {
						//Have result
		%>
		<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)</th>
					<th>Tên danh mục(Nhật Bản)</th>
					<th>Hiển thị(1: có,0:không)</th>
					<th></th>
					<th></th>
				</tr>
			</thead>

			<%
				for (int i = 0; i < category_after_search.length; i++) {
			%>
			<tbody>
				<tr>
					<td><%=category_after_search[i].getIdDanhMuc()%></td>
					<td><%=category_after_search[i]
									.getTenDanhMucVi()%></td>
					<td><%=category_after_search[i]
									.getTenDanhMucJa()%></td>
					<td><%=category_after_search[i].getHienThi()%></td>
					<td><button type="button" class="btn btn-default"
							data-toggle="modal"
							data-target="#<%=category_after_search[i].getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa
						</button></td>
					<td><button type="button" class="btn btn-default"
							data-toggle="modal"
							data-target="#delete<%=category_after_search[i].getIdDanhMuc()%>">
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
			} else {//No have result
		%>
		<div class="panel panel-info">
			<div class="panel-heading">Thông báo</div>
			<div class="panel-body">Danh mục cần tìm không có trong cơ sở
				dữ liệu</div>
		</div>

		<%
			}
				}
		%>
		<!-- End Show result Search -->

		<hr>
		<!----------------------- Form list ------------------------ -->
		<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)</th>
					<th>Tên danh mục(Nhật Bản)</th>
					<th>Hiển thị(1: có,0:không)</th>
					<th></th>
					<th></th>
				</tr>
			</thead>

			<%
				for (int i = 0; i < category.length; i++) {
			%>
			<tbody>
				<tr>
					<td><%=category[i].getIdDanhMuc()%></td>
					<td><%=category[i].getTenDanhMucVi()%></td>
					<td><%=category[i].getTenDanhMucJa()%></td>
					<td><%=category[i].getHienThi()%></td>
					<td><button type="button" class="btn btn-default"
							data-toggle="modal"
							data-target="#<%=category[i].getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa
						</button></td>
					<td><button type="button" class="btn btn-default"
							data-toggle="modal"
							data-target="#delete<%=category[i].getIdDanhMuc()%>">
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
			<div class="panel-heading">Danh mục</div>
			<div class="panel-body">Không có danh mục nào trong CSDL<br>
			<a href="ShowRestoreServlet?type=category"><button type="submit" name="btnRestore" 
					class="btn btn-primary">Restore</button></a>
					</div>
		</div>
		<%
			}
		%>
		<!--------------------------------- End list category ------------------------ -->

		<!-- Modal Edit -->
		<%
			if (category != null) {
				for (int i = 0; i < category.length; i++) {
		%>
		<div class="modal fade" id="<%=category[i].getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa danh mục(Admin)</h4>
					</div>
					<div class="modal-body">

						<form id="formedit<%=i%>" name="form_edit_Category"
							action="EditCategoryServlet" method="post">
							<div class="form-group">
								<label>ID danh mục<span class="rq"> * </span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="idCategory" id="idCategory"
									value="<%=category[i].getIdDanhMuc()%>" readonly="readonly">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Việt Nam)<span class="rq"> *
								</span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="nameCategoryVi" id="nameCategoryVi"
									value="<%=category[i].getTenDanhMucVi()%>">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Nhật Bản)<span class="rq"> *
								</span>:
								</label> <input type="text" class="form-control" maxlength="300"
									name="nameCategoryJa" id="nameCategoryJa"
									value="<%=category[i].getTenDanhMucJa()%>">
							</div>

							<div class="form-group">
								<label>Hiển thị lên trang chủ:</label> <select
									class="form-control" name="display">
									<option value="yes" <%if (category[i].getHienThi() == 1) {%>
										selected="selected" <%}%>>Có</option>
									<option value="no" <%if (category[i].getHienThi() == 0) {%>
										selected="selected" <%}%>>Không</option>
								</select>
							</div>
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
		<!-- End modal edit -->


		<!-- Modal Delete -->
		<div class="modal fade" id="delete<%=category[i].getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Xóa danh mục(Admin)</h4>
					</div>
					<div class="modal-body">

						<form name="form_delete_category" action="DeleteCategoryServlet"
							method="post">


							<div class="form-group">
								<label>ID danh mục: </label> <input type="text"
									class="form-control" name="IdDanhmuc"
									value="<%=category[i].getIdDanhMuc()%>" readonly="readonly">
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


		<!-- End modal delete -->
		<%
			}
			}
		%>





	</div>
	
</div>

</body>
</html>