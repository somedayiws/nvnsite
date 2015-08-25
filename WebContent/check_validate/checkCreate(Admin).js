jQuery.validator.addMethod("specialChars", function(value, element) {
	var regex = new RegExp("^[a-zA-Z0-9]+$");
	alert("vào");
	return regex.test(value);
}, "please use only alphanumeric or alphabetic characters");
$(document).ready(function() {	

	var validator = $("#formCreateAccount").validate({
		rules : {
			name 	: "required",
			adress 	: "required",
			phone 	: {
				required : true,
				digits : true,
				minlength : 10,
			},
			email 	: {
				required : true,
				email : true
			},
			username : {
				required : true,
				specialChars : true
			},
			password : {
				required : true,
				minlength : 6,
				specialChars : true,
			},
			re_password : {
				equalTo : "#password"
			},				
		},
		messages : {
			name : "Hãy nhập tên của bạn",
			adress : "Hãy nhập địa chỉ của bạn",
			phone : {
				required : "Hãy nhập số điện thoại của bạn",
				digits : "Số điện thoại phải là số",
				minlength : "Số điện thoại ít nhất 10 ký tự"
			},
			email : {
				required : "Hãy nhập email của bạn",
				email : "Địa chỉ email không hợp lệ"
			},
			username : {
				required : "Hãy điền tên đăng nhập.",
				specialChars : "Tên đăng nhập không được chứa ký tự đặc biệt"
			},
			password : {
				required : "Hãy điền mật khẩu",
				minlength : "Mật khẩu ít nhất 6 ký tự",
				specialChars : "Mật khẩu không được chứa chứa ký tự đặc biệt"
			},
			re_password : {
				equalTo : "Mật khẩu xác nhận không chính xác"
			},				
		},

	});
});
