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
<title>Tìm kiếm bài viết</title>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
    $('#typeCategory').hide();
    $('#typeAccount').hide();
    $('#typeView').hide();
    $('#typeDay').hide();
    
    $( "#typeFind" ).change(function() {
   	 var typeFind = $('#typeFind').val();
   	 if(typeFind=="IdDanhMuc"){
   		 $("#typeCategory").show();
   		 $("#typeDifference").hide();
   		$('#typeAccount').hide();
   		 $('#typeDay').hide();
   	 }
   	 else if(typeFind=="IdTaiKhoan"){
   		$('#typeAccount').show();
   	 	$("#typeCategory").hide();
   	 	$("#typeDifference").hide();
   	 	$('#typeDay').hide();
   	 }
   	 else if(typeFind=="GimTrangChu"){
    		alert("Nhập số 1 để xem bài viết đã ghim. Nhập số 0 để xem bài viết chưa ghim");
    		$("#typeCategory").hide();
      		 $("#typeDifference").show();
      		$('#typeAccount').hide();
      		$('#typeView').hide();
      		 $('#typeDay').hide();
    	 }
	 else if(typeFind=="LuotXem"){
 		$('#typeView').show();
 		 $("#typeCategory").hide();
 		$("#typeDifference").hide();
   		$('#typeAccount').hide();
   	 $('#typeDay').hide();
 	 }
	 else if(typeFind=="NgayDang"){
		 $('#typeDay').show();
		 $("#typeCategory").hide();
   		 $("#typeDifference").hide();
   		$('#typeAccount').hide();
   		$('#typeView').hide();
	 }
   	 else{
   		 $("#typeCategory").hide();
   		 $("#typeDifference").show();
   		$('#typeAccount').hide();
   		$('#typeView').hide();
   		 $('#typeDay').hide();
   	 }
   });
   $('#formSearchPost').submit(function(){
	   var typeFind = $('#typeFind').val();
	   var stringFindDay = $('#stringFindDay').val();
	   var stringFindView = $('#stringFindView').val();
	   
	   if(typeFind=="GimTrangChu"){
		   if(stringFindView!="1" && stringFindView!="0" ){
			   alert("Bạn phải nhập 1(xem bài viết đã ghim) hoặc 0(bài viết chưa ghim)");
			   return false;
		   }
	   }
	   if(typeFind=="NgayDang"){
		   var regDay =/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/;
		   if(!regDay.test(stringFindDay)){
			   alert("Ngày đăng không hợp lệ. Ngày đăng có dạng MM/DD/YYYY");
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
	ArrayList<TAIKHOAN> accounts = (ArrayList<TAIKHOAN>) request.getAttribute("account");
%>
</head>
<body>
<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="divcontent">
		<!----------------------- Form tìm kiếm ----------------------->
		<div class="col-md-10 col-md-offset-1">
			<form action="SearchPostServlet" method="get" id="formSearchPost">
				<h4 class="col-sm-1">Tìm kiếm - 検索</h4>
				<div class="col-sm-3 form-group">
					<select class="form-control" id="typeFind" name="typeFind">
						<option value="IdBaiViet">ID</option>
						<option value="TenBaiVietVi">Tên bài viết - Tiếng Việt / 記事名 - ベトナム語</option>
						<option value="TenBaiVietJa">Tên bài viết - Tiếng Nhật / 記事名 - 日本語</option>
						<option value="IdDanhMuc">Danh mục / 項目</option>
						<option value="IdTaiKhoan">Tài khoản /ユーザー名</option>
						<option value="NoiDungVi">Nội dung - Tiếng Việt/内容  - ベトナム語</option>
						<option value="NoiDungJa">Nội dung - Tiếng Nhật/内容 - 日本語</option>
						<option value="TrangThai">Trạng thái / 状態</option>
						<option value="GhiChu">Ghi chú / メーモ</option>
						<option value="MoTaVi">Mô tả - Tiếng Việt / 説明 - ベトナム語</option>
						<option value="MoTaJa">Mô tả - Tiếng Nhật / 説明 - 日本語</option>
						<option value="LuotXem">Lượt xem / 観覧回数</option>						
						<option value="NgayDang">Ngày đăng / 掲載の日付</option>
						<option value="GimTrangChu">Bài viết đã Ghim / -</option>											
					</select>
				</div>				
				<div class="col-sm-5 form-group" id="typeDifference">
					<input type="text" class="form-control" id="stringFind"
						name="stringFind">
				</div>
				<div class="col-sm-5 form-group" id="typeView">
					<select class="form-control" id="stringFindView" name="stringFindView">
						<option value="0" selected="selected" disabled="disabled">Chọn lượt xem - </option>
						<option value="1">Tăng dần</option>
						<option value="2">Giảm dần</option>
					</select>
				</div>
				<div class="col-sm-5 form-group" id="typeDay">
					<input type="date" class="form-control" id="stringFindDay"
						name="stringFindDay">
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
  							<strong>Thông báo - お知らせ</strong> Không có danh mục nào trong cơ sở dữ liệu - データベースに全ての項目を存しない。
						</div>
					<%} %>
				</div>
				
					<div class="col-sm-5 form-group" id="typeAccount">
					<%if(accounts!=null){ %>
					<select class="form-control" id="stringFind" name="stringFindAccount">
						<option value="0" selected="selected" disabled="disabled">Chọn tài khoản - </option>
						<%for(int i=0;i<accounts.size();i++){ %>
							<option value="<%=accounts.get(i).getIdTaiKhoan()%>"><%=accounts.get(i).getTenTaiKhoan()%></option>
						<%} %>
													
					</select>
					<%}else{ %>
						<div class="alert alert-info">
  							<strong>Thông báo - お知らせ</strong> Không có tài khoản nào trong cơ sở dữ liệu - データベースにアカウントを存しません。
						</div>
					<%} %>
				</div>
				<div class="col-sm-1 form-group">
				<button type="submit" name="btnFind" value="Find"
					class="btn btn-primary btn-sm">Tìm kiếm - 検索</button>
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
							<th>Lượt xem<br>観覧回数</th>
							<th></th>
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
								<td><%=listposts.get(i).getLuotXem() %></td>
								<td><button type="button"  id="<%=listposts.get(i).getIdBaiViet()%>" class="btn btn-primary btn-sm btnbookmark" ><span class="glyphicon glyphicon-bookmark"></span></button>
								<div id="resultMessage_<%=listposts.get(i).getIdBaiViet()%>" class="divMessage" style="display:none;">									
									<input type="text"  id="status" name="status" value="<%if(listposts.get(i).getGimTrangChu()==1){%>Đã ghim<%}else {%>Chưa ghim<%} %>" disabled="disabled">									
								</div>
							</td>
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
			<div id="resultMessage" style="display:none;">
	</div>
</div>
</body>
<script type="text/javascript">	
	$(".btnbookmark").click(function(){
		var id = this.id;	
		$("#resultMessage_"+id).hide();	
			$.ajax({
				url : "BookmarkInHomeServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					id 	: this.id,
				}, //dữ liệu gửi
				async : true, //
				success : function(res) {
					if(res.indexOf("tối đa") > -1)
					{
						$("#resultMessage").html(res);
						alert($('#resultMessage').children("#result").text());
					}
					else{
						$("#resultMessage_"+id).html(res);
						alert($('#status').val());
					}
														
				},
				error : function() {
					alert('Không thể thay đổi để ghim lên trang chủ');
					$("#load").html("");
				}
			});	    
	});	
	$(".btnbookmark").hover(function(){
		var id = this.id;			
			$("#resultMessage_"+id).show(1000);	
			
		
	}); 
	</script>
</html>