/**
 * Load comment post ajax somedayiws@gmail.com Website jpvn.net
 */
function loadBinhLuan(id, ngonngu) {
	if (ngonngu == 'vi') {
		var nvitri = $("#listblviet").children().size();
		$.ajax({
			url : "DataBinhLuanServlet", // file
			type : "POST", // phuong thức gưi
			data : {
				idbaiviet : id,
				ngonngu : ngonngu,
				vitri : nvitri
			},// dữ liệu gửi
			async : true, //
			success : function(res) {
				$("#listblviet").append(res);
			},
			error : function() {
				alert('Có lỗi xảy ra - エラが発生した。!');
			}
		});
	} else {
		var nvitri = $("#listblnhat").children().size();
		$.ajax({
			url : "DataBinhLuanServlet", // file
			type : "POST", // phuong thức gưi
			data : {
				idbaiviet : id,
				ngonngu : ngonngu,
				vitri : nvitri
			},// dữ liệu gửi
			async : true, //
			success : function(res) {
				$("#listblnhat").append(res);
			},
			error : function() {
				alert('Có lỗi xảy ra - エラが発生した。!');
			}
		});
	}
}
function comentvi(id) {
	var bien = $("#tkDangNhap").val();
	var date = $("#dateComment").val();
	if (bien == 'null') {
		alert("Bạn phải đăng nhập, mới được bình luận.\nログインをしないと、コメントをすることができい。");
		$('#mdangnhap').modal('toggle');
	} else {
		var txt = $("#txtviet").val();
		if (txt != "") {
			var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
					+ bien + "</em> <span id='dateComment'>" + date
					+ "</span> <p>" + txt + "</p></div>";
			$("#listblviet").prepend(htm);
			$("#txtviet").val("");
			updatedatavi(id, 'vi', txt);
		} else {
			alert("Bạn chưa nhập bình luận của mình.\nあなたはコメントをまだ入力しない。");
		}
	}
};
function comentja(id) {
	var bien = $("#tkDangNhap").val();
	var date = $("#dateComment").val();
	if (bien == 'null') {
		alert("Bạn phải đăng nhập, mới được bình luận.\nログインをしないと、コメントをすることができい。");
		$('#mdangnhap').modal('toggle');
	} else {
		var txt = $("#txtnhat").val();
		if (txt != "") {
			var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
					+ bien + "</em> <span id='dateComment'>" + date
					+ "</span> <p>" + txt + "</p></div>";
			$("#listblnhat").prepend(htm);
			$("#txtnhat").val("");
			updatedatavi(id, 'ja', txt);
		} else {
			alert("Bạn chưa nhập bình luận của mình.\nあなたはコメントをまだ入力しない。");
		}
	}
};
function updatedatavi(id, laguage, bluan) {
	$.ajax({
		url : "UpDateDataBinhLuan", // file
		type : "POST", // phuong thức gưi
		data : {
			idbaiviet : id,
			ngonngu : laguage,
			binhluan : bluan
		}, // dữ liệu gửi
		async : true
	});
};