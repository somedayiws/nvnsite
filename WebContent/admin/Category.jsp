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
<title>Quản lý danh mục - 項目の管理</title>
<%
	//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		
	//Receive inforrmation insert from Server
	String resultInsert = (String) request.getAttribute("resultInsert");

	//Receive information list category
	ArrayList<DANHMUC> category = (ArrayList<DANHMUC>) request.getAttribute("category");


	//Receive result edit category
	String resultUpdate = (String) request.getAttribute("resultUpdate");
	
	//Receive result delete category
	String resultDelete = (String) request.getAttribute("resultDelete");
	
	//Receive result search category
	ArrayList<DANHMUC> category_after_search = (ArrayList<DANHMUC>)request.getAttribute("category_after_search");
	String button = (String)request.getAttribute("button");
	String pageNavSearch = (String)request.getAttribute("pageNavSearch");
	
	//Nhận lại số danh mục được hiển thị lên thanh menu
	int countCategoryShowed = (Integer)request.getAttribute("countCategoryShowed");
	//Nhận lại các danh mục được hiển thị
	ArrayList<DANHMUC> listCategoryShowed = (ArrayList<DANHMUC>)request.getAttribute("listCategoryShowed");
	
	//Nhận lại kết quả khi thay đổi hiển thị
	String resultChangeShowed =(String)request.getAttribute("resultChangeShowed");	
	
	//Nhận lại kết quả khi khôi phục dữ liệu
	String resultRestore = (String)request.getAttribute("resultRestore");
%>
</head>

