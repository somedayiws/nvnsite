$(document).ready(function() {	
	for(var i=0;i<4;i++){		
	var validator = $("#formedit"+i).validate({
		
		rules : {
			name 	: "required",
			adress 	: "required",
			phone 	: {
				required : true,
				digits : true,
				minlength : 10,
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
			
						
		},

	});
	}
});
