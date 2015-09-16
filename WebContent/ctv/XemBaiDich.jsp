<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Thư viện cho menu -->
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.0.min.js"></script>
<script src="../js/jquery.lazyload.js"></script>
<title>Xem bài dịch</title>
<!--auto combobox -->
<script src="../js/magicsuggest-min.js"></script>
<link rel="stylesheet" href="css/CongtacvienStyle.css">
<link rel="stylesheet" href="../font-awesome-4.4.0/css/font-awesome.min.css">
<!-- load thống kê -->
<script src="js/JavaScrip.js"></script>
<!-- kết thúc -->
</head>
<body>
<div class="container">
	<p>
		<marquee> Trang cộng tác viên VIET-NHAT</marquee>
	</p>
</div>
	<!-- menu ngang -->
	<%@include file="files/menu.jsp" %>
	<!-- dữ liệu -->
	<% 
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		BAIVIET bviet = (BAIVIET)request.getAttribute("baiviet");
	%>
	<!-- nội dung chính -->
	<div class="col-sm-2 col-md-2">
		<%@include file="files/thongke.jsp" %>
		<strong id="tke"><i class="fa fa-info-circle"></i> Thông tin</strong>
		<div class="info">
			<label>Mã bài viết : <%= bviet.getIdBaiViet() %></label>
			<label>Tình trạng : <%= request.getAttribute("TinhTrang") %></label>
			<label>Ngày gửi : <%= request.getAttribute("NgayGui") %></label>
		</div>
	</div>
	<div class="col-sm-10 col-md-10">
		<input type="hidden" id="iduser" name="iduser" value="<%= user.getIdTaiKhoan() %>">
		<!-- ngôn ngữ chính của ctv là tiếng việt -->
		<% if(user.getNgonNgu().equals("Viet")) { %>
			<% if(bviet.getTrangThai().equals("ChuyenDich")) { %>
			<div class="col-xs-12 col-sm-12 col-md-12">
					<label>Tiêu đề - タイトル</label>
					<p><%= bviet.getTenBaiVietVi() %></p>
					<label>Mô tả - 概要</label>
					<p><%= bviet.getMoTaVi() %>"></p>
					<label>Nội dung - 内容</label>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			<% } else { %>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề - タイトル</strong>
					<p><%= bviet.getTenBaiVietVi() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề - タイトル</strong>
					<p><%= bviet.getTenBaiVietJa() %></p>
			</div>
			</div>
			<div class="row cot2">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả - 概要</strong>
					<p><%= bviet.getMoTaVi() %>"></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả - 概要</strong>
					<p><%= bviet.getMoTaJa() %></p>
			</div>
			</div>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung - 内容</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung - 内容</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</p>
			</div>
			</div>
			<% } %>
		<% } else { %>
		<!-- ngôn ngữ chính là tiếng nhật -->
			<% if(bviet.getTrangThai().equals("ChuyenDich")) { %>
			<div class="col-xs-12 col-sm-12 col-md-12">
					<label>Tiêu đề - タイトル</label>
					<p><%= bviet.getTenBaiVietJa() %></p>
					<label>Mô tả - 概要</label>
					<p><%= bviet.getMoTaJa() %></p>
					<label>Nội dung - 内容</label>
					<p id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</p>
			</div>
			<% } else { %>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề - タイトル</strong>
					<p><%= bviet.getTenBaiVietJa() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề - タイトル</strong>
					<p><%= bviet.getTenBaiVietVi() %></p>
			</div>
			</div>
			<div class="row cot2">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả - 概要</strong>
					<p><%= bviet.getMoTaJa() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả - 概要</strong>
					<p><%= bviet.getMoTaVi() %>"></p>
			</div>
			</div>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung - 内容</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung - 内容</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			</div>
			<% } %>
		<% } %>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<strong> Phản hồi bài dịch </strong>
			<div class="row" id="listblviet">
				<%= bviet.getGhiChu()==null ? "" : bviet.getGhiChu().replace("<strong>"+user.getIdTaiKhoan(), "<strong>Tôi") %>
			</div>
			<div class="row">
				<textarea rows="3" placeholder="Bình luận của bạn" class="form-control" id="txtviet"></textarea>
			</div>
			<div class="row" id="tuychonviet">
				<button type="button" class="btn btn-link" onclick="comentvi('<%= bviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
				<form action="XuLyBaiVietServlet" method="post">
					<input type="hidden" name="chon" value="<%= bviet.getIdBaiViet() %>">
					<button type="button" class="btn btn-primary btn-sm" id="lui" name="submit" value="lui" onclick="history.go(-1);">Quay lại</button>
					<button type="submit" class="btn btn-warning btn-sm" id="huy" name="submit" value="huy" onclick="return confirm('Bài dịch sẽ được gửi với yêu cầu HỦY DỊCH lên Admin và điều sẽ ảnh hưởng xấu đến thành tích của bạn.\n\t Bạn thật sự muốn hủy bài dich?');">Hủy bài</button>
			<button type="submit" class="btn btn-primary btn-sm" id="gui" name="submit" value="gui" onclick="return confirm('Bài dịch sẽ được gửi lên Admin để kiểm duyệt.\n\tBạn muốn gửi?');">Gửi bài</button>
					<button type="button" class="btn btn-primary btn-sm" id="luu" onclick="loadData('DichBaiDichServlet','<%= bviet.getIdBaiViet() %>');">Dịch bài - </button>
				</form>
			</div>
		</div>
	</div>
</body>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x){
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x){
		window.location.href = x;
	};
	function comentvi(id){
		var txt = $("#txtviet").val();
		if(txt != ""){
			var htm = "<strong>Tôi</strong> <p>"+txt+"</p>";
			$("#listblviet").append(htm);
			$("#txtviet").val("");
			updatedatavi(id, htm.replace("Tôi", $("#iduser").val()));
		}else{
			alert("Bạn chưa nhập bình luận của mình.");
		}
		$("#txtviet").val("");
	};
	function updatedatavi(id, bluan){
		$.ajax({
			url : "UpDatePhanHoiServlet", //file 
			type : "POST", //phuong thức gưi
			data : {
				id: id,
				bluan: bluan
			}, //dữ liệu gửi
			async : true
		});
	};
</script>
<!-- Hộp thoại phản hồi -->
<script lang="javascript">
	(function() {
		var _h1 = document.getElementsByTagName('title')[0] || false;
		var product_name = '';
		if (_h1) {
			product_name = _h1.textContent || _h1.innerText;
		}
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=57f198fbced364bace74f3bb8ff5a8e4&data=eyJzc29faWQiOjMwNjkyNzMsImhhc2giOiIzM2NiZTM2NWE5MDY2MmUyZjM5NGI5MWJkNDJjNzRjMiJ9&pname='
				+ product_name;
		var s = document.getElementsByTagName('script');
		s[0].parentNode.insertBefore(ga, s[0]);
	})();
</script>
</html>