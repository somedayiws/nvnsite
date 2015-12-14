/**
 * Load content ui with ajax sign in somedayiws@gmail.com jpvn.net
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