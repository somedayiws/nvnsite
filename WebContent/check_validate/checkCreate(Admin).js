jQuery.validator.addMethod("specialChars", function(value, element) {
	var regex = new RegExp("^[a-zA-Z0-9]+$");
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
//				specialChars : true
			},
			password : {
				required : true,
				minlength : 6,
//				specialChars : true,
			},
			re_password : {
				equalTo : "#password"
			},				
		},
		messages : {
			name : "Hãy nhập tên của bạn - お客様の氏名を入力下さい。",
			adress : "Hãy nhập địa chỉ của bạn - お客様の住所を入力下さい。",
			phone : {
				required : "Hãy nhập số điện thoại của bạn - お客様の電話番号を入力下さい。",
				digits : "Số điện thoại không hợp lệ - 電話番号は不適です。",
				minlength : "Số điện thoại ít nhất 10 ký tự - 電話番号は最低に10数字です。"
			},
			email : {
				required : "Hãy nhập email của bạn - 貴方のメールアドレスを入力して下さい。",
				email : "Địa chỉ email không hợp lệ - メールは不適です。"
			},
			username : {
				required : "Hãy điền tên đăng nhập. - ユーザー名を入力下さい",
//				specialChars : "Tên đăng nhập không được chứa ký tự đặc biệt - ユーザー名は特別な文字を使えません。"
			},
			password : {
				required : "Hãy điền mật khẩu - パスワードを入力下さい",
				minlength : "Mật khẩu ít nhất 6 ký tự - パスワードは最低に６文字をご入力下さい。",
//				specialChars : "Mật khẩu không được chứa chứa ký tự đặc biệt - パスワードは特別な文字が使えない。"
			},
			re_password : {
				equalTo : "Mật khẩu xác nhận không chính xác - 既に入力されたパスワードが正しくない"
			},				
		},

	});
});
