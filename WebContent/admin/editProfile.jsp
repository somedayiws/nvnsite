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
<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="./css/home.css">
<title>Trang cá nhân Admin - ホーム管理</title>
</head>
<%
	//Check session exist
	HttpSession session_user = request.getSession();
	String username =(String)session_user.getAttribute("username");	
	
	//Nhận lại thông tin admin từ EditProfileServlet
	TAIKHOAN account = (TAIKHOAN)request.getAttribute("account");
	
	//Nhận lại kết quả chỉnh sửa từ AdminEditServlet
	String result = (String)request.getAttribute("result");
%>
<body>
	<%if(username!=null){ %>
	<div class="container-fluid" >
		<%@include file="header_ver_1.jsp"%>	
		<%@include file="Menu.jsp"%>
		<%if(result!=null){ %>
				<div class="alert alert-info col-md-6 col-md-offset-3" style="margin-top: 10px">
				  <strong>Thông báo!</strong><%=result %>
				</div>
			<%} %>
		<div class="panel panel-primary" style="margin-top: 100px">
			<div class="panel-heading">Thông tin tài khoản</div>
			<div class="panel-body">
<!-- |--------------------------------------------------------------| -->
<!-- |-------------------Hiển thị kết quả chỉnh sửa-----------------| -->
<!-- |--------------------------------------------------------------| -->
			
			<%if(account!=null){ %>
				<div class="row">
					
<!-- |--------------------------------------------------------------| -->
<!-- |------------------------Thông tin tài khoản-------------------| -->
<!-- |--------------------------------------------------------------| -->			
					<div class="col-md-3 col-md-offset-2">
						  <div class="form-group">
						    <label for="username">Tên tài khoản</label>
						    <input type="text" class="form-control" id="username" name="username" value="<%=username%>" disabled="disabled">
						  </div>
						  <div class="form-group">
						    <label for="pwd">Mật khẩu <a href="#"><button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></a></label>						    
							    <input type="text" class="form-control" id="pwd" name="password" value="<%=account.getMatKhau()%>" disabled="disabled" >
							    						    
						  </div>						 						  
					</div>
					
<!-- |--------------------------------------------------------------| -->
<!-- |------------------------Thông tin cá nhân---------------------| -->
<!-- |--------------------------------------------------------------| -->
					
					<div class="col-md-5">
						<div class="form-group">
						    <label for="name">Tên admin</label>
						    <input type="text" class="form-control" id="name" name="name" value="<%=account.getHoTen()%>" disabled="disabled">
						 </div>
						 <div class="form-group">
						    <label for="address">Địa chỉ</label>
						    <input type="text" class="form-control" id="address" name="address" value="<%=account.getDiaChi()%>" disabled="disabled">
						</div>
						<div class="form-group">
						    <label for="phone">Điện thoại</label>
						    <input type="text" class="form-control" id="phone" name="phone" value="<%=account.getDienThoai()%>" disabled="disabled">
						</div>
						<div class="form-group">
						    <label for="email">Email</label>
						    <input type="text" class="form-control" id="email" name="email" value="<%=account.getEmail()%>" disabled="disabled">
						</div>
					  </div>
					</div>			
				</div>			
					<button class="col-md-4 col-md-offset-4 col-xs-12 btn btn-primary" data-toggle="modal"
					data-target="#modelEditAccountAdmin">Chỉnh sửa</button>				
			</div>
			<%}else{ %>
				<div class="alert alert-danger">
  					<strong>Lỗi!</strong> Không tìm thấy tài khoản admin này - 
				</div>
			<%} %>
		</div>
<!-- |--------------------------------------------------------------| -->
<!-- |------------------------Thông tin cá nhân---------------------| -->
<!-- |--------------------------------------------------------------| -->
		<div class="modal fade" id="modelEditAccountAdmin">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Chỉnh sửa tài khoản cá nhân - 編集アカウント(管理者)</h4>
						</div>
						<div class="modal-body">

							<form id="formedit" name="form_edit_admin"
								action="AdminEditServlet?type=editProfile" method="post">

								<div class="form-group">
									<label>Tên - 名前<span class="rq"> * </span>:
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=account.getHoTen()%>">

								</div>
								<div class="form-group">
									<label>Địa chỉ - 住所<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=account.getDiaChi()%>">

								</div>
								<div class="form-group">
									<label>Số điện thoại - 電話<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="11"
										name="phone" value="<%=account.getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email - Eメール<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=account.getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản - ユーザ名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=username%>"
										readonly="readonly">
								</div>
									<div class="form-group">
									<label>Quyền quản trị - ユーザ名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control"
										name="typeUser" value="<%=account.getQuyenQuanTri()%>"
										readonly="readonly">
								</div>							
								<div class="form-group">
									<label>Ngôn ngữ - 言語</label> <select class="form-control"
										name="language">
										<option value="vj"
											<%if (account.getNgonNgu().equals("vi")) {%>
											selected="selected" <%}%> >Tiếng việt</option>
										<option value="ja"
											<%if (account.getNgonNgu().equals("ja")) {%>
											selected="selected"<%} %>>日本</option>																		
									</select>
								</div>						
									<div class="form-group">
									<label>Tình trạng - 状態<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="status"  value="<%=account.getTinhTrang()%>" disabled="disabled">
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
	</div>
	<%}else{ 
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}
	%>
	


</body>
</html>