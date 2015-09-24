<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="./css/home.css">
<title>Thống kê - 統計的</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#formStatistical').submit(function(){
		var dayStart = $('#dayStart').val();
		var dayFinish = $('#dayFinish').val();	
		if(dayStart>=dayFinish){
			alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc");
			return false;
		}
		return true;
	});
})
</script>
</head>
<%
	//Nhận lại thống kê bài viết
	String resultStatisticUsers =(String) request.getAttribute("resultStatisticUsers");
	ArrayList<TAIKHOAN> listResultAccount =(ArrayList<TAIKHOAN>)request.getAttribute("listResultAccount");
	ArrayList<String> arrayNumberUser = (ArrayList<String>)request.getAttribute("arrayNumberUser");
	
	//Nhận lại thống kê danh mục
	String resultStatisticCategory = (String) request.getAttribute("resultStatisticCategory");
	ArrayList<DANHMUC> listResultCategory =(ArrayList<DANHMUC>)request.getAttribute("listResultCategory");
	ArrayList<String> arrayNumberCategory = (ArrayList<String>)request.getAttribute("arrayNumberCategory");
	
	//Nhận lại thống kê bài viết
	String resultStatisticPosts = (String) request.getAttribute("resultStatisticPosts");
	ArrayList<BAIVIET> listResultPost =(ArrayList<BAIVIET>)request.getAttribute("listResultPost");
	ArrayList<String> arrayNumberPost = (ArrayList<String>)request.getAttribute("arrayNumberPost");
