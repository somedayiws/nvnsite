/**
 * Edit profile validate form 
 * Somedayiws@gmail.com
 * Website http://jpvn.net
 */

function checkTaiKhoan() {
	var tkhoan = $('#taikhoandk').val();
	if (!/[*#!~?,.% ]/.test(tkhoan)) {
		$.ajax({
			url : "CheckTaiKhoanServlet", // file
			type : "POST", // phuong thức gưi
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
		$('#taikhoandk')
				.after(
						"<label id='loitk' class='error'>Tài khoản chỉ gôm các ký tự 0-9, a-z, A-Z, _</label>");
	}
};

function checkEmail() {
	$.ajax({
		url : "CheckEmailExistServlet", // file
		type : "POST", // phuong thức gưi
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

// Validate
$(document)
		.ready(
				function() {
					$("#fchangepassword")
							.validate(
									{
										rules : {
											oldpassword : {
												required : true,
												minlength : 6
											},
											newpassword : {
												required : true,
												minlength : 6
											},
											passwordagain : {
												equalTo : "#newpassword"
											}
										},
										messages : {
											oldpassword : {
												required : "Bạn chưa nhập mật khẩu<br>ログインをまだしない!",
												minlength : "Mật khẩu ít nhất 6 ký tự, có phân biệt chữ hoa, chữ thường<br>パスワードは最低に6文字、半角と全角を分別して下さい。"
											},
											newpassword : {
												required : "Bạn chưa nhập mật khẩu<br>ログインをまだしない!",
												minlength : "Mật khẩu ít nhất 6 ký tự, có phân biệt chữ hoa, chữ thường<br>パスワードは最低に6文字、半角と全角を分別して下さい。"
											},
											passwordagain : {
												equalTo : 'Mật khẩu xác nhận không chính xác<br>既に入力されたパスワードが正しくない'
											}
										},
										submitHandler : function(form) {
											$
													.ajax({
														type : 'POST',
														url : 'ChangePassClientServlet',
														data : $(
																'#fchangepassword')
																.serialize(),
														beforeSend : function() {
															$("#btnChangePass")
																	.html(
																			"<i class='fa fa-spinner fa-pulse'></i> Thay đổi mật khẩu");
														},
														success : function(
																responseText) {
															$(
																	'#resultAjaxProfile')
																	.html(
																			responseText);
															$('#resultUpdate')
																	.html(
																			$(
																					'#resultAjaxProfile center h3')
																					.html());
															if ($(
																	'#resultAjaxProfile #type')
																	.text() == "success") {
																$(
																		'#alertResult')
																		.attr(
																				"class",
																				"alert alert-success alert-white rounded");
																$(
																		'#alertResult i')
																		.attr(
																				"class",
																				"fa fa-check");
																$(
																		'#alertResult strong')
																		.html(
																				"Thành công!");
															} else {
																$(
																		'#alertResult')
																		.attr(
																				"class",
																				"alert alert alert-danger alert-white rounded");
																$(
																		'#alertResult i')
																		.attr(
																				"class",
																				"fa fa-times-circle");
																$(
																		'#alertResult strong')
																		.html(
																				"Thất bại!");
															}
															$('#alertResult')
																	.removeAttr(
																			"style");
															$("#btnChangePass")
																	.html(
																			"Thay đổi mật khẩu");
														},
														error : function() {
															$("#btnChangePass")
																	.html(
																			"Thay đổi mật khẩu");
														}
													});
										}
									});
					$("#fcapnhat")
							.validate(
									{
										rules : {
											taikhoan : {
												required : true,
												maxlength : 30
											},
											hoten : {
												required : true
											},
											email : {
												email : true
											},
											dienthoai : {
												digits : true
											}
										},
										messages : {
											taikhoan : {
												required : "Bạn chưa nhập tên tài khoản<br>あなたはユーザー名をまだログインしない",
												maxlength : "Tên đăng nhập dùng để đăng nhập vào hệ thống, tối đa 30 ký tự, không chứa ký tự đặc biệt<br>ユーザー名はシステム上にログインし、最大に30文字で、特別な記号を使わないでください。"
											},
											hoten : {
												required : "Bạn chưa nhập họ tên!<br>氏名をまだ入力しない!"
											},
											email : {
												email : "Không đúng định dạng email<br>メールの形式が無効です"
											},
											dienthoai : {
												digits : "Nhập sai định dạng số điện thoại<br>入力された電話番号が無効です。"
											}
										},
										submitHandler : function(form) {
											$
													.ajax({
														type : 'POST',
														url : 'ChangeInfoClientServlet',
														data : $('#fcapnhat')
																.serialize(),
														beforeSend : function() {
															$("#btnChangePass")
																	.html(
																			"<i class='fa fa-spinner fa-pulse'></i> Thay đổi mật khẩu");
														},
														success : function(
																responseText) {
															$(
																	'#resultAjaxProfile')
																	.html(
																			responseText);
															$('#resultUpdate')
																	.html(
																			$(
																					'#resultAjaxProfile center h3')
																					.html());
															if ($(
																	'#resultAjaxProfile #type')
																	.text() == "success") {
																$(
																		'#alertResult')
																		.attr(
																				"class",
																				"alert alert-success alert-white rounded");
																$(
																		'#alertResult i')
																		.attr(
																				"class",
																				"fa fa-check");
																$(
																		'#alertResult strong')
																		.html(
																				"Thành công!");
															} else {
																$(
																		'#alertResult')
																		.attr(
																				"class",
																				"alert alert alert-danger alert-white rounded");
																$(
																		'#alertResult i')
																		.attr(
																				"class",
																				"fa fa-times-circle");
																$(
																		'#alertResult strong')
																		.html(
																				"Thất bại!");
															}
															$('#alertResult')
																	.removeAttr(
																			"style");
															$("#btnChangePass")
																	.html(
																			"Thay đổi mật khẩu");
														},
														error : function() {
															$("#btnChangePass")
																	.html(
																			"Thay đổi mật khẩu");
														}
													});
										}
									});
				});