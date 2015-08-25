<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.lazyload.js"></script>
<title>Danh mục bài viết</title>
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="css/ClientStyle.css">
<title>Demo CSS all thiết bị</title>
</head>
<body>
	<div class="khung">
		<p class="tb1 ancainay">max-width: 320px (điện thoại di động, hiển thị chiều dọc)</p>
		<p class="tb3 ancainay">max-width: 600px (máy tính bảng, hiển thị chiều dọc)</p>
		<p class="tb5">max-width: 768px (máy tính bảng loại to, hiển thị chiều dọc)</p>
		
		<p class="tb2 ancainay">max-width: 480px (điện thoại di động, hiển thị chiều ngang)</p>
		<p class="tb4 ancainay">max-width: 800px (máy tính bảng, hiển thị chiều ngang)</p>
		<p class="tb6 ancainay">max-width: 1024px (máy tính bảng loại to, hiển thị chiều ngang)</p>
		
		<p class="tb7 ancainay">min-width: 1025px (từ size này trở lên là danh cho desktop thông thường).</p>
	</div>

	<div id="wrapper_carousel" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="BaiVietServlet?id=" class="thongtinthem">
						<embed src="images/baiviet.jpg">
						<strong>Tác giả : Ho Viet Nhan</strong><br>
						<em>
						Ngày : 20-08-2015<br>
						View : 1024
						</em>
					</a>
					<div class="motabai">
						<a href="BaiVietServlet?id=">
						Tên bài viết tiếng việt <br> 
						 Tên bài viết tiếng nhật
						</a>
						<p>
						 Mô tả cho nó này bạn
							<br>
							Mô tả cho nó này bạn
						<a href="BaiVietServlet?id=" class="xemthem">Xem thêm ...</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="BaiVietServlet?id=" class="thongtinthem">
						<embed src="images/baiviet.jpg">
						<strong>Tác giả : Ho Viet Nhan</strong><br>
						<em>
						Ngày : 20-08-2015<br>
						View : 1024
						</em>
					</a>
					<div class="motabai">
						<a href="BaiVietServlet?id=">
						Tên bài viết tiếng việt <br> 
						 Tên bài viết tiếng nhật
						</a>
						<p>
						 Mô tả cho nó này bạn
							<br>
							Mô tả cho nó này bạn
						<a href="BaiVietServlet?id=" class="xemthem">Xem thêm ...</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="BaiVietServlet?id=" class="thongtinthem">
						<embed src="images/baiviet.jpg">
						<strong>Tác giả : Ho Viet Nhan</strong><br>
						<em>
						Ngày : 20-08-2015<br>
						View : 1024
						</em>
					</a>
					<div class="motabai">
						<a href="BaiVietServlet?id=">
						Tên bài viết tiếng việt <br> 
						 Tên bài viết tiếng nhật
						</a>
						<p>
						 Mô tả cho nó này bạn
							<br>
							Mô tả cho nó này bạn
						<a href="BaiVietServlet?id=" class="xemthem">Xem thêm ...</a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="baivieti col-xs-12 col-sm-12 col-md-12">
					<a href="BaiVietServlet?id=" class="thongtinthem">
						<embed src="images/baiviet.jpg">
						<strong>Tác giả : Ho Viet Nhan</strong><br>
						<em>
						Ngày : 20-08-2015<br>
						View : 1024
						</em>
					</a>
					<div class="motabai">
						<a href="BaiVietServlet?id=">
						Tên bài viết tiếng việt <br> 
						 Tên bài viết tiếng nhật
						</a>
						<p>
						 Mô tả cho nó này bạn
							<br>
							Mô tả cho nó này bạn
						<a href="BaiVietServlet?id=" class="xemthem">Xem thêm ...</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <ol class="carousel-indicators">
		<li data-target="#wrapper_carousel" data-slide-to="0" class="active"></li>
		<li data-target="#wrapper_carousel" data-slide-to="1"></li>
		<li data-target="#wrapper_carousel" data-slide-to="2"></li>
		<li data-target="#wrapper_carousel" data-slide-to="3"></li>
	</ol> -->

	<a class="left carousel-control" href="#wrapper_carousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#wrapper_carousel"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</body>
</html>