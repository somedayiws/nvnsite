/**
 * Register validate
 * Somedayiws
 * Website jpvn.net
 */
function checkTaiKhoan() {
		var tkhoan = $('#taikhoandk').val();
		if(!/[*#!~?,.% ]/.test(tkhoan)){
			$.ajax({
				url : "CheckTaiKhoanServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
		        	tk : tkhoan
		        },
		        async : true,
		        success : function(res) {
		        	$('#loitk').remove();
		        	$('#taikhoandk').after(res);
				}
			});
		} else {
			$('#loitk').remove();
			$('#taikhoandk').after("<label id='loitk' class='error'>Tài khoản chỉ gôm các ký tự 0-9, a-z, A-Z, _</label>");
		}
	};
	
	function checkEmail() {
		$.ajax({
			url : "CheckEmailExistServlet", //file 
			type : "POST", //phuong thức gưi
			data : {
	        	tk : $('#eml').val()
	        },
	        async : true,
	        success : function(res) {
	        	$('#loiem').remove();
	        	$('#eml').after(res);
			}
		});
	};
	
	$(document).ready(function() {
		/* Check đăng nhập */
		/* Check đăng ký */
		$("#khungdangky").validate({
			
			rules : {
				taikhoan : {
					required : true,
					maxlength : 30 
				},
				matkhau : {
					required : true,
					minlength : 6
				},
				laimatkhau : {
					required : true,
					equalTo: "#matkhau"
				},
				hoten : {
					required : true
				},
				diachi : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				dienthoai : {
					required : true,
					digits : true
				},
				noiquy : {
					required : true
				}
			},
			messages : {
				taikhoan : {
					required : "Bạn chưa nhập tên tài khoản<br>あなたはユーザー名をまだログインしない",
					maxlength : "Tên đăng nhập dùng để đăng nhập vào hệ thống, tối đa 30 ký tự, không chứa ký tự đặc biệt<br>ユーザー名はシステム上にログインし、最大に30文字で、特別な記号を使わないでください。"
				},
				matkhau : {
					required : "Bạn chưa nhập mật khẩu<br>ログインをまだしない!",
					minlength : "Mật khẩu ít nhất 6 ký tự, có phân biệt chữ hoa, chữ thường<br>パスワードは最低に6文字、半角と全角を分別して下さい。"
				},
				laimatkhau : {
					required: 'Vui lòng nhập mật khẩu<br>パスワードをもう一度入力して下さい。',
					equalTo: 'Mật khẩu xác nhận không chính xác<br>既に入力されたパスワードが正しくない'
				},
				hoten : {
					required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
				},
				diachi : {
					required : "Bạn chưa nhập địa chỉ hiện tại!<br>貴方の現在の住所を入力して下さい!"
				},
				email : {
					required : "Bạn chưa nhập email!<br>メールをまだ入力しない!",
					email : "Không đúng định dạng email<br>メールの形式が無効です"
				},
				dienthoai : {
					required : "Bạn chưa nhập số điện thoại!<br>連絡取れる電話番号を入力しなければならない",
					digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。"
				},
				noiquy : {
					required : "Bạn chưa đồng ý với quy định của diễn đàn!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});