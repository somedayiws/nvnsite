/*
 * 
 * Ghim bài viết lên trang chủ client
 * */	
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
				alert('Không thể thay đổi để ghim lên trang chủ - ホームページに固定することができない');
				$("#load").html("");
			}
		});
	}
