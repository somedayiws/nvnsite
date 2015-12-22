/**
 * Load more data list category with ajax 
 * Somedayiws 
 * Website jpvn.net
 */
jQuery(document).ready(
		function($) {
			$(window).scroll(
					function() {
						if (($(document).height() - $(this).scrollTop() - $(
								this).height()) < 10) {
							loadmoredata();
						}
					});
		});
function loadmoredata() {
	var nbaiviet = parseInt($("#baiviet .baivieti").size());
	var id = $("#id").val();

	$.ajax({
		url : "DataBaiVietServlet", // file
		type : "POST", // phuong thức gưi
		data : {
			vitri : nbaiviet,
			id : id
		}, // dữ liệu gửi
		async : true, //
		beforeSend : function() {
			$("#loadmorebutton").html(
					"<i class='fa fa-spinner fa-pulse'></i></i> Xem thêm");
		},
		success : function(res) {
			$("#divloadmore").before(res);
			nbaiviet = parseInt($("#baiviet").children().size());
			$("#loadmorebutton").html("Xem thêm");
		},
		error : function() {
			alert('Có lỗi xảy ra-エラが発生した。!!');
			$("#load").html("");
		}
	});
}