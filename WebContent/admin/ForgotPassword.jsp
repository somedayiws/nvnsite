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
<script type="text/javascript" src="../check_validate/checkValidate.js"></script>
<link rel="stylesheet"
	href="../admin/css/login.css">
<link rel="stylesheet" href="css/register.css">
<script type="text/javascript" src="js/forgotPassword.js"></script>

<title>Khôi phục mật khẩu - パスワードを回復</title>
</head>

<%
	//Nhận kết quả trả về khi submit form 
	String result =(String)request.getAttribute("result");
%>
<body>

 <div class="container">
    <div class="panel panel-primary" id="panel_forgotpassword" >
      <div class="panel-heading">Khôi phục mật khẩu - パスワードを回復</div>
      <div class="panel-body">
      		<form action="AdminForgotPasswordServlet" method="post" id="form_register_and_restore">
      			<div class="form-group">
						<label>Nhập lại email - 入力メール: </label> 
						<input type="text" class="form-control" name="email">
				</div>
				<button type="submit" name="btnSubmit" class="btn btn-success">Khôi phục - リストア</button>
				<a href="ShowloginAdmin"><button type="button" class="btn btn-success">Quay lại</button></a>				
			</form>
			
				<%if(result!=null){ %>
				<!-- Hiển thị kết quả khi khôi phục mật khẩu(không thành công)ở đây -->
					<br>
					<div class="alert alert-danger">
 							 <strong>Lỗi - エラー!</strong> <%if(result.equals("1")){%>Lỗi trong quá trình cập nhật mật khẩu, vui lòng thử lại hoặc liên hệ với nhà cung cấp<%}else if(result.equals("2")){%>Email admin không có trong hệ thống, vui lòng liên hệ nhà cung cấp để được cấp Email<%}else{ %>Email không hợp lệ<%} %>
					</div>
				<%} %>
      		
      </div>
    </div>
  </div>
</body>
</html>

