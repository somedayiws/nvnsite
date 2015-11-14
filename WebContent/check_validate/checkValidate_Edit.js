jQuery.validator.addMethod("specialChars", function(value, element) {
	var regex = new RegExp("^[a-zA-Z0-9]+$");
	return regex.test(value);
}, "please use only alphanumeric or alphabetic characters");
$(document).ready(function() {
	var validator = $("#changePassword").validate({
		rules : {
			password : {
				required : true,
				minlength : 6,
//				specialChars : true,
			},
			password_new : {
				required : true,
				minlength : 6,
//				specialChars : true,
			},			
			re_password_new : {
				equalTo : "#password_new"
			},			

		},
		messages : {	
			password : {
				required : "Hãy điền mật khẩu cũ",
				minlength : "Mật khẩu cũ ít nhất 6 ký tự",
//				specialChars : "Mật khẩu cũ không được chứa chứa ký tự đặc biệt"
			},
			password_new : {
				required : "Hãy điền mật khẩu mới",
				minlength : "Mật khẩu mới ít nhất 6 ký tự",
//				specialChars : "Mật khẩu mới không được chứa chứa ký tự đặc biệt"
			},
			re_password_new : {
				equalTo : "Mật khẩu xác nhận không chính xác - 既に入力されたパスワードが正しくない"
			},		
		},

	});
});