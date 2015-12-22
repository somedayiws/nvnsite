/**
 * Validate contact form
 * Somedayiws
 * Website jpvn.net
 */
$(document).ready(function() {
		/* Check đăng nhập */
		/* Check đăng ký */
		$("#khunglienhe").validate({
			rules : {
				hoten : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				dienthoai : {
					digits : true,
					minlength : 10
				},
				tieude : {
					required : true,
					maxlength: 80
				},
				noidung : {
					required : true,
				},
			},
			messages : {
				hoten : {
					required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
				},
				tieude : {
					required : "Bạn chưa nhập tiêu đề!<br> テーマをまだ記入しない!",
					maxlength : "Tiêu đề quá dài! <br> テーマが長いです。!<br>"
				},
				email : {
					required : "Bạn chưa nhập email!<br>メールをまだ入力しない!",
					email : "Không đúng định dạng email<br>メールの形式が無効です"
				},
				dienthoai : {
					digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。",
					minlength : "Chứa tối thiểu 10 chữ số<br>最低に10文字です。"
				},
				noidung : {
					required : "Bạn chưa nhập nội dung !<br> 内容をまだ記入しない !"
				},
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});