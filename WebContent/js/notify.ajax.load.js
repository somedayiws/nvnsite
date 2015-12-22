/**
 * Load notify count
 * Website jpvn.net somedayiws
 */
$(document).ready(function() {
		$.ajax({
			url : "CheckEmailServlet",
			type : "post",
			success : function(result) {
				$("#checkmail").html(result);
				$("#countMailSide").text($("#countMail").text());
			}
		});
		var refreshId = setInterval(function() {
			$.ajax({
				url : "CheckEmailServlet",
				type : "post",
				success : function(result) {
					$("#checkmail").html(result);
					$("#countMailSide").text($("#countMail").text());
				}
			});
		}, 30000);
	});