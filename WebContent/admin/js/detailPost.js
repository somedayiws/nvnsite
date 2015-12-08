	$(document).ready(function() {	
		/**
		 * fix by Hai
		 * date:05 - 12 - 2015
		 * fix delete posts, send message to user
		 * */
		$('#message_default').css("display","none");
	$(".idAcc").click(function(){
		$("#message").slideToggle(1000);
		});
		
	
			
			$("#btnVi").click(function(){
				$("#ContentVi").css("width","100%")
				$("#ContentJa").hide();
				$("#btnVi").hide();
				$("#btnbackVi").show();
				})
			$("#btnbackVi").click(function(){
				$("#ContentVi").css("width","50%")
				$("#ContentJa").show(500);
				$("#btnVi").show();
				$("#btnbackVi").hide();
				})
			$("#btnJa").click(function(){
				$("#ContentJa").css("width","100%")
				$("#ContentVi").hide();
				$("#btnJa").hide();
				$("#btnbackJa").show();
				})
			$("#btnbackJa").click(function(){
				$("#ContentVi").show(500);		
				$("#ContentJa").css("width","50%")		
				$("#btnJa").show();
				$("#btnbackJa").hide();
				})
		
	});
	$(".removeIcon").click(function(){	
		$.ajax({
			url : "RemoveCommentSetvlet", //file 
			type : "POST", //phuong thức gưi
			data : {
				id 	: this.id					
			}, //dữ liệu gửi
			async : true, //
			success : function(res) {	
				$("#resultMessage").html(res);
				alert($("#resultMessage").children("#result").text());	
				window.location = "ShowDetailPostsServlet?id=<%=posts.getIdBaiViet()%>"
			},
			error : function() {
				alert('Có lỗi xảy ra - エラが発生した');
				$("#load").html("");
			}
		});	
});

	/**
	 * fix by Hai
	 * date:05 - 12 - 2015
	 * fix delete posts, send message to user
	 * */
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