/*******************************************************************************
 * Định nghĩa các hàm dùng cho phía client v.1.0
 ******************************************************************************/
//khai báo các biên dùng chung

//load dữ liệu cho menu
$(function() {
	$.ajax({
				url : "DataMenuServlet", // Gửi đến địa chỉ
				type : "POST", // Phương thức gửi lên server
				async : true, // Có đồng bộ hóa
				beforeSend : function() { //Làm chi đó trước khi có kết quả
					$("#menu").html("<i class='fa fa-refresh fa-2x fa-spin' style='margin-left: auto; margin-right: auto;'></i>");
				},
				success : function(res) { //Làm chi đó khi thành công
					$("#menu").html(res);
				},
				error : function() { //Làm chi đó khi lỗi xảy ra
					alert('Có lỗi xảy ra');
				}
	});
});

//điều hướng đến địa chỉ url = trang?id=id
function loadData(trang, id){
	window.location.href = trang + "?id=" + id;
};