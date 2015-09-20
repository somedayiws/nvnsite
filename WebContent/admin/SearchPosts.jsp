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
<link rel="stylesheet" href="css/listPost.css">
<title>Quản lý bài viết</title>
<script>
$(document).ready(function(){ 
    $('#typeCategory').hide();
    $('#typeAccount').hide();
    $( "#typeFind" ).change(function() {
    	
   	 var typeFind = $('#typeFind').val();
   	 if(typeFind=="IdDanhMuc"){
   		 $("#typeCategory").show();
   		 $("#typeDifference").hide();
   		$('#typeAccount').hide();
   	 }
   	 else if(typeFind=="IdTaiKhoan"){
   		$('#typeAccount').show();
   	 	$("#typeCategory").hide();
   	 	$("#typeDifference").hide();
   	 }
   	 else{
   		 $("#typeCategory").hide();
   		 $("#typeDifference").show();
   		$('#typeAccount').hide();
   	 }
   });
    
    $("#formSearchPost").submit(function(){
    	var typeFind = $('#typeFind').val();
    	var stringFind =$('#stringFind').val();
    	if(typeFind!="IdDanhMuc" || typeFind!="IdTaiKhoan"){
    		if(stringFind == ""){
    			alert("Bạn phải nhập từ cần tìm - ");
    			return false;
    		}    		
    	}    	
    	return true;
    });
});
</script>
<%
//Nhận kết quả tìm kiếm
	ArrayList<BAIVIET> listposts = (ArrayList<BAIVIET>) request.getAttribute("posts");
//Lấy tất cả danh mục
	ArrayList<DANHMUC> category =(ArrayList<DANHMUC>) request.getAttribute("category");
	TAIKHOAN[] account = (TAIKHOAN[]) request.getAttribute("account");
%>
</head>
<body>
<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
		<!----------------------- Form tìm kiếm ----------------------->
		<div class="col-md-10 col-md-offset-1">
			<form action="SearchPostServlet" method="post">
				<h4 class="col-sm-1">Tìm kiếm</h4>
				<div class="col-sm-3 form-group">
					<select class="form-control" id="typeFind" name="typeFind">
						<option value="IdBaiViet">ID</option>
						<option value="TenBaiVietVi">Tên bài viết - Tiếng Việt</option>
						<option value="TenBaiVietJa">Tên bài viết - Tiếng Nhật</option>
						<option value="IdDanhMuc">Danh mục</option>
						<option value="IdTaiKhoan">Tài khoản</option>
						<option value="NoiDungVi">Nôi dung - Tiếng Việt</option>
						<option value="NoiDungJa">Nôi dung - Tiếng Nhật</option>
						<option value="TrangThai">Trạng thái</option>
						<option value="GhiChu">Ghi chú</option>
						<option value="MoTaVi">Mô tả - Tiếng Việt</option>
						<option value="MoTaJa">Mô tả - Tiếng Nhật</option>
						<option value="LuotXem">Lượt xem</option>
						<option value="LienKet">Liên kết</option>
						<option value="NgayDang">Ngày đăng</option>
						<option value="GimTrangChu">Bài viết đã Ghim</option>										
					</select>
				</div>
				<div class="col-sm-5 form-group" id="typeDifference">
					<input type="text" class="form-control" id="stringFind"
						name="stringFind">
				</div>
					<div class="col-sm-5 form-group" id="typeCategory">
					<%if(category!=null){ %>
					<select class="form-control" id="stringFind" name="stringFindCategory">
							<option value="0" selected="selected" disabled="disabled">Chọn danh mục - </option>
						<%for(int i=0;i<category.size();i++){ %>
							<option value="<%=category.get(i).getIdDanhMuc()%>"><%=category.get(i).getTenDanhMucVi()%> - <%=category.get(i).getTenDanhMucJa()%></option>
						<%} %>
													
					</select>
					<%}else{ %>
						<div class="alert alert-info">
  							<strong>Thông báo - お知らせ!</strong> Không có danh mục nào trong cơ sở dữ liệu
						</div>
					<%} %>
				</div>
				
					<div class="col-sm-5 form-group" id="typeAccount">
					<%if(account!=null){ %>
					<select class="form-control" id="stringFind" name="stringFindAccount">
						<option value="0" selected="selected" disabled="disabled">Chọn tài khoản - </option>
						<%for(int i=0;i<account.length;i++){ %>
							<option value="<%=account[i].getIdTaiKhoan()%>"><%=account[i].getTenTaiKhoan()%></option>
						<%} %>
													
					</select>
					<%}else{ %>
						<div class="alert alert-info">
  							<strong>Thông báo - お知らせ!</strong> Không có tài khoản nào trong cơ sở dữ liệu
						</div>
					<%} %>
				</div>
				<div class="col-sm-1 form-group">
				<button type="submit" name="btnFind" value="Find"
					class="btn btn-primary btn-sm">Tìm kiếm</button>
					</div>
				</form>								
		</div>
		<!----------------------- End form tìm kiếm ------------------->
		<!----------------------- Hiển thị kết quả tìm kiếm ----------->
		
			<%if(listposts!=null){ %>
				<div class="col-md-10 col-md-offset-1 table-responsive panel panel-primary">
			 <div class="panel-heading">Bài viết</div>
			 <div class="panel-body">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>							
							<th>ID</th>
							<th>Tên bài viết<br> 名前ポスト</th>
							<th>Danh mục<br> カテゴリ</th>
							<th>Người đăng<br> ユーザー</th>
							<th>Ngày đăng<br> 日付</th>
							<th>Mô tả<br> 説明</th>
							<th>Trạng thái<br> 状態</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%for(int i=0;i<listposts.size();i++){ %>
							<tr>
								<td><%=listposts.get(i).getIdBaiViet() %></td>
								<td><%=listposts.get(i).getTenBaiVietVi()%>- <%=listposts.get(i).getTenBaiVietJa() %></td>
								<td><%=listposts.get(i).getDanhMuc().getTenDanhMucVi()%> - <%=listposts.get(i).getDanhMuc().getTenDanhMucJa()%></td>
								<td><%=listposts.get(i).getTaiKhoan().getTenTaiKhoan() %></td>
								<td><%=listposts.get(i).getNgayDang()%></td>
								<td><%=listposts.get(i).getMoTaVi() %> - <%=listposts.get(i).getMoTaJa() %></td>
								<td><%=listposts.get(i).getTrangThai() %></td>
								<td><a
								href="ShowDetailPostsServlet?id=<%=listposts.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Chi tiết - 詳細"><button
										type="button" class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-list-alt"></span>
									</button> </a></td>
							<td><a
								href="<%if(listposts.get(i).getTrangThai().contains("OK") || listposts.get(i).getTrangThai().contains("DangDich") ){ %>#<%}else{ %> ./ShowAdminEditPostsServlet?idPost=<%=listposts.get(i).getIdBaiViet()%>&from=list<%}%>" data-toggle="tooltip" title="Chỉnh sửa - 編集"><button
										type="button" class="btn btn-primary btn-sm"<%if(listposts.get(i).getTrangThai().contains("OK") || listposts.get(i).getTrangThai().contains("DangDich")){ %> disabled="disabled" <%} %>>
										<span class="glyphicon glyphicon-pencil"> </span> 
									</button></a></td>
							<td><a href="#" data-toggle="tooltip" title="Xóa - 削除"><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" 
									data-target="#delete<%=listposts.get(i).getIdBaiViet()%>">
									<span class="glyphicon glyphicon-remove"></span> 
								</button></a></td>
							</tr>
						<%} %>
					</tbody>
			</table>
			<div id="page" class="menuPhanTrang">
		<%= request.getAttribute("pageNav") %>
	</div>
			</div>
			</div>
			<%}else{ %>
				<div class="col-md-6 col-md-offset-3 alert alert-info">
  					<strong>Thông báo - お知らせ!</strong> Không tìm thấy bài viết nào - 
				</div>
			<%} %>
		<!----------------------- Kết thúc hiển thị ------------------->
		</div>
</div>
</body>
</html>