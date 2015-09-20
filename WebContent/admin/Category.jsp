<%@page import="java.util.ArrayList"%>
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
<script type="text/javascript" src="js/category.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/category.css">
<title>Quản lý danh mục</title>

<%
	//Receive inforrmation insert from Server
	String resultInsert = (String) request.getAttribute("resultInsert");

	//Receive information list category
	ArrayList<DANHMUC> category = (ArrayList<DANHMUC>) request.getAttribute("category");


	//Receive result edit category
	String resultUpdate = (String) request.getAttribute("resultUpdate");
	
	//Receive result delete category
	String resultDelete = (String) request.getAttribute("resultDelete");
	
	//Receive result search category
	DANHMUC[] category_after_search = (DANHMUC[])request.getAttribute("category_after_search");
	String button = (String)request.getAttribute("button");
	
	//Nhận lại số danh mục được hiển thị lên thanh menu
	int countCategoryShowed = (Integer)request.getAttribute("countCategoryShowed");	
	//Nhận lại các danh mục được hiển thị
	ArrayList<DANHMUC> listCategoryShowed = (ArrayList<DANHMUC>)request.getAttribute("listCategoryShowed");
	
	//Nhận lại kết quả khi thay đổi hiển thị
	String resultChangeShowed =(String)request.getAttribute("resultChangeShowed");	
	
	//Nhận lại kết quả khi khôi phục dữ liệu
	String resultRestore = (String)request.getAttribute("resultRestore");
