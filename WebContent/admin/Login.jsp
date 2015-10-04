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
<title>Đăng nhập - ログイン</title>
</head>
<%
	//Nhận kết quả khi login không thành công
	String result =(String)request.getAttribute("result");	
%>
<body>
 <div class="container">
        <div class="card card-container">          
            <img id="profile-img" class="profile-img-card" src="../images/avatar_2x.png" />
             <!-- Hiển thị kết quả khi login thất bại -->
            <%if(result!=null){ %>
            	<div class="alert alert-danger">
  					<strong>Lỗi - エラー!</strong> <%if(result.equals("1")){%>Tên đăng nhập và mật khẩu không hợp lệ - ユーザー名およびパスワードが不適切です。<%}else if(result.equals("2")){ %>Tài khoản không tồn tại trong hệ thống - アカウントはシステム上に存しない。<%} else { %> Bạn chưa đăng nhập hệ thống. <% } %>
				</div>
            <%} %>
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="LoginServlet" method="post" id="form_register_and_restore">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Tên đăng nhập - ユーザー名" required autofocus>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Mật khẩu - パスワード" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" name="remember-me" value="remember-me"> Ghi nhớ - メーモ
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Đăng nhập - ログイン</button>
            </form><!-- /form -->
            <a href="ShowForgotPassword" class="forgot-password">
               Quyên mật khẩu - パスワードが忘れた。
            </a>
           
        </div><!-- /card-container -->               
    </div><!-- /container -->

</body>
</html>

