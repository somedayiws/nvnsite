<%@page import="model.bean.BAIVIET"%>
<%@page import="java.util.ArrayList"%>
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
<title>Danh sách bài viết</title>
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
		<marquee> Trang cộng tác viên VIET-NHAT - 越日協力者のホームページ </marquee>
	</p>
</div>
<!-- menu ngang -->
	<%@include file="files/menu.jsp" %>
	<!-- lấy dữ liệu -->
	<%
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		ArrayList<BAIVIET> listmoi = (ArrayList<BAIVIET>)request.getAttribute("listmoi");
		ArrayList<BAIVIET> listtre = (ArrayList<BAIVIET>)request.getAttribute("listtre");
	%>
	<!-- nội dung chính -->
	<div class="col-sm-2 col-md-2">
		<%@include file="files/thongke.jsp" %>
	</div>
	<div class="col-sm-10 col-md-10">
	<strong> <%= ((String)request.getAttribute("meg"))==null ? "" : ((String)request.getAttribute("meg")) %> </strong><br>
	<form action="XuLyBaiVietServlet" method="get">
		<button type="button" id="huy" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#huybai">Hủy bài - 削除</button>
		<button type="button" id="gui" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#guibai">Gửi bài - 送信</button>
		<!-- dialog xác nhận hủy -->
		<div class="modal fade" id="huybai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel">Hủy bài dịch</h4>
				      </div>
				      <div class="modal-body">
				        Những bài dịch sẽ được gửi với yêu cầu HỦY DỊCH lên Admin và điều sẽ ảnh hưởng xấu đến thành tích của bạn.
				        <br><label>Bạn thật sự muốn hủy bài dich?</label>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
				        <button type="submit" name="submit" value="huy" class="btn btn-primary">Có</button>
				      </div>
				    </div>
				  </div>
		</div>
		<!-- dialog xác nhận gửi -->
		<div class="modal fade" id="guibai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel">Gửi bài dịch</h4>
				      </div>
				      <div class="modal-body">
				        Các bài dịch sẽ được gửi lên Admin để kiểm duyệt.
						<br><label>Bạn muốn gửi?</label>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
				        <button type="submit" name="submit" value="gui" class="btn btn-primary">Có</button>
				      </div>
				    </div>
				  </div>
		</div>
		
		<label>Danh sách bài mới chuyển đến - 届いたばかり文書のリスト </label>
		<table class="table table-hover">
		  <tr id="tieude">
		  	<td class="clid">ID</td>
		  	<td class="cltde">Tiêu Đề - タイトル</td>
		  	<td class="clmta">Mô Tả - 概要</td>
		  	<td class="clx"><i class="fa fa-check-square"></i></td>
		  	<td class="clvd"></td>
		  </tr>
		  <%
		  		int i = 0;
		  		while(listmoi != null && i<listmoi.size()) {
		  			if(user != null && user.getNgonNgu().equals("vi")) {
		  %>
			  <tr class="noidung">
			  	<td><%= listmoi.get(i).getIdBaiViet() %></td>
			  	<td><%= listmoi.get(i).getTenBaiVietVi() %></td>
			  	<td><%= listmoi.get(i).getMoTaVi() %></td>
			  	<td><input type="checkbox" name="chon" value="<%= listmoi.get(i).getIdBaiViet() %>"></td>
			  	<td class="ctv-chon">
			  		<a href="XemBaiDichServlet?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem</i></a>
			  		- <a href="DichBaiDichServlet?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich</i></a>
			  	</td>
			  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= listmoi.get(i).getIdBaiViet() %></td>
					  	<td><%= listmoi.get(i).getTenBaiVietJa() %></td>
					  	<td><%= listmoi.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= listmoi.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="XemBaiDichServlet?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem</i></a>
					  		- <a href="DichBaiDichServlet?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich</i></a>
					  	</td>
					  </tr>
			  <% } %>
		  <% i++; } %>
		</table>
		<label>Danh sách bài dịch đã quá hạn - 期限が過ぎた文書のリスト </label>
		<table class="table table-hover">
		  <tr id="tieude">
		  	<td class="clid">ID</td>
		  	<td class="cltde">Tiêu Đề - タイトル</td>
		  	<td class="clmta">Mô Tả - 概要</td>
		  	<td class="clx"><i class="fa fa-check-square"></i></td>
		  	<td class="clvd"></td>
		  </tr>
		  <%
		  		i = 0;
		  		while(listtre != null && i<listtre.size()) {
		  			if(user != null && user.getNgonNgu().equals("vi")) {
		  %>
			  <tr class="noidung">
			  	<td><%= listtre.get(i).getIdBaiViet() %></td>
			  	<td><%= listtre.get(i).getTenBaiVietVi() %></td>
			  	<td><%= listtre.get(i).getMoTaVi() %></td>
			  	<td><input type="checkbox" name="chon" value="<%= listtre.get(i).getIdBaiViet() %>"></td>
			  	<td class="ctv-chon">
			  		<a href="XemBaiDichServlet?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem</i></a>
			  		- <a href="DichBaiDichServlet?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich</i></a>
			  	</td>
			  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= listtre.get(i).getIdBaiViet() %></td>
					  	<td><%= listtre.get(i).getTenBaiVietJa() %></td>
					  	<td><%= listtre.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= listtre.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="XemBaiDichServlet?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem</i></a>
					  		- <a href="DichBaiDichServlet?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich</i></a>
					  	</td>
					  </tr>
			  <% } %>
		  <% i++; } %>
		</table>
	</form>
	</div>
</body>
<!-- Validate -->
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#fdangnhap")
								.validate(
										{
											rules : {
												taikhoan : {
													required : true
												},
												matkhau : {
													required : true
												}
											},
											messages : {
												taikhoan : {
													required : "<br>Chưa nhập tên tài khoản"
												},
												matkhau : {
													required : "<br>Chưa nhập mật khẩu!"
												}
											},
											submitHandler : function(form) {
															form.submit();
											}
										});
					});
</script>
<!-- Phản hồi -->
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