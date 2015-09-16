$(document).ready(function(){
	$("#language").css("display","none");	
});
function change(value){
	if(value == "CTV"){
		$("#language").slideDown(500);
	}
	else{
		$("#language").slideUp(500);
	}
}