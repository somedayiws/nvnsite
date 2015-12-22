/**
 * Load more data list home result with ajax 
 * Somedayiws 
 * Website jpvn.net
 */
var nbaiviet = 10;
	jQuery(document)
			.ready(
					function($) {
						$(window)
								.scroll(
										function() {
											var size = parseInt($('#baiviet .danhmucx').size())+1;
											var nbaiviet = parseInt($(
													"#baiviet .danhmucx:nth-child("+size+")")
													.attr("id"));
											if (($(document).height()
													- $(this).scrollTop() - $(
													this).height()) < 10) {
												loadmoredata();
											}
										});
					});
	function loadmoredata() {
		
		var size = parseInt($('#baiviet .danhmucx').size())+1;
		var nbaiviet = parseInt($(
				"#baiviet .danhmucx:nth-child("+size+")")
				.attr("id"));
			$.ajax({
						url : "DataDanhMucServlet", //file 
						type : "POST", //phuong thức gưi
						data : {
							vitri : nbaiviet
						}, //dữ liệu gửi
						async : true, //
						beforeSend : function() {
							$("#loadmorebutton")
									.html(
											"<i class='fa fa-spinner fa-pulse'></i></i> Xem thêm");
						},
						success : function(
								res) {
							$("#divloadmore")
									.before(
											res);
							nbaiviet = parseInt($(
									"#baiviet")
									.children()
									.size());
							$("#loadmorebutton")
							.html(
									"Xem thêm");
						},
						error : function() {
							alert('Có lỗi xảy ra - エラが発生した。');
							$("#load")
									.html(
											"");
						}
					});
	}