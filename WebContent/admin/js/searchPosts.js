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