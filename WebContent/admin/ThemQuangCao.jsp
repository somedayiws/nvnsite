<%@page import="model.bean.QUANGCAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/advertisement.css">
<title>Thêm quảng cáo - 広告の追加</title>
<style type="text/css">
#advNoHomepage {
	display: none;
}
</style>
<script type="text/javascript">
	function view(){
		var page = $('#url').val();
		$("#xemUrl").attr('src', page);
	}
	function xem(f) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.getElementById("fu2");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
$(document).ready(function(){       	                           
        $( "#page" ).change(function() {
        	 var page = $('#page').val();
        	 if(page==1){
        		 $("#advHomepage").show();
        		 $("#advNoHomepage").hide();
        	 }
        	 else{
        		 $("#advHomepage").hide();
        		 $("#advNoHomepage").show();
        	 }
        });
       
        $( "#ChonUrl" ).change(function() {
       	 var page = $('#ChonUrl').val();
       	 if(page==1){
       		 $("#maytinh").show();
       		 $("#trenmang").hide();
       	 }
       	 else{
       		 $("#maytinh").hide();
       		 $("#trenmang").show();
       	 }
       });
        
     
	$("#formCreateAdv")
								.validate(
										{
											rules : {
												company : {
													required : true,
												},
												dienthoai : {
													required : true,
												},
												email : {
													required : true,
												},
												link : {
													required : true,
													url : true
												},
												page : {
													required : true,
												},
												positionInHome : {
													required : true,
												},
												positionInNoHome : {
													required : true,
												},
												date : {
													required : true,
													date : true
												},
												numberOfDay : {
													required : true,
													range : [ 1, 367 ]
												},
												Image : {
													required : true
												},
												price : {
													required : true,
												}
											},
											messages : {
												company : {
													required : "Phải nhập tên đơn vị quảng cáo - 広告の会社名・企業を入力しなければならない。",
												},
												dienthoai : {
													required : "Phải nhập số điện thoại liên hệ - 連絡取れる電話番号を入力しなければならない。",
												},
												email : {
													required : "Phải nhập email liên hệ - 連絡取れるメールアドレスを入力しなければならない。",
												},
												link : {
													required : "Phải nhập link quảng cáo - 広告のリンクを入力しなければならない。",
													url : "Link không hợp lệ - 無効なリンク"
												},
												page : {
													required : "Phải chọn trang hiển thị - 表示するページを選択しければならない。",
												},
												positionInHome : {
													required : "Phải chọn vị trí hiển thị trên trang chủ - ホームページに表示する場所を選択しなければならない。",
												},
												positionInNoHome : {
													required : "Phải chọn vị trí hiển thị trên các trang khác - 他のホームページに表示する場所を選択しなければならない。",
												},
												date : {
													required : "Phải nhập ngày đăng - 日付を入力しなければならない。",
													date : "Ngày không hợp lệ - 無効な日付"
												},
												numberOfDay : {
													required : "Phải nhập số ngày hiển thị - 表示する日程を入力しなければならない",
													range : "Số ngày trong khoảng từ 1 đến 366 - 日付は1-366です。"
												},
												Image : {
													required : "Phải chọn hình ảnh để hiển thị - 表示する画像を選択しなければならない。"
												},
												price : {
													required : "Phải nhập giá quảng cáo - 広告の価格を入力しなければならない。",
												}
											}
										});

					});
</script>
</head>
<%
	//Nhận danh sách quảng cáo
	ArrayList<QUANGCAO> advertisement =(ArrayList<QUANGCAO>)request.getAttribute("advertisement");