%>
<body>
	<div class="container-fluid" >
		<%@include file="header_ver_1.jsp"%>	
		<%@include file="Menu.jsp"%>
		<h1 style="text-align: center;margin-top: 10px">THỐNG KÊ - </h1>			
			<div class="row" style="margin-top: 10px">
				<div class="col-md-10 col-md-offset-1">
						<ul class="nav nav-tabs">
						    <li class="active"><a data-toggle="tab" class="statisticalUser" id="user" href="#User">Người dùng - </a></li>
						    <li><a data-toggle="tab" href="#Category">Danh mục - </a></li>
						    <li><a data-toggle="tab" href="#Post">Bài viết - </a></li>						    
					  	</ul>
					  <div class="tab-content">
					    <div id="User"  class="tab-pane fade in active">
					      <h3 style="text-align: center;">Thống kê người dùng - </h3>					     
					      	<div class="alert alert-info">
					      	
					      		<div class="panel-group" id="accordion">
								  <div class="panel panel-default">
								    <div class="panel-heading">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
								       		Đếm số tài khoản người dùng</a>
								      </h4>
								    </div>
								    <div id="collapse1" class="panel-collapse collapse in">
								      <div class="panel-body"><%=resultStatisticUsers %></div>
								    </div>
								  </div>
								  
								  	<div class="panel panel-default">
								    <div class="panel-heading">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
								        Thống kê tài khoản user</a>
								      </h4>
								    </div>
								    <div id="collapse2" class="panel-collapse collapse">
								      <div class="panel-body">
								      		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" role="form" id="formStatistical" action="StatisticalServlet?type=TKUser" method="post">
				  <div class="form-group">
				    <label for="dayStart">Từ ngày</label>
				    <input type="date" class="form-control" id="dayStart" name="dayStart">
				  </div>
				  <div class="form-group">
				    <label for="dayFinish">Đến ngày</label>
				    <input type="date" class="form-control" id="dayFinish" name="dayFinish">
				  </div>			  
				  <button type="submit" class="btn btn-default" name="btnStatistical">Thống kê</button>
				</form>
			</div>
		</div>
		<div class=row>
		<div class="col-md-8 col-md-offset-2">
				<h3 style="text-align: center;">Kết quả</h3>
								      		<%if(listResultAccount!=null){ %>
								      		Người dùng đăng bài viết nhiều nhất
								      			<%if(listResultAccount.get(0)!=null && listResultAccount.get(0).getTenTaiKhoan()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_0">
								      			<%=listResultAccount.get(0).getTenTaiKhoan()%><span class="badge"><%=arrayNumberUser.get(0)%></span>
								      		</button>
								      			<%}else{ %>
								      				<div class="well">Không tìm thấy</div>
								      			<%}%>
								      		<br>Người dùng đăng ít bài viết nhất
								      		<%if(listResultAccount.get(1)!=null && listResultAccount.get(1).getTenTaiKhoan()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_1">
								      			<%=listResultAccount.get(1).getTenTaiKhoan()%><span class="badge"><%=arrayNumberUser.get(1)%></span>
								      		</button>
								      			<%}else{ %>
								      				<span class="badge">Không tìm thấy</span>
								      			<%}%>
								      		<%}else{ %>
								      			 <div class="well">Không thể thống kê tài khoản user</div>
								      		<%} %>
								      	</div>
								      	</div>	
								      </div>
								    </div>
								  </div>
								  
								  <div class="panel panel-default">
								    <div class="panel-heading">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
								        Thống kê tài khoản CTV</a>
								      </h4>
								    </div>
								    <div id="collapse3" class="panel-collapse collapse">
								      <div class="panel-body">
								      <div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" role="form" action="StatisticalServlet?type=TKCTV" method="post">
				  <div class="form-group">
				    <label for="dayStart">Từ ngày</label>
				    <input type="date" class="form-control" id="dayStart" name="dayStart">
				  </div>
				  <div class="form-group">
				    <label for="dayFinish">Đến ngày</label>
				    <input type="date" class="form-control" id="dayFinish" name="dayFinish">
				  </div>			  
				  <button type="submit" class="btn btn-default" name="btnStatistical">Thống kê</button>
				</form>
			</div>
		</div>
		<div class=row>
		<div class="col-md-8 col-md-offset-2">
				<h3 style="text-align: center;">Kết quả</h3>
								      		<%if(listResultAccount!=null){ %>
								      	Cộng tác viên dịch nhiều bài viết nhất
								      			<%if(listResultAccount.get(2)!=null && listResultAccount.get(2).getTenTaiKhoan()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_2">
								      			<%=listResultAccount.get(2).getTenTaiKhoan()%><span class="badge"><%=arrayNumberUser.get(2)%></span>
								      		</button>
								      			<%}else{ %>
								      				<div class="well">Không tìm thấy</div>
								      			<%}%>
								      								   								      		
								      <br>Cộng tác viên dịch ít bài viết nhất
								      			<%if(listResultAccount.get(3)!=null && listResultAccount.get(3).getTenTaiKhoan()!=null){ 								      				
								      			%> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_3">
								      			<%=listResultAccount.get(3).getTenTaiKhoan()%><span class="badge"><%=arrayNumberUser.get(3)%></span>
								      		</button>
								      			<%}else{ %>
								      				<span class="badge">Không tìm thấy</span>
								      			<%}%>								      		
								      		<%}else{ %>
								      			 <div class="well">Không thể thống kê tài khoản user</div>
								      		<%} %>	
								      		</div>
								      		</div>
								      </div>
								      
								    </div>
								  </div>
								 </div>
					      	
					      	
					      	</div>					    
					    </div>					   
					   <div id="Category" class="tab-pane fade">
					      <h3 style="text-align: center;">Thống kê danh mục - </h3>
					      	<div class="alert alert-info">
					      
					      		<div class="panel-group" id="accordionCategory">
								    <div class="panel panel-default">
								      <div class="panel-heading">
								        <h4 class="panel-title">
								          <a data-toggle="collapse" data-parent="#accordionCategory" href="#collapseCategory_1">Đếm số danh mục</a>
								        </h4>
								      </div>
								      <div id="collapseCategory_1" class="panel-collapse collapse in">
								        <div class="panel-body"><%=resultStatisticCategory %></div>
								      </div>
								    </div>
								  
								        	<div class="panel panel-default">
								    <div class="panel-heading">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordionCategory" href="#collapseCategory_2">
								        Thống kê danh mục</a>
								      </h4>
								    </div>
								    <div id="collapseCategory_2" class="panel-collapse collapse">
								      <div class="panel-body">
								      <div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" role="form" action="StatisticalServlet?type=TKCat" method="post">
				  <div class="form-group">
				    <label for="dayStart">Từ ngày</label>
				    <input type="date" class="form-control" id="dayStart" name="dayStart">
				  </div>
				  <div class="form-group">
				    <label for="dayFinish">Đến ngày</label>
				    <input type="date" class="form-control" id="dayFinish" name="dayFinish">
				  </div>			  
				  <button type="submit" class="btn btn-default" name="btnStatistical">Thống kê</button>
				</form>
			</div>
		</div>
		<div class=row>
		<div class="col-md-8 col-md-offset-2">
				<h3 style="text-align: center;">Kết quả</h3>
								      		<%if(listResultCategory!=null){ %>
								      		Danh mục có nhiều bài đăng nhất
								      			<%if(listResultCategory.get(0)!=null && listResultCategory.get(0).getIdDanhMuc()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_Category_0">
								      			<%=listResultCategory.get(0).getTenDanhMucVi()%> - <%=listResultCategory.get(0).getTenDanhMucJa()%><span class="badge"><%=arrayNumberCategory.get(0)%></span>
								      		</button>
								      			<%}else{ %>
								      				<div class="well">Không tìm thấy</div>
								      			<%}%>
								      		<br>Danh mục có ít bài đăng nhất
								      		<%if(listResultCategory.get(1)!=null && listResultCategory.get(1).getIdDanhMuc()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_Category_1">
								      			<%=listResultCategory.get(1).getTenDanhMucVi()%> - <%=listResultCategory.get(1).getTenDanhMucJa()%><span class="badge"><%=arrayNumberCategory.get(1)%></span>
								      		</button>
								      			<%}else{ %>
								      				<span class="badge">Không tìm thấy</span>
								      			<%}%>
								      		<%}else{ %>
								      			 <div class="well">Không thể thống kê danh mục</div>
								      		<%} %>
								      		</div>
								      	</div>	
								      </div>
								    </div>
								  </div>								      								    
								  </div>
  							</div> 
					      
					   </div>
					    <div id="Post" class="tab-pane fade">
					      <h3 style="text-align: center;">Thống kê bài viết - </h3>	
					      <div class="alert alert-info">				     
					       <div class="panel-group" id="accordion_Post">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion_Post" href="#collapse_Post_1">Đếm số bài viết</a>
        </h4>
      </div>
      <div id="collapse_Post_1" class="panel-collapse collapse in">
        <div class="panel-body">
        	<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" role="form" action="StatisticalServlet?type=TKPosts" method="post">
				  <div class="form-group">
				    <label for="dayStart">Từ ngày</label>
				    <input type="date" class="form-control" id="dayStart" name="dayStart">
				  </div>
				  <div class="form-group">
				    <label for="dayFinish">Đến ngày</label>
				    <input type="date" class="form-control" id="dayFinish" name="dayFinish">
				  </div>			  
				  <button type="submit" class="btn btn-default" name="btnStatistical">Thống kê</button>
				</form>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2">
				<h3 style="text-align: center;">Kết quả</h3>
        	<%=resultStatisticPosts %>
        	</div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion_Post" href="#collapse_Post_2">Thống kê bài viết</a>
        </h4>
      </div>
      <div id="collapse_Post_2" class="panel-collapse collapse">
        <div class="panel-body">
        	 <div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" role="form" action="StatisticalServlet?type=TKPost" method="post">
				  <div class="form-group">
				    <label for="dayStart">Từ ngày</label>
				    <input type="date" class="form-control" id="dayStart" name="dayStart">
				  </div>
				  <div class="form-group">
				    <label for="dayFinish">Đến ngày</label>
				    <input type="date" class="form-control" id="dayFinish" name="dayFinish">
				  </div>			  
				  <button type="submit" class="btn btn-default" name="btnStatistical">Thống kê</button>
				</form>
			</div>
		</div>
		<div class=row>
		<div class="col-md-8 col-md-offset-2">
				<h3 style="text-align: center;">Kết quả</h3>
								      		<%if(listResultPost!=null){ %>
								      		Bài viết có lượt xem nhiều nhất
								      			<%if(listResultPost.get(0)!=null && listResultPost.get(0).getIdBaiViet() !=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_Post_0">
								      			<%=listResultPost.get(0).getTenBaiVietVi()%> - <%=listResultPost.get(0).getTenBaiVietJa()%><span class="badge"><%=arrayNumberPost.get(0)%></span>
								      		</button>
								      			<%}else{ %>
								      				<div class="well">Không tìm thấy</div>
								      			<%}%>
								      		<br>Bài viết có lượt xem ít nhất
								      		<%if(listResultPost.get(1)!=null && listResultPost.get(1).getIdBaiViet()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_Post_1">
								      			<%=listResultPost.get(1).getTenBaiVietVi()%> - <%=listResultPost.get(1).getTenBaiVietJa()%><span class="badge"><%=arrayNumberPost.get(1)%></span>
								      		</button>
								      			<%}else{ %>
								      				<span class="badge">Không tìm thấy</span>
								      			<%}%>
								      			<br>Bài viết có nhiều bình luận nhất
								      		<%if(listResultPost.get(2)!=null && listResultPost.get(2).getIdBaiViet()!=null){ %> 
								      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_Post_2">
								      			<%=listResultPost.get(2).getTenBaiVietVi()%> - <%=listResultPost.get(2).getTenBaiVietJa()%><span class="badge"><%=arrayNumberPost.get(2)%></span>
								      		</button>
								      			<%}else{ %>
								      				<span class="badge">Không tìm thấy</span>
								      			<%}%>
								      		<%}else{ %>
								      			 <div class="well">Không thể thống kê bài viết</div>
								      		<%} %>
								      		</div>
        </div>
      </div>
    </div>
  </div> 
					    </div>
					    </div>
					  </div>	
			  </div>
			  
