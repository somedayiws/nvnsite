/*
 * 
 * Ghim bài viết lên trang chủ client
 * */	
function changeBookmark(idPost){
			$.ajax({
				url : "BookmarkInHomeServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					id 	: idPost
				}, //dữ liệu gửi
				async : true, //
				success : function(res) {
					if(res.indexOf("tối đa") > -1)
					{
						$("#resultMessage").html(res);
					}
					else{
						$("#resultMessage_"+idPost).html(res);
					}
														
				},
				error : function() {
					alert('Không thể ghim lên trang chủ - ');
					$("#load").html("");
				}
			});	    
	}
