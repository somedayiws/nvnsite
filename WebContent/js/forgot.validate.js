/**
 * Forgot password validate form
 * Somedayiws
 * Website jpvn.net
 */
	$(document).ready(function() {
		$("#fquen").validate({
			rules : {
				taikhoan : {
					required : true
				}
			},
			messages : {
				taikhoan : {
					required : "<br>Chưa nhập tên tài khoản-ユーザー名をまだログインしない"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});