<!------------ Modal tài khoản ---------------------------------->			  
			  
			  <%			 
	if(listResultAccount!=null){
		for(int i = 0;i<listResultAccount.size();i++){			
			
				
			%>			
			<!-- Modal -->
<div id="modal_<%=i%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%if(listResultAccount.get(i)!=null){%><%=listResultAccount.get(i).getTenTaiKhoan() %><%}else{ %>Tài khoản không tồn tại<%} %></h4>
      </div>
      <%if(listResultAccount.get(i)!=null){ %>
      <div class="modal-body">
      
        <div class="well well-lg">
        <%if(listResultAccount.get(i).getTenTaiKhoan()!=null){ %>
        <h4>
        	Tên người dùng: <span class="badge"><%=listResultAccount.get(i).getHoTen() %></span><br>
        	Địa chỉ: <span class="badge"><%=listResultAccount.get(i).getDiaChi() %></span><br>
        	Điện thoại: <span class="badge"><%=listResultAccount.get(i).getDienThoai() %></span><br>
        	Email: <span class="badge"><%=listResultAccount.get(i).getEmail() %></span><br>
        	Tình trạng: <span class="badge"><%=listResultAccount.get(i).getTinhTrang() %></span><br>
        	Ngôn ngữ: <span class="badge"><%if(listResultAccount.get(i).getNgonNgu().equals("vi")){%>Việt Nam<%}else{%>Nhật Bản<%} %></span>
        </h4>
        	 <%}else{ %>
        		Tài khoản này đã bị xóa hoặc đã bị khóa tài khoản
        	<%} %>        	
        </div>
       
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
       <%} %>
    </div>

  </div>
</div>	
<%}
			
	}