%>
<body>

	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>

		<form name="formCreateAdv" id="formCreateAdv"
			action="AddAdvertisementServlet" method="post"
			enctype="multipart/form-data">
			<div class="khungquangcao">
				<div class="khungTrai">
					<!-- Đơn vị quảng cáo -->
					<div class="form-group">
						<label for="company">Đơn vị/cá nhân quảng cáo - 広告の企業・個人</label> <input
							type="text" class="form-control" name="company" id="company"
							maxlength="200">
					</div>
					<div class="form-group">
						<label for="company">Điện thoại liên hệ - 連絡の電話番号</label> <input
							type="text" class="form-control" name="dienthoai" id="dienthoai"
							maxlength="200">
					</div>
					<div class="form-group">
						<label for="company">Email đơn vị/cá nhân - 企業・個人のメール</label> <input
							type="text" class="form-control" name="email" id="email"
							maxlength="200">
					</div>
					<!-- Liên kết -->
					<div class="form-group">
						<label for="link">Link quảng cáo - 広告のリンク</label> <input type="url"
							class="form-control" name="link" id="link">
					</div>
					<!-- Trang hiển thị -->
					<div class="form-group">
						<label for="page">Trang hiển thị - 表示のホームページ</label> <select
							class="form-control" id="page" name="page">
							<option value="1">Trang chủ - ホーム</option>
							<option value="2">Trang khác - 他のホームページ</option>
						</select>
					</div>
					<!-- Nếu là trang chủ thì có 7 vị trí, ngược lại là có 2 vị trí -->

					<!-- Vị trí -->
					<!-- Vị trí trang chủ  -->
					<div class="form-group" id="advHomepage">
						<label for="postion">Vị trí - 位置</label> <select
							class="form-control" id="positionInHome" name="positionInHome">
							<option value="1">vị trí 1 - 1の位置</option>
							<option value="2">vị trí 2 - 2の位置</option>
							<option value="3">vị trí 3 - 3の位置</option>
							<option value="4">vị trí 4 - 4の位置</option>
							<option value="5">vị trí 5 - 5の位置</option>
							<option value="6">vị trí 6 - 6の位置</option>
						</select>
					</div>
					<!-- Vị trí các trang khác -->
					<div class="form-group" id="advNoHomepage">
						<label for="postion">Vị trí - 位置</label> <select
							class="form-control" id="positionInNoHome"
							name="positionInNoHome">
							<option value="1">vị trí 1 - 1の位置</option>
							<option value="2">vị trí 2 - 2の位置</option>
						</select>
					</div>
				</div>
				<div class="khungphai">
					<!-- Số ngày -->
					<div class="form-group">
						<label>Số ngày hiển thị - 表示された日付の回数</label> <select class="form-control"
							id="size" name="numberOfDay">
							<option value="7">7 ngày (1 tuần) - 7日（1週間）</option>
							<option value="30">30 ngày (1 tháng) - 30日（1カ月）</option>
							<option value="90">90 ngày (3 tháng) - 90日（3カ月）</option>
							<option value="180">180 ngày (6 tháng)- 180日（6カ月）</option>
							<option value="365">365 ngày (1 năm) - 365日（1年間）</option>
						</select>
					</div>
					<!-- Giá quảng cáo -->
					<div class="form-group">
						<label for="price">Chi phí quảng cáo - 広告の経費</label> <input
							type="text" name="price" class="form-control" id="price">
					</div>
					<!-- Kích thước -->
					<div class="form-group">
						<label for="size">Nhập hình ảnh từ - 画像の貼り付け</label> <select
							class="form-control" id="ChonUrl" name="ChonUrl">
							<option value="1">Máy tính - パソコン</option>
							<option value="2">Url có sẵn - 既存のUrl</option>
						</select>
					</div>
					<!-- Hình ảnh -->
					<div class="form-group" id="maytinh">
						<label>Ảnh quảng cáo - 広告の画像 <input type="file" id="Image"
							name="Image" onchange="xem(this);" /></label>
						<p class="help-block">
							Chọn tập tin có đuôi là .png, .jpg, .gif, .jpeg<br> ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。 
							<img alt="Icon đại diện"
								src="../images/icondefault.png" id="fu2" height="150px">
						</p>
					</div>
					<div class="form-group" id="trenmang" style="display: none;">
						<label>Ảnh quảng cáo - 広告の画像</label> <input type="text" name="Image1"
							id="url" class="form-control" onblur="view();">
						<p class="help-block">
							Chọn tập tin có đuôi là .png, .jpg, .gif, .jpeg<br> ファイルの形式は.png, .jpg, .gif, .jpegを選択して下さい。 
							<img alt="Icon đại diện"
								src="../images/icondefault.png" id="xemUrl" height="150px">
						</p>
					</div>
					<button class="btn btn-primary btn-sm" type="submit" id="createAdv"
						name="createAdv">Thêm quảng cáo - 広告の追加</button>
					<button class="btn btn-primary btn-sm" onclick="history.go(-1);">Hủy
						- 削除する</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>