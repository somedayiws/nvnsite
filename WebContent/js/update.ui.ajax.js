/**
 * Load content ui with ajax sign in 
 * Redirect url
 * somedayiws@gmail.com 
 * jpvn.net
 */
function uiLogged() {
	if ($('#resultAjax #result #resultMessage').text().match("Thanhcong")) {
		$.ajax({
			url : "CheckEmailServlet",
			type : "post",
			success : function(result) {
				$("#checkmail").html(result);
				$("#countMailSide").text($("#countMail").text());
			}
		});
		$('#loiDangNhap')
				.html(
						"<div class='alert alert-success' role='alert'><p>Đăng nhập thành công!</p></div>");
		$('#wait-icon').removeAttr("style");
		setTimeout(function() {
			$('#headerTop #login #topmenu').html(
					$('#resultAjax #result #topmenu').html());
			$('#fix-post-news').html(
					$('#resultAjax #result #fix-post-news').html());
			$('#textdiv .col-sm-3').html(
					$('#resultAjax #result .col-sm-3 button'));
			$('#wait-icon').attr("style", "display: none;");
			$('#mdangnhap').modal('hide');
		}, 1500);

	} else {
		$('#loiDangNhap').html($('#resultAjax').html());
	}
}
function showSearchPanel(){
	if($('#seach').attr("class") == "collapse"){
		$('#seach').attr("style","display: none;");
		$('#seach').removeAttr("class");
	}else{
		$('#seach').attr("style","display: block;");
		$('#seach').attr("class","collapse");
	}
}
// Chuyển hướng đến danh muc x
function dichuyen(x) {
	window.location.href = x;
};
function loadData(trang, x) {
	window.location.href = trang + "?id=" + x;
};