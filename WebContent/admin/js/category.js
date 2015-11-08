function xem(f,x){
	var reader = new FileReader();
	reader.onload = function (e) {
		var img = document.getElementById(x);
		img.src = e.target.result;
		img.style.display = "inline";
	};
	reader.readAsDataURL(f.files[0]);
}

function check_Image(){
	 var test_value = $(".Image").val();	
	  var extension = test_value.split('.').pop().toLowerCase();
		 
	    if ($.inArray(extension, ['png', 'gif', 'jpeg', 'jpg']) == -1) {
	      alert("File ảnh không hợp lệ!");
	      return false;
	    } else {
	      return true;
	    }
}	

	/*---------------Check validate form Insert---------------*/
	function checkValidFormInsert() {		
		var nameCategoryVi = document.getElementById("nameCategoryVi").value;
		var nameCategoryJa = document.getElementById("nameCategoryJa").value;
				
		var c_value = 0;
		
		
		//Kiểm tra định dạng ảnh
		
			    var test_value = $("#Image").val();
			    var extension = test_value.split('.').pop().toLowerCase();
			 
			    
			 
			
			
			
		if (nameCategoryVi == "" || nameCategoryJa == "") {

			alert("Bạn phải nhập tên danh mục(vừa tiếng việt vừa tiếng nhật) - 項目を必ず入力下さい（日本語とベトナム語）");
			return false;
		}
		for (var i = 0; i < document.formcreateCategory.display.length; i++) {
			if (document.formcreateCategory.display[i].checked) {
				c_value = 1;
			}
		}
		if (c_value == 0) {
			alert("Bạn phải chọn có hiển thị lên trang chủ hay không - ホームに表示するかどうかを必ず選択して下さい。");
			return false;
		} 
		if ($.inArray(extension, ['png', 'gif', 'jpeg', 'jpg']) == -1) {
		      alert("File ảnh không hợp lệ!");
		      return false;
		 } 
		return true;
	}
	/*------------------End check form insert---------------------*/
	/*----------------- Check validate form Search --------------*/
	//Check validate
	function checkValidate(typeFind, stringFind, lengthStringFind) {
		if (stringFind == "") {
			alert("Bạn phải nhập từ cần tìm - 検索したい言葉を入力下さい。");
			return false;
		}
		if (stringFind.length > lengthStringFind) {
			alert(typeFind + " tối đa " + lengthStringFind + " ký tự");
			return false;
		}
		if (typeFind == "HienThi") {
			if (!(stringFind == "1" || stringFind == "0")) {
				alert(stringFind);
				alert("Bạn phải nhập số 1(hiển thị) hoặc 0(không hiển thị) - 1を入力下さい（掲載）又０（掲載しない");
				return false;
			}
		}
		return true;
	}

	//Check form Search
	function checkValidateSearch() {
		var typeFind = document.getElementById("typeFind").value;
		var stringFind = document.getElementById("stringFind").value;
		var lengthStringFind;
		if (typeFind == "IdDanhMuc")
			lengthStringFind = 10;
		else if (typeFind == "TenDanhMucVi")
			lengthStringFind = 300;
		else if (typeFind == "TenDanhMucJa")
			lengthStringFind = 50;
		else if (typeFind == "HienThi")
			lengthStringFind = 10;
		else
			lengthStringFind = 100;
		if (checkValidate(typeFind, stringFind, lengthStringFind)) {
			return true;
		}
		return false;

	}
	/*----------------- End check validate form Search -----------*/
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip(); 
	});