$(document)
			.ready(
					function() {						
						$('#typeCategory').hide();
						$('#typeAccount').hide();
						$('#typeView').hide();
						$('#typeDay').hide();

						$("#typeFind")
								.change(
										function() {
											var typeFind = $('#typeFind').val();
											if (typeFind == "IdDanhMuc") {
												$("#typeCategory").show();
												$("#typeDifference").hide();
												$('#typeAccount').hide();
												$('#typeDay').hide();
											} else if (typeFind == "IdTaiKhoan") {
												$('#typeAccount').show();
												$("#typeCategory").hide();
												$("#typeDifference").hide();
												$('#typeDay').hide();
											} else if (typeFind == "GimTrangChu") {
												alert("Nhập số 1 để xem bài viết đã ghim. Nhập số 0 để xem bài viết chưa ghim");
												$("#typeCategory").hide();
												$("#typeDifference").show();
												$('#typeAccount').hide();
												$('#typeView').hide();
												$('#typeDay').hide();
											} else if (typeFind == "LuotXem") {
												$('#typeView').show();
												$("#typeCategory").hide();
												$("#typeDifference").hide();
												$('#typeAccount').hide();
												$('#typeDay').hide();
											} else if (typeFind == "NgayDang") {
												$('#typeDay').show();
												$("#typeCategory").hide();
												$("#typeDifference").hide();
												$('#typeAccount').hide();
												$('#typeView').hide();
											} else {
												$("#typeCategory").hide();
												$("#typeDifference").show();
												$('#typeAccount').hide();
												$('#typeView').hide();
												$('#typeDay').hide();
											}
										});
						$('#formSearchPost')
								.submit(
										function() {
											var typeFind = $('#typeFind').val();
											var stringFindDay = $(
													'#stringFindDay').val();
											var stringFind = $('#stringFind')
													.val();

											if (typeFind == "GimTrangChu") {
												if (stringFind != "1"
														&& stringFind != "0") {
													alert("Bạn phải nhập 1(xem bài viết đã ghim) hoặc 0(bài viết chưa ghim)");
													return false;
												}
											}
											if (typeFind == "NgayDang") {
												var regDay = /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/;
												if (!regDay.test(stringFindDay)) {
													alert("Ngày đăng không hợp lệ. Ngày đăng có dạng MM/DD/YYYY");
													return false;
												}
											}
											return true;
										});
					});
function changeBookmark(idPost) {
	$.ajax({
		url : "BookmarkInHomeServlet", //file 
		type : "POST", //phuong thức gưi
		data : {
			id : idPost
		}, //dữ liệu gửi
		async : true, //
		success : function(res) {
			if (res.indexOf("tối đa") > -1) {
				$("#resultMessage").html(res);
				alert($("#resultMessage").children("#result").text());
			} else {
				$("#resultMessage_" + idPost).html(res);
			}

		},
		error : function() {
			alert('Không thể ghim lên trang chủ');
			$("#load").html("");
		}
	});
}
function XoaQC(x) {
	$("#idQC").text(x);
	$("#idXoa").val(x);
	$('#xoaQC').modal('show');
}
function HienThi(x, b) {
	if (b == '1')
		$("#idQCgo").text("Bạn thật sự muốn gỡ bỏ thông báo - 貴方は本当に知らせを削除したいですか？ " + x);
	else
		$("#idQCgo").text("Cho phép đăng thông báo - お知らせの掲載を許可する。" + x);
	$("#idGo").val(x);
	$("#hienthi").val(b);
	$('#goQC').modal('show');
}
function DieuHuong(url) {
	window.location.href = url;
}
function HuyBaiDich(x) {
	//Dùng ajax load dữ liệu về
	$
			.ajax({
				url : "HuyBaiDichServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					id : x
				}, //dữ liệu gửi
				async : true, //
				success : function(res) {
					alert(res);
					window.location.reload();
				}
			});
	/* $('#suaThongBao').modal('show'); */
}