%>
<script type="text/javascript">

	/*------------------Check validate form edit-----------------*/
	$(document).ready(function() {				  
		<%if(category!=null){%>
	for(var i=0;i<<%=category.size()%>
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
</script>
</head>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>			
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
			<div class="row">			
				<div class="col-md-8 col-md-offset-2 panel panel-primary">			
					<div class="panel-heading">Thêm danh mục</div>
						<div class="panel-body">
								<!-- Hiển thị kết quả thay đổi hiển thị -->
								<%if(resultChangeShowed!=null){ %>				
								<div class="alert alert-info">
				  					<strong>Thông báo!</strong><%=resultChangeShowed%>
								</div>
								<%} %>
				
							<form class="form-horizontal" name="formcreateCategory"
									action="CreateCategoryServlet" method="post" enctype="multipart/form-data"
									onsubmit="return checkValidFormInsert()">
								<div class="form-group">
									<label>Tên danh mục(Việt Nam)<span class="rq"> * </span></label>
									<input type="text" class="form-control" id="nameCategoryVi"
									maxlength="15" name="nameCategoryVi">
								</div>
								<div class="form-group">
									<label>Tên danh mục(Nhật Bản)<span class="rq"> * </span></label>
									<input type="text" class="form-control" id="nameCategoryJa"
									maxlength="15" name="nameCategoryJa">
								</div>
									<%if(countCategoryShowed>=5){ %>
									<div class="alert alert-danger">
			  							<strong>Cảnh báo!</strong>Số danh mục hiển thị lên thanh menu đã tối đa.
			  							Nếu muốn thay đổi thì nhấn vào <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalChangeShow">đây</button>
									</div>
									<%} %>						 
								<label>Hiện thị lên thanh menu<span class="rq"> * </span></label>											
								<div class="radio-inline">
									<label><input type="radio" id="display" name="display"
										value="yes" <%if(countCategoryShowed >= 5){ %> disabled="disabled" <%} %>>Có
									</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio" id="display" name="display" 
										value="no">Không</label>
								</div>
								<div class="form-group">
									<label>Icon <input type="file" id="Image" name="Image" onchange="xem(this,'fua');"/></label>
									<p class="help-block">Chọn file .png, .jpg ...<br>
										<img alt="Icon đại diện" src="../images/icondefault.png" id="fua" width="50px" height="50px">
									</p>
								</div>
								<button type="submit" class="btn btn-success btn-md">Tạo danh mục</button>
							</form>
					</div>
				</div>			
			</div>
<!----------------------- Hiển thị kết quả  -------------------------->

		<%
			if (resultInsert != null) {
				if(resultInsert.contains("success")){
		%>
		
			<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Thêm danh mục thành công
	</div>
	
		<%
			}else{
		%>
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Thêm danh mục thất bại
	</div>
		<%}
			}
			if (resultUpdate != null) {
		
					if (resultUpdate.contains("success")) {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Chỉnh sửa danh mục thành công
	</div>
				<%
					} else {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Chỉnh sửa danh mục thất bại
	</div>
				<%
					}	
			}
			if (resultDelete != null) {		
					if (resultDelete.contains("success")) {
		%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Xóa danh mục thành công
	</div>
				<%
					} else {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Xóa danh mục thất bại
	</div>
				<%
					}	
			}
			if(resultRestore!=null){
				if(resultRestore.contains("success")){
		%>
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Khôi phục danh mục thành công
	</div>
	<%}else{ %>
	<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Khôi phục danh mục thất bại
	</div>
		<%
			}
			}
			if (category.size() != 0) {
		%>

		<!----------------------- Form tìm kiếm ----------------------->
		<div class="col-md-10 col-md-offset-1">
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
					class="btn btn-primary btn-sm">Tìm kiếm</button>
					</div>
				</form>
					<div class="col-sm-1 form-group">
				<a href="ShowRestoreServlet?type=category"><button type="submit" name="btnRestore" 
					class="btn btn-primary btn-sm">Khôi phục</button></a>
					</div>
			
		</div>
		<!----------------------- End form tìm kiếm ---------------- -->


		<!-- Show result Search -->
		<%
			if (button != null) {//Press button Search
					if (category_after_search != null) {
						//Have result
		%>
		<div class="col-md-10 col-md-offset-1 table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)</th>
					<th>Tên danh mục(Nhật Bản)</th>
					<th>Hiển thị(1: có,0:không)</th>
					<th>File ảnh</th>
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
					<td><img src="<%if(category.get(i).getIcon()==null){ %>
						../images/icondefault.png
					<%}else{ %>
					../images/<%=category.get(i).getIcon()%>
					<%}%>
					" alt="image" width="50px" height="50px"></td>
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
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Không có kết quả tìm kiếm
	</div>

		<%
			}
				}
		%>
		<!-- End Show result Search -->

		<hr>
		<!----------------------- Form list ------------------------ -->
		<div class="col-md-10 col-md-offset-1 table-responsive panel panel-primary">
		<div class="panel-heading">Danh mục</div>
		<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)</th>
					<th>Tên danh mục(Nhật Bản)</th>
					<th>Hiển thị(1: có,0:không)</th>	
					<th>File ảnh</th>				
					<th></th>
					<th></th>
				</tr>
			</thead>

			<%				
				for (int i = 0; i < category.size(); i++) {
			%>
			<tbody>
				<tr>
					<td><%=category.get(i).getIdDanhMuc()%></td>
					<td><%=category.get(i).getTenDanhMucVi()%></td>
					<td><%=category.get(i).getTenDanhMucJa()%></td>
					<td><%=category.get(i).getHienThi()%></td>
					<td><img src="<%if(category.get(i).getIcon()==null){ %>
						../images/icondefault.png
					<%}else{ %>
					../images/<%=category.get(i).getIcon()%>
					<%}%>
					" alt="image" width="50px" height="50px"></td>
					<td><button type="button" class="btn btn-default btn-sm"
							data-toggle="modal"
							data-target="#<%=category.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa
						</button></td>
					<td><button type="button" class="btn btn-default btn-sm"
							data-toggle="modal"
							data-target="#delete<%=category.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-remove"></span> Xóa
						</button></td>
				</tr>
			</tbody>
			<%
				}
			%>

		</table>
		<div class="menuPhanTrang" id="page">
		<%= request.getAttribute("pageNav") %>
	</div>
		
		<%
			} else {
		%>
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo!</strong>Không có kết quả tìm kiếm
	<a href="ShowRestoreServlet?type=category"><button type="submit" name="btnRestore" 
					class="btn btn-primary btn-sm">Restore</button></a>
	</div>
			
				
		<%
			}
		%>
		</div>
		</div>
		<!--------------------------------- End list category ------------------------ -->

		<!-- Modal Edit -->
		<%
			if (category != null) {
				for (int i = 0; i < category.size(); i++) {
		%>
		<div class="modal fade" id="<%=category.get(i).getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa danh mục(Admin)</h4>
					</div>
					<div class="modal-body">

						<form id="formedit<%=i%>" name="form_edit_Category"
							action="EditCategoryServlet" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>ID danh mục<span class="rq"> * </span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="idCategory" id="idCategory"
									value="<%=category.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Việt Nam)<span class="rq"> *
								</span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="nameCategoryVi" id="nameCategoryVi"
									value="<%=category.get(i).getTenDanhMucVi()%>">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Nhật Bản)<span class="rq"> *
								</span>:
								</label> <input type="text" class="form-control" maxlength="300"
									name="nameCategoryJa" id="nameCategoryJa"
									value="<%=category.get(i).getTenDanhMucJa()%>">
							</div>

							<div class="form-group">
								<label>Hiển thị lên trang chủ:</label> <select
									class="form-control" name="display">
									<option value="yes" <%if (category.get(i).getHienThi() == 1) {%>
										selected="selected" <%} if(countCategoryShowed>=5){%> disabled="disabled" <%} %>>Có</option>
									<option value="no" <%if (category.get(i).getHienThi() == 0) {%>
										selected="selected" <%}%>>Không</option>
								</select>
							</div>							
							<div class="form-group">
								<label>Icon: </label>	
								<input type="text" class ="form-control col-md-4" name="ImageIcon" value="<%=category.get(i).getIcon()%>" disabled="disabled">
							</div>
							<div class="form-group">					
							<input type="file" class="Image" name="Image" onchange="xem(this,'fu<%=i%>');"/>
							<p class="help-block">Chọn file .png, .jpg ...<br>
							<img src="<%if(category.get(i).getIcon()==null){ %>
									../images/icondefault.png
									<%}else{ %>
									../images/<%=category.get(i).getIcon()%>
									<%}%>
								" alt="image" id="fu<%=i%>" width="50px" height="50px">
<%-- 							<img alt="Ảnh đại diện" src="../images/"<%=category.get(i).getIcon()%> id="fu2" width="50px" height="50px"> --%>
							</p>
						</div>
							<button type="submit" class="btn btn-success btn-sm" >Hoàn
								thành</button>
								<button type="button" id="btn" class="btn btn-default btn-sm" 
							data-dismiss="modal">Quay lại</button>
						</form>
						

					</div>					
				</div>
			</div>
		</div>
		<!-- End modal edit -->


		<!-- Modal Delete -->
		<div class="modal fade" id="delete<%=category.get(i).getIdDanhMuc()%>">
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
									value="<%=category.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<button type="submit" class="btn btn-success btn-sm">Xóa</button>
							<button type="button" id="btn" class="btn btn-default btn-sm"
							data-dismiss="modal">Quay lại</button>
						</form>

					</div>					
				</div>
			</div>
		</div>


		<!-- End modal delete -->
		<%
			}
			}
		%>