%>	

<!------------------------ Modal danh mục ------------------------------>
	  
			  <%			 
	if(listResultCategory!=null){
		for(int i = 0;i<listResultCategory.size();i++){			
			
				
			%>			
			<!-- Modal -->
<div id="modal_Category_<%=i%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%if(listResultCategory.get(i)!=null){%><%=listResultCategory.get(i).getTenDanhMucVi() %> - <%=listResultCategory.get(i).getTenDanhMucJa() %><%}else{ %>Danh mục không tồn tại<%} %></h4>
      </div>
      <%if(listResultCategory.get(i)!=null){ %>
      <div class="modal-body">
      
        <div class="well well-lg">
        <%if(listResultCategory.get(i).getIdDanhMuc()!=null){ %>
        <h4>
        	Tên danh mục tiếng việt: <span class="badge"><%=listResultCategory.get(i).getTenDanhMucVi() %></span><br>
        	Tên danh mục tiếng nhật: <span class="badge"><%=listResultCategory.get(i).getTenDanhMucJa() %></span><br>
        	<span class="badge"><%if(listResultCategory.get(i).getHienThi() == 1){ %>Có<%}else{ %>Không<%} %></span>hiển thị lên trang chủ
        </h4>
        	 <%}else{ %>
        		Danh mục này đã bị xóa
        	<%} %>        	
        </div>
       
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
       <%} %>
    </div>

  </div>
</div>	
<%}
			
	}
