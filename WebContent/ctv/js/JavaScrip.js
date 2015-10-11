/*
 * Hàm xử lý load thống kê
 */
$(document).ready(function() {
		$.ajax({
			url : "Thong-ke",
			type : "post",
			success : function(result) {
				$("#capnhat").html(result);
			}
		});
		var refreshId = setInterval(function() {
			$.ajax({
				url : "Thong-ke",
				type : "post",
				success : function(result) {
					$("#capnhat").html(result);
				}
			});
		}, 15000);
});

