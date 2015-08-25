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
			name : "Hãy nhập tên của bạn",
			adress : "Hãy nhập địa chỉ của bạn",
			phone : {
				required : "Hãy nhập số điện thoại của bạn",
				digits : "Số điện thoại phải là số",
				minlength : "Số điện thoại ít nhất 10 ký tự"
			},
			
						
		},

	});
	}
});