<body>
	<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>			
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
			<div class="row">			
				<div class="col-md-8 col-md-offset-2 panel panel-primary">			
					<div class="panel-heading">Thêm danh mục - 項目の作成</div>
						<div class="panel-body">
								<!-- Hiển thị kết quả thay đổi hiển thị -->
								<%if(resultChangeShowed!=null){ %>				
								<div class="alert alert-info">
				  					<strong>Thông báo - お知らせ!</strong><%=resultChangeShowed%>
								</div>
								<%} %>
				
							<form class="form-horizontal" name="formcreateCategory"
									action="CreateCategoryServlet" method="post" enctype="multipart/form-data"
									onsubmit="return checkValidFormInsert()">
								<div class="form-group">
									<label>Tên danh mục(Việt Nam) - ベトナム語（項目名）<span class="rq"> * </span></label>
									<input type="text" class="form-control" id="nameCategoryVi"
									maxlength="15" name="nameCategoryVi">
								</div>
								<div class="form-group">
									<label>Tên danh mục(Nhật Bản) - 日本語（項目名）<span class="rq"> * </span></label>
									<input type="text" class="form-control" id="nameCategoryJa"
									maxlength="15" name="nameCategoryJa">
								</div>
									<%if(countCategoryShowed>7){ %>
									<div class="alert alert-danger">
			  							<p><strong>Cảnh báo!</strong>Số danh mục hiển thị lên thanh menu đã tối đa.Nếu muốn thay đổi thì nhấn vào đây</p>
			  							<p><strong>警告!メニューに表示された項目が最大に達した。.変更しい場合は、クリックして下さい。ここ</strong></p>
			  							 <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalChangeShow">Thay đổi - 変更</button>
									</div>
									<%} %>						 
								<label>Hiện thị lên thanh menu - メニューに表示する<span class="rq"> * </span></label>											
								<div class="radio-inline">
									<label><input type="radio" id="display" name="display"
										value="yes" <%if(countCategoryShowed >7){ %> readonly="readonly" <%} %>>Có - 有
									</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio" id="display" name="display" 
										value="no">Không - 無</label>
								</div>
								<div class="form-group">
									<label>Icon - アイコン <input type="file" id="Image" name="Image" onchange="xem(this,'fua');"/></label>
									<p class="help-block">Chọn tập tin có đuôi là .png, .jpg, .gif, .jpeg - ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。<br>
										<img alt="Icon đại diện" src="../images/icons/icondefault.png" id="fua" width="50px" height="50px">
									</p>
								</div>
								<button type="submit" class="btn btn-success btn-md">Tạo danh mục - 項目の作成</button>
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
	<strong>Thông báo - お知らせ!</strong>Thêm danh mục thành công - 項目の追加ができた。
	</div>
	
		<%
			}else{
		%>
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Thêm danh mục thất bại - 項目の追加ができない
	</div>
		<%}
			}
			if (resultUpdate != null) {
		
					if (resultUpdate.contains("success")) {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Chỉnh sửa danh mục thành công - 項目の修正ができた。
	</div>
				<%
					} else {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Chỉnh sửa danh mục thất bại - 項目の修正がまだできない
	</div>
				<%
					}	
			}
			if (resultDelete != null) {		
					if (resultDelete.contains("success")) {
		%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Xóa danh mục thành công - 項目の削除ができた
	</div>
				<%
					} else {
				%>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Xóa danh mục thất bại - 項目の削除がまだできない
	</div>
				<%
					}	
			}
			if(resultRestore!=null){
				if(resultRestore.contains("thành công")){
		%>
		<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Khôi phục danh mục thành công - 項目の回復ができた
	</div>
	<%}else{ %>
	<div class="col-md-6 col-md-offset-3 alert alert-info">
	<strong>Thông báo - お知らせ!</strong>Khôi phục danh mục thất bại - 項目の回復がまだできない
	</div>
		<%
			}
			}
			
		%>

		<!----------------------- Form tìm kiếm ----------------------->
		<div class="col-md-10 col-md-offset-1">
			<form action="SearchCategoryServlet" method="post"
				onsubmit="return checkValidateSearch()">
				<h4 class="col-sm-2">Tìm kiếm - 検索</h4>
				<div class="col-sm-2 form-group">
					<select class="form-control" id="typeFind" name="typeFind">
						<option value="IdDanhMuc">ID</option>
						<option value="TenDanhMucVi">Tên - Tiếng Việt <br>氏名-ベトナム語</option>
						<option value="TenDanhMucJa">Tên - Tiếng Nhật <br> 氏名-日本語</option>
						<option value="HienThi">Hiển thị(1: có,0: không)<br>表示（1：有、０：無）</option>
					</select>
				</div>
				<div class="col-sm-5 form-group">
					<input type="text" class="form-control" id="stringFind"
						name="stringFind">
				</div>
				<div class="col-sm-1 form-group">
					<button type="submit" name="btnFind" value="Find"
						class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="bottom" title="Tìm kiếm - 検索">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
				</form>
					<div class="col-sm-1 form-group">
				<a href="ShowRestoreServlet?type=category"><button type="submit" name="btnRestore" 
					class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="bottom" title="Khôi phục - 回復">
					<span class="glyphicon glyphicon-share-alt"></span></button></a>
					</div>
			
		</div>
		<!----------------------- End form tìm kiếm ---------------- -->

	<%
			if (button != null) {
				
			%>
		<!-- Show result Search -->
		<%
			//Press button Search
					if (category_after_search != null) {
						//Have result
		%>
		<div class="col-md-10 col-md-offset-1 table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)<br>ベトナム語（項目名）</th>
					<th>Tên danh mục(Nhật Bản)<br>日本語（項目名）</th>
					<th>Hiển thị(1: có,0:không)<br>表示（1：有、０：無）</th>
					<th>Icon<br>アイコン</th>
					<th></th>
					<th></th>
				</tr>
			</thead>

			<%
				for (int i = 0; i < category_after_search.size(); i++) {
			%>
			<tbody>
				<tr>
					<td><%=category_after_search.get(i).getIdDanhMuc()%></td>
					<td><%=category_after_search.get(i).getTenDanhMucVi()%></td>
					<td><%=category_after_search.get(i).getTenDanhMucJa()%></td>
					<td><%=category_after_search.get(i).getHienThi()%></td>
					<td><img src="../images/icons/<%if(category_after_search.get(i).getIcon()==null){ %>icondefault.png<%}else{ %><%=category_after_search.get(i).getIcon()%><%}%>" alt="image" width="50px" height="50px"></td>
					<td><button type="button" class="btn btn-primary"
							data-toggle="modal"
							data-target="#modal_Search_<%=category_after_search.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-pencil"></span>Chỉnh sửa<br>修正
						</button></td>
					<td><button type="button" class="btn btn-danger"
							data-toggle="modal"
							data-target="#delete_Search_<%=category_after_search.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-remove"></span>Xóa<br>削除
						</button></td>
				</tr>
			</tbody>
			<%
				}
			%>

		</table>
		<%if(pageNavSearch!=null){ %>
		<div class="menuPhanTrang" id="page">
		<%= pageNavSearch %>		
	</div>
	<%} %>
		</div>
		<%
				for (int i = 0; i < category_after_search.size(); i++) {
		%>
<!-- Modal Edit Search -->
		<div class="modal fade" id="modal_Search_<%=category_after_search.get(i).getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa danh mục(Admin) - 項目の修正（管理者）</h4>
					</div>
					<div class="modal-body">

						<form id="formedit<%=i%>" name="form_edit_Category"
							action="EditCategoryServlet" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>ID<span class="rq"> * </span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="idCategory" id="idCategory"
									value="<%=category_after_search.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Việt Nam) - ベトナム語（項目名<span class="rq"> *
								</span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="nameCategoryVi" id="nameCategoryVi"
									value="<%=category_after_search.get(i).getTenDanhMucVi()%>">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Nhật Bản) - 日本語（項目名）<span class="rq"> *
								</span>:
								</label> <input type="text" class="form-control" maxlength="300"
									name="nameCategoryJa" id="nameCategoryJa"
									value="<%=category_after_search.get(i).getTenDanhMucJa()%>">
							</div>

							<div class="form-group">
								<label>Hiển thị lên thanh menu - メニューに表示する。: </label> <select
									class="form-control" name="display">
									<option value="yes" <%if (category_after_search.get(i).getHienThi() == 1) {%>
										selected="selected" <%} if(listCategoryShowed.size()>=8){%> readonly="readonly" <%} %>>Có - 有</option>
									<option value="no" <%if (category_after_search.get(i).getHienThi() == 0) {%>
										selected="selected" <%}%>>Không - 無</option>
								</select>
							</div>							
							<div class="form-group">
								<label>Icon - アイコン: </label>	
								<input type="text" class ="form-control col-md-4" name="ImageIcon" value="<%=category_after_search.get(i).getIcon()%>" readonly="readonly">
							</div>
							<div class="form-group">					
							<input type="file" class="Image" name="Image" onchange="xem(this,'fu<%=i%>');"/>
							<p class="help-block">Chọn file .png, .jpg, .gif, .jpeg ...<br>ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。
							<img src="../images/icons/<%if(category_after_search.get(i).getIcon()==null){ %>icondefault.png<%}else{ %><%=category_after_search.get(i).getIcon()%><%}%>" alt="image" id="fu<%=i%>" width="50px" height="50px">
<%-- 							<img alt="Ảnh đại diện" src="../images/"<%=category_after_search.get(i).getIcon()%> id="fu2" width="50px" height="50px"> --%>
							</p>
						</div>
							<button type="submit" class="btn btn-success btn-sm" >Hoàn
								thành - 完成</button>
								<button type="button" id="btn" class="btn btn-default btn-sm" 
							data-dismiss="modal">Quay lại - 戻り</button>
						</form>
						

					</div>					
				</div>
			</div>
		</div>
		<!-- End modal edit -->


		<!-- Modal Delete -->
		<div class="modal fade" id="delete_Search_<%=category_after_search.get(i).getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Xóa danh mục(Admin) - 項目の削除（管理者）</h4>
					</div>
					<div class="modal-body">

						<form name="form_delete_category" action="DeleteCategoryServlet"
							method="post">


							<div class="form-group">
								<label>ID: </label> <input type="text"
									class="form-control" name="IdDanhmuc"
									value="<%=category_after_search.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<button type="submit" class="btn btn-success btn-sm">Xóa - 削除</button>
							<button type="button" id="btn" class="btn btn-default btn-sm"
							data-dismiss="modal">Quay lại - 戻り</button>
						</form>

					</div>					
				</div>
			</div>
		</div>


		<!-- End modal delete -->
		
		<!-- Model thay đổi hiện lên thanh menu -->
<div class="modal fade" id="modalChangeShow" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Danh mục được hiển thị - 表示された項目です</h4>
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
    		
    			for(int j=0;j<listCategoryShowed.size();j++){ %>
				      <tr>
				        <td><%=listCategoryShowed.get(j).getIdDanhMuc()%></td>
				        <td><%=listCategoryShowed.get(j).getTenDanhMucVi() %></td>
				        <td><%=listCategoryShowed.get(j).getTenDanhMucJa() %></td>
				        <td>
				        	<a href="EditCategoryServlet?id=<%=listCategoryShowed.get(j).getIdDanhMuc()%>"><button class="btnChange btn btn-primary btn-sm" >Thay đổi</button></a>
				        </td>
				      </tr>
				  <%} %>
				</tbody>
    		</table>
    		<%}else{ %>
    			<div class="alert alert-danger">
  					<strong>Cảnh báo - 警告する。!</strong>Không có danh mục nào được hiển thị lên thanh menu - 項目はメニューにいずれも表示されていない
				</div>
    		<%}} %>
        </div>
        
      </div>
      
    </div>
  </div>
		<!-- End Show result Search -->
		<%
			}
			}
			
				else{
		%>
		
		<%if (category  != null) { %>
		<hr>
		<!----------------------- Form list ------------------------ -->
		<div class="col-md-12 table-responsive panel panel-primary">
		<div class="panel-heading">Danh mục - 項目</div>
		<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên danh mục(Việt Nam)<br>ベトナム語（項目名）</th>
					<th>Tên danh mục(Nhật Bản)<br>日本語（項目名）</th>
					<th>Hiển thị(1: có,0:không)<br>表示（1：有、０：無）</th>	
					<th>Icon<br>アイコン</th>				
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
					<td><img src="../images/icons/<%if(category.get(i).getIcon()==null){ %>icondefault.png<%}else{ %><%=category.get(i).getIcon()%><%}%>" alt="image" width="50px" height="50px"></td>
					<td><button type="button" class="btn btn-primary btn-sm"
							data-toggle="modal"
							data-target="#<%=category.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-pencil"></span>Chỉnh sửa<br>修正
						</button></td>
					<td><button type="button" class="btn btn-danger btn-sm"
							data-toggle="modal"
							data-target="#delete<%=category.get(i).getIdDanhMuc()%>">
							<span class="glyphicon glyphicon-remove"></span>Xóa<br>削除
						</button></td>
				</tr>
			</tbody>
			<%
				}
			%>

		</table>
		
		</div>
		<div class="menuPhanTrang" id="page">
		<%= request.getAttribute("pageNav") %>
		</div>
		</div>
		<!--------------------------------- End list category ------------------------ -->

		<!-- Modal Edit -->
		<%
				for (int i = 0; i < category.size(); i++) {
		%>
		<div class="modal fade" id="<%=category.get(i).getIdDanhMuc()%>">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa danh mục(Admin) - 項目の修正（管理者）</h4>
					</div>
					<div class="modal-body">

						<form id="formedit<%=i%>" name="form_edit_Category"
							action="EditCategoryServlet" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>ID<span class="rq"> * </span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="idCategory" id="idCategory"
									value="<%=category.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Việt Nam) - ベトナム語（項目名<span class="rq"> *
								</span>:
								</label> <input class="form-control" maxlength="300" type="text"
									name="nameCategoryVi" id="nameCategoryVi"
									value="<%=category.get(i).getTenDanhMucVi()%>">
							</div>
							<div class="form-group">
								<label>Tên danh mục(Nhật Bản) - 日本語（項目名）<span class="rq"> *
								</span>:
								</label> <input type="text" class="form-control" maxlength="300"
									name="nameCategoryJa" id="nameCategoryJa"
									value="<%=category.get(i).getTenDanhMucJa()%>">
							</div>

							<div class="form-group">
								<label>Hiển thị lên thanh menu - メニューに表示する。: </label> <select
									class="form-control" name="display">
									<option value="yes" <%if (category.get(i).getHienThi() == 1) {%>
										selected="selected" <%} if(countCategoryShowed>=5){%> readonly="readonly" <%} %>>Có - 有</option>
									<option value="no" <%if (category.get(i).getHienThi() == 0) {%>
										selected="selected" <%}%>>Không - 無</option>
								</select>
							</div>							
							<div class="form-group">
								<label>Icon - アイコン: </label>	
								<input type="text" class ="form-control col-md-4" name="ImageIcon" value="<%=category.get(i).getIcon()%>" readonly="readonly">
							</div>
							<div class="form-group">					
							<input type="file" class="Image" name="Image" onchange="xem(this,'fu<%=i%>');"/>
							<p class="help-block">Chọn file .png, .jpg, .gif, .jpeg ...<br>ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。
							<img src="../images/icons/<%if(category.get(i).getIcon()==null){ %>icondefault.png<%}else{ %><%=category.get(i).getIcon()%><%}%>" alt="image" id="fu<%=i%>" width="50px" height="50px">
<%-- 							<img alt="Ảnh đại diện" src="../images/"<%=category.get(i).getIcon()%> id="fu2" width="50px" height="50px"> --%>
							</p>
						</div>
							<button type="submit" class="btn btn-success btn-sm" >Hoàn
								thành - 完成</button>
								<button type="button" id="btn" class="btn btn-default btn-sm" 
							data-dismiss="modal">Quay lại - 戻り</button>
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
						<h4 class="modal-title">Xóa danh mục(Admin) - 項目の削除（管理者）</h4>
					</div>
					<div class="modal-body">

						<form name="form_delete_category" action="DeleteCategoryServlet"
							method="post">


							<div class="form-group">
								<label>ID: </label> <input type="text"
									class="form-control" name="IdDanhmuc"
									value="<%=category.get(i).getIdDanhMuc()%>" readonly="readonly">
							</div>
							<button type="submit" class="btn btn-success btn-sm">Xóa - 削除</button>
							<button type="button" id="btn" class="btn btn-default btn-sm"
							data-dismiss="modal">Quay lại - 戻り</button>
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
          <h4 class="modal-title">Danh mục được hiển thị - 表示された項目です</h4>
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
				        	<a href="EditCategoryServlet?id=<%=listCategoryShowed.get(i).getIdDanhMuc()%>"><button class="btnChange btn btn-primary btn-sm" >Thay đổi - 変更</button></a>
				        </td>
				      </tr>
				  <%} %>
				</tbody>
    		</table>
    		<%}else{ %>
    			<div class="alert alert-danger">
  					<strong>Cảnh báo - 警告!</strong>Không có danh mục nào được hiển thị lên thanh menu
				</div>
    		<%}} %>
        </div>
        
      </div>
      
    </div>
  </div>



	</div>	
</div>
	<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
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
					nameCategoryVi : "Hãy nhập tên danh mục tiếng việt - ベトナム語で項目を入力下さい。",
					nameCategoryJa : "Hãy nhập tên danh mục tiếng nhật - 日本語で項目を入力下さい。",
				},
				
			});
			
		}
	<%}%>
	});
	
	/*------------------End check validate form edit-------------*/
</script>
</html>