<!-- Model thay đổi hiện lên thanh menu -->
<div class="modal fade" id="modalChangeShow" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Danh mục được hiển thị</h4>
        </div>
        <div class="modal-body">
        <%	if(listCategoryShowed!=null){ %>
         	<table class="table table-condensed">
    			<thead>
				      <tr>
				        <th>ID</th>
				        <th>Tên danh mục(VN)</th>
				        <th>Tên danh mục(JA)</th>
				        <td></td>
				      </tr>
    			</thead>
    			<tbody>
    			<%
    		
    			for(int i=0;i<listCategoryShowed.size();i++){ %>
				      <tr>
				        <td><%=listCategoryShowed.get(i).getIdDanhMuc()%></td>
				        <td><%=listCategoryShowed.get(i).getTenDanhMucVi() %></td>
				        <td><%=listCategoryShowed.get(i).getTenDanhMucJa() %></td>
				        <td>
				        	<a href="EditCategoryServlet?id=<%=listCategoryShowed.get(i).getIdDanhMuc()%>"><button class="btnChange btn btn-primary btn-sm" >Thay đổi</button></a>
				        </td>
				      </tr>
				  <%} %>
				</tbody>
    		</table>
    		<%}else{ %>
    			<div class="alert alert-danger">
  					<strong>Cảnh báo!</strong>Bị lỗi trong quá trình lấy dữ liệu. Vui lòng liên hệ với nhà phát triển phần mềm để sửa lỗi này
				</div>
    		<%} %>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Quay lại</button>
        </div>
      </div>
      
    </div>
  </div>




	</div>	
</div>

</body>
</html>