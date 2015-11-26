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
<title>Trang cá nhân Admin - 個人ホーム</title>
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
				  <strong>Thông báo - お知らせ!</strong><%=result %>
				</div>
			<%} %>
		<div class="panel panel-primary" style="margin-top: 100px">
			<div class="panel-heading">Thông tin tài khoản - アカウントの情報 </div>
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
						    <label for="username">Tên tài khoản - ユーザー名</label>
						    <input type="text" class="form-control" id="username" name="username" value="<%=username%>" disabled="disabled">
						  </div>
						  <div class="form-group">
						    <label for="pwd">Mật khẩu - パスワード<a href="#"><button class="btn btn-primary btn-sm" data-toggle="modal"
					data-target="#changePass"><span class="glyphicon glyphicon-pencil"></span></button></a></label>						    
							    <input type="text" class="form-control" id="pwd" name="password" value="<%=account.getMatKhau()%>" disabled="disabled" >
							    						    
						  </div>						 						  
					</div>
					
<!-- |--------------------------------------------------------------| -->
<!-- |------------------------Thông tin cá nhân---------------------| -->
<!-- |--------------------------------------------------------------| -->
					
					<div class="col-md-5">
						<div class="form-group">
						    <label for="name">Tên admin - 氏名</label>
						    <input type="text" class="form-control" id="name" name="name" value="<%=account.getHoTen()%>" disabled="disabled">
						 </div>
						 <div class="form-group">
						    <label for="address">Địa chỉ - 住所</label>
						    <input type="text" class="form-control" id="address" name="address" value="<%=account.getDiaChi()%>" disabled="disabled">
						</div>
						<div class="form-group">
						    <label for="phone">Điện thoại - 電話番号</label>
						    <input type="text" class="form-control" id="phone" name="phone" value="<%=account.getDienThoai()%>" disabled="disabled">
						</div>
						<div class="form-group">
						    <label for="email">Email - メール</label>
						    <input type="text" class="form-control" id="email" name="email" value="<%=account.getEmail()%>" disabled="disabled">
						</div>
					  </div>
					</div>			
				</div>			
					<button class="col-md-4 col-md-offset-4 col-xs-12 btn btn-primary" data-toggle="modal"
					data-target="#modalEditAccountAdmin">Chỉnh sửa - 修正</button>				
			</div>
			<%}else{ %>
				<div class="alert alert-danger">
  					<strong>Lỗi - エラ!</strong> Không tìm thấy tài khoản admin này - 管理者のアカウントが見当たらない
				</div>
			<%} %>
		</div>
<!-- |--------------------------------------------------------------| -->
<!-- |------------------------Modal chỉnh sửa-----------------------| -->
<!-- |--------------------------------------------------------------| -->
		<div class="modal fade" id="modalEditAccountAdmin">
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
									<label>Tên - 氏名<span class="rq"> * </span>:
									</label> <input class="form-control" maxlength="30" type="text"
										name="name" id="name" value="<%=account.getHoTen()%>">

								</div>
								<div class="form-group">
									<label>Địa chỉ - 住所<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="100"
										name="adress" value="<%=account.getDiaChi()%>">

								</div>
								<div class="form-group">
									<label>Số điện thoại - 電話番号<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="11"
										name="phone" value="<%=account.getDienThoai()%>">
								</div>
								<div class="form-group">
									<label>Email - メール<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="30"
										name="email" value="<%=account.getEmail()%>"
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>Tên tài khoản - ユーザー名<span class="rq"> * </span>:
									</label> <input type="text" class="form-control" maxlength="20"
										name="username" value="<%=username%>"
										readonly="readonly">
								</div>
									<div class="form-group">
									<label>Quyền quản trị - 管理者の権利<span class="rq"> * </span>:
									</label> <input type="text" class="form-control"
										name="typeUser" value="<%=account.getQuyenQuanTri()%>"
										readonly="readonly">
								</div>							
								<div class="form-group">
									<label>Ngôn ngữ - 言語</label> <select class="form-control"
										name="language">
										<option value="vj"
											<%if (account.getNgonNgu().equals("vi")) {%>
											selected="selected" <%}%> >Tiếng việt - ベトナム語</option>
										<option value="ja"
											<%if (account.getNgonNgu().equals("ja")) {%>
											selected="selected"<%} %>>Tiếng nhật - 日本語</option>																		
									</select>
								</div>						
									<div class="form-group">
									<label>Tình trạng - 状況<span class="rq"> * </span>
									</label> <input class="form-control" maxlength="30" type="text"
										name="status"  value="<%=account.getTinhTrang()%>" disabled="disabled">
								</div>
							
								<button type="submit" class="btn btn-success btn-sm">Hoàn
									thành - 完成</button>
								<button type="button" id="btn" class="btn btn-default btn-sm btn_modal"
								data-dismiss="modal">Quay lại - 戻り</button>
							</form>

						</div>						
					</div>
				</div>
			</div>
<!-- |--------------------------------------------------------------| -->
<!-- |----------------Modal thay đổi mật khẩu-----------------------| -->
<!-- |--------------------------------------------------------------| -->

<div id="changePass" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Thay đổi mật khẩu - パスワードを変更して下さい</h4>
      </div>
      <div class="modal-body">
       		<form action="ChangePassServlet" method="post" id="formChangePass">
       			<div class="form-group">
				  <label for="pwd">Mật khẩu cũ - 古いパスワード:</label>
				  <input type="password" class="form-control" id="pwd" name="password">
				</div>
       			<div class="form-group">
				  <label for="pwdnew">Mật khẩu mới - 新しいパスワード:</label>
				  <input type="password" class="form-control" id="pwd_new" name="password_new">
				</div>
       			<div class="form-group">
				  <label for="re_pwd">Nhập lại mật khẩu - パスワードをもう一度入力して下さい。:</label>
				  <input type="password" class="form-control" id="re_pwd" name="re_password">
				</div>
				<button type="submit" name="changePass"  class="btn btn-primary btn-block">Hoàn thành - 完成</button>				
       		</form> 
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
<script type="text/javascript">
	$('#"formChangePass"').submit(function(){
		var password = $('#pwd').val();
		var password_new = $('#pwd_new').val();
		var password_repeater = $('#re_pwd').val();
		var regex = new RegExp("^[a-zA-Z0-9]+$");
		
		if(password == "" || password_new == ""){
			alert("Bạn phải nhập mật khẩu - パスワードを入力下さい");
			return false;
		}
		if(regex.test(password) || regex.test(password_new)){
			alert("Mật khẩu không được chứa ký tự đặc biệt - パスワードは特別な文字が使えない。");
			return false;
		}	
		if(password_new != password_repeater){
			alert("Mật khẩu xác nhận không đúng - 既に入力されたパスワードが正しくない");
			return false;
		}
	});
</script>
</html>