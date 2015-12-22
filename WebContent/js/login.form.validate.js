/** 
 * Validate login ajax login normal
 * Somedayiws Jpvn.net
 */

$(document).ready(function() {
	$("#fdangnhap").validate({
		rules : {
			taikhoan : {
				required : true
			},
			matkhau : {
				required : true
			}
		},
		messages : {
			taikhoan : {
				required : "<br>Chưa nhập tên tài khoản<br>アカウントのユーザー名をまだ入力しない"
			},
			matkhau : {
				required : "<br>Chưa nhập mật khẩu<br>ログインをまだしない!"
			}
		},
		submitHandler : function(form) {
			/* form.submit(); */
			$.ajax({
                type: 'POST',
                url: 'DangNhapAjaxServlet',
                data: $('#fdangnhap').serialize(),
                success: function(responseText) {
                	$('#resultAjax').html(responseText);
                	uiLogged();
                }
            });
		}
	});
});