%>	

<!----------------------------- Modal bài viết -------------------------->
	  <%			 
	if(listResultPost!=null){
		for(int i = 0;i<listResultPost.size();i++){			
			
				
			%>			
			<!-- Modal -->
<div id="modal_Post_<%=i%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%if(listResultPost.get(i)!=null){%><%=listResultPost.get(i).getTenBaiVietVi() %> - <%=listResultPost.get(i).getTenBaiVietJa() %><%}else{ %>Bài viết không tồn tại<%} %></h4>
      </div>
      <%if(listResultPost.get(i)!=null){ %>
      <div class="modal-body">
      
        <div class="well well-lg">
        <%if(listResultPost.get(i).getIdBaiViet()!=null){ %>
        <h4>
        	Tên bài viết tiếng việt: <span class="badge"><%=listResultPost.get(i).getTenBaiVietVi() %></span><br>
        	Tên bài viết tiếng nhật: <span class="badge"><%=listResultPost.get(i).getTenBaiVietJa()%></span><br>
        	Danh mục: <span class="badge"><%=listResultPost.get(i).getDanhMuc().getTenDanhMucVi()%> - <%=listResultPost.get(i).getDanhMuc().getTenDanhMucJa()%></span><br>
        	Tài khoản: <span class="badge"><%=listResultPost.get(i).getTaiKhoan().getTenTaiKhoan() %></span><br>
        	Trạng thái: <span class="badge"><%=listResultPost.get(i).getTrangThai() %></span><br>
        	Lượt xem: <span class="badge"><%=listResultPost.get(i).getLuotXem() %></span><br>
        	Ngày đăng <span class="badge"><%=listResultPost.get(i).getNgayDang() %></span><br>
        	<span class="badge"><%if(listResultPost.get(i).getGimTrangChu()==1){ %>Có<%}else{ %>Không<%} %> ghim lên trang chủ</span>        	
        	
        </h4>        
        	 <%}else{ %>
        		Bài viết này đã bị xóa
        	<%} %>        	
        </div>
       
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
       <%} %>
    </div>

  </div>
</div>	
<%}
			
	}
%>	
</div>
			</div>
		
		</div>		
</body>

</html>