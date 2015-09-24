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
    $('[data-toggle="tooltip"]').tooltip();   
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
    
//     $("#formSearchPost").submit(function(){
//     	var typeFind = $('#typeFind').val();
//     	var stringFind =$('#stringFind').val();
//     	alert("typeFind: "+typeFind);    	
//     	if(typeFind!="IdDanhMuc" || typeFind!="IdTaiKhoan"){
//     		if(stringFind == ""){
//     			alert("Bạn phải nhập từ cần tìm - ");
//     			return false;
//     		}    		
//     	}    	
//     	return true;
//     });
});
</script>

</head>
<%
	//Receive data from server
	ArrayList<BAIVIET> posts = (ArrayList<BAIVIET>) request.getAttribute("posts");	
	TAIKHOAN[] account = (TAIKHOAN[]) request.getAttribute("account");
	//Nhận kết quả xóa từ servlet AdminDeletePostsServlet
	String resultDelete = (String) request.getAttribute("resultDelete");
	//Nhận kết quả khôi phục tu servlet showrestoreServlet
	String result_Restore = (String)request.getAttribute("result_Restore");
	
	//Lấy tất cả danh mục
	ArrayList<DANHMUC> category =(ArrayList<DANHMUC>) request.getAttribute("category");
%>

<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<div id="divcontent">

			<!-- Show result Delete posts -->
			<%
				if (resultDelete != null) {
			%>
			<div class="col-md-6 col-md-offset-3 alert alert-info">
  <strong>Thông báo - お知らせ!</strong> <%=resultDelete%>
</div>
			
			<%
				}if(result_Restore!=null){
					%>
					<div class="col-md-6 col-md-offset-3 alert alert-info">
  <strong>Thông báo - お知らせ!</strong> <%=result_Restore%>
</div>
			<%
				}
			%>
			<div class="khoiphuc">
				<div id="btnRestore" class="col-md-1 form-group">
					<a href="ShowRestoreServlet?type=posts"><button
							class="btn btn-success btn-sm">Khôi phục</button></a>
				</div>			
			</div>
			
			<!----------------------- Form tìm kiếm ----------------------->
		<div class="col-md-12 col-md-offset-1">
			<form action="SearchPostServlet" method="get" id="formSearchPost">
				<h4 class="col-sm-1">Tìm kiếm</h4>
				<div class="col-sm-3 form-group">
					<select class="form-control" id="typeFind" name="typeFind">
						<option value="IdBaiViet">ID</option>
						<option value="TenBaiVietVi">Tên bài viết - Tiếng Việt</option>
						<option value="TenBaiVietJa">Tên bài viết - Tiếng Nhật</option>
						<option value="IdDanhMuc">Danh mục</option>
						<option value="IdTaiKhoan">Tài khoản</option>
						<option value="NoiDungVi">Nội dung - Tiếng Việt</option>
						<option value="NoiDungJa">Nội dung - Tiếng Nhật</option>
						<option value="TrangThai">Trạng thái</option>
						<option value="GhiChu">Ghi chú</option>
						<option value="MoTaVi">Mô tả - Tiếng Việt</option>
						<option value="MoTaJa">Mô tả - Tiếng Nhật</option>
						<option value="LuotXem">Lượt xem</option>
						<option value="LienKet">Tên hình ảnh</option>
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
		<!-- ------------------------------------------------------- -->
		<!-- ----------Show result all posts in database------------ -->
		<!-- ------------------------------------------------------- -->
			<%
				if (posts != null) {
			%>
			<div class="col-md-12 table-responsive panel panel-primary">
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
						<%
							for (int i = 0; i < posts.size(); i++) {
						%>
						<tr>							
							<td><%=posts.get(i).getIdBaiViet()%></td>
							<td><%=posts.get(i).getTenBaiVietVi()==null?"":posts.get(i).getTenBaiVietVi()%><%=posts.get(i).getTenBaiVietJa()==null?"":"<br>"+posts.get(i).getTenBaiVietJa()%></td>
							<td><%=posts.get(i).getDanhMuc().getTenDanhMucVi()%> - <%=posts.get(i).getDanhMuc().getTenDanhMucJa()%></td>
							<td><%=posts.get(i).getTaiKhoan().getTenTaiKhoan()%></td>
							<td><%=posts.get(i).getNgayDang()%></td>
							<td>
							<!-- 
							(slidePosts.get(i).getMoTaVi().length()>90 ? (slidePosts.get(i).getMoTaVi().substring(0, 90)+"..."): slidePosts.get(i).getMoTaVi())
							 -->
							<%=posts.get(i).getMoTaVi()==null?"":(posts.get(i).getMoTaVi().length()>90?(posts.get(i).getMoTaVi().substring(0, 90)+"..."):posts.get(i).getMoTaVi())%>
							<%=posts.get(i).getMoTaJa()==null?"":"<br>"+(posts.get(i).getMoTaJa().length()>60?(posts.get(i).getMoTaJa().substring(0, 60)+"..."):posts.get(i).getMoTaJa())%>
							</td>
							<td>
							<%=posts.get(i).getTrangThai().equals("MoiDang")?"Mới Đăng":posts.get(i).getTrangThai().equals("KhongDich")?"Không Dịch":posts.get(i).getTrangThai().equals("OK")?"Đã Post":posts.get(i).getTrangThai().equals("DangDich")?"Đang Dịch":"Xóa Bài"%>
							</td>
							<td><button type="button" id="<%=posts.get(i).getIdBaiViet()%>" class="btn btn-primary btn-sm btnbookmark"><span class="glyphicon glyphicon-bookmark"></span></button></td>
							<td><a
								href="ShowDetailPostsServlet?id=<%=posts.get(i).getIdBaiViet()%>" data-toggle="tooltip" title="Chi tiết - 詳細"><button
										type="button" class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-list-alt"></span>
									</button> </a></td>
							<td><a
								href="<%if(posts.get(i).getTrangThai().contains("OK") || posts.get(i).getTrangThai().contains("DangDich") ){ %>#<%}else{ %> ./ShowAdminEditPostsServlet?idPost=<%=posts.get(i).getIdBaiViet()%>&from=list<%}%>" data-toggle="tooltip" title="Chỉnh sửa - 編集"><button
										type="button" class="btn btn-primary btn-sm"<%if(posts.get(i).getTrangThai().contains("OK") || posts.get(i).getTrangThai().contains("DangDich")){ %> disabled="disabled" <%} %>>
										<span class="glyphicon glyphicon-pencil"> </span> 
									</button></a></td>
							<td><a href="#" data-toggle="tooltip" title="Xóa - 削除"><button type="button" class="btn btn-primary btn-sm"
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
  <strong>Thông báo - お知らせ!</strong>Không có bài viết trong cơ sở dữ liệu - データベース内のエントリがありません
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
							<h4 class="modal-title">Xóa bài viết(Admin)</h4>
						</div>
						<div class="modal-body">

							<form name="form_delete_posts_admin"
								action="AdminDeletePostsServlet" method="post">


								<div class="form-group">
									<label>ID Bài viết<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="10"
										name="Idposts" value="<%=posts.get(i).getIdBaiViet()%>"
										readonly="readonly">
								</div>
								<button type="submit" class="btn btn-success btn-lg">Xóa</button>
							</form>

						</div>
						<div class="modal-footer">
							<button type="button" id="btn" class="btn btn-default"
								data-dismiss="modal">Quay lại</button>
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
		<div id="resultMessage" style="display:none;">
	</div>
	
</body>
<script type="text/javascript">	
	$(".btnbookmark").click(function(){
		
    
			$.ajax({
				url : "BookmarkInHomeServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					id 	: this.id					
				}, //dữ liệu gửi
				async : true, //
				success : function(res) {				
					$("#resultMessage").html(res);					
					alert($("#resultMessage").children("#result").text());					
				},
				error : function() {
					alert('Có lỗi xảy ra');
					$("#load").html("");
				}
			});	    
	});
	
	</script>
</html>