<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "CheckDataBaiViet",
			type : "post",
			success : function(result) {
				$("#baicanxem").html(result);
			}
		});
		var refreshId = setInterval(function() {
			$.ajax({
				url : "CheckDataBaiViet",
				type : "post",
				success : function(result) {
					$("#baicanxem").html(result);
				}
			});
		}, 300000);
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12" id="divheader">	
					
<!--  					<a href="ShowHomeServlet"><img class="img-responsive" -->
<!--  				alt="Logo Việt - Nhật" src="../images/logo_VN.jpg" width="100%" height="100px"></a>				 -->
						
					<h1 style="">
						CỔNG THÔNG TIN VIỆT - NHẬT<br>日越ビジネス情報の窓口 
					</h1>
					
			</div>
			<div id="baicanxem">
			</div>
		</div>
	</div>
</body>
</html>