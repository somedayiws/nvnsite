	$(document).ready(function() {	
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