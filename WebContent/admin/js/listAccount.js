/*
 * 
 * Xét tình trạng của người dùng
 * 
 * */	

$(".btnban").click(function() {
	var returnValue = confirm("Bạn có muốn thay đổi tình trạng người dùng hay không - 貴方はユーザーの状況を更新したいですか？?");
						if (returnValue == true) {
							var idAcc = this.id;
							$.ajax({
								url : "BanAccountServlet", //file 
								type : "POST", //phuong thức gưi
								data : {
									id : idAcc
								}, //dữ liệu gửi
								async : true, //
								success : function(res) {
									if(res.indexOf("Khóa")> -1){
										window.location = "ListAccountServlet";
									}else{
									$(".resultMessage_"+idAcc).html(res);
									}
								},
								error : function() {
									alert('Không thể thay đổi tình trạng - 現況が変更できない');
									$("#load").html("");
								}
							});
						}
					});
/*
 * 
 * function kiểm tra validate
 * 
 * */
function checkValidate(typeFind, stringFind, lengthStringFind) {
	if (stringFind == "") {
		alert("Bạn phải nhập từ cần tìm - 検索したい言葉を入力ください。");
		return false;
	}
	if (stringFind.length > lengthStringFind) {
		alert(typeFind + " tối đa - 最大" + lengthStringFind + " ký tự - 文字");
		return false;
	}
	if (typeFind == "DienThoai") {
		var patt = /\d{10,11}/;
		if (!patt.test(stringFind)) {
			alert("Số điện thoại không hợp lệ - 電話番号は不適です。");
			return false;
		}
	}
	if (typeFind == "Email") {
		var patt = /^\w+@\w.+\w$/;
		if (!patt.test(stringFind)) {
			alert("Email không hợp lệ - メールは不適です。");
			return false;
		}
	}
	if (typeFind == "TenTaiKhoan") {
		var patt = /\W+/;
		if (patt.test(stringFind)) {
			alert("Tên đăng nhập không được chứa ký tự đặt biệt - ユーザー名は特別な文字を使えません。");
			return false;
		}
	}
	if (typeFind == "QuyenQuanTri") {
		if (!(stringFind == "admin" || stringFind == "user")) {
			alert("Quyền quản trị phải là: admin, user - 管理の権利は管理者、ユーザーです。");
			return false;
		}
	}
	return true;

}
/*
 * 
 * 
 * Kiểm tra form tìm kiếm
 */
function checkValidateSearch() {
	var typeFind = document.getElementById("typeFind").value;
	var stringFind = document.getElementById("stringFind").value;
	var lengthStringFind;
	if (typeFind == "IdTaiKhoan")
		lengthStringFind = 10;
	else if (typeFind == "HoTen")
		lengthStringFind = 30;
	else if (typeFind == "DiaChi")
		lengthStringFind = 50;
	else if (typeFind == "DienThoai")
		lengthStringFind = 11;
	else if (typeFind == "Email")
		lengthStringFind = 30;
	else if (typeFind == "TenTaiKhoan")
		lengthStringFind = 20;
	else if (typeFind == "QuyenQuanTri")
		lengthStringFind = 5;
	else
		lengthStringFind = 100;
	if (checkValidate(typeFind, stringFind, lengthStringFind)) {
		return true;
	}
	return false;

}
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
$('.number').change(function(){
	alert("message");
});