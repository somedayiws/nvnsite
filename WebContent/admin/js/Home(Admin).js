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
	
	/**
	 * fix by Hai
	 * date:05 - 12 - 2015
	 * fix delete posts, send message to user
	 * */
$(document).ready(function(){
	$('#message_default').css("display","none");
});
function showMessageDefault(){
	if($("#rd_message").is(":checked")){
		$('#message_default').show();
	}
	else{
		$('#message_default').hide();
	}
}
function check_existMessage(){
		var message_input = $('#message_input').val();
		if(message_input.trim() == ""){
			if($("#rd_message").is(":checked")){
			return true;
		}
		else{
			alert("Bạn phải nhập tin nhắn hoặc chọn tin nhắn mặc định");
			return false;
		}
		}
	return true;
}