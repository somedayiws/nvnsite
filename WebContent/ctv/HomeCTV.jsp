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
<title>Danh sách bài viết - 文書のリスト </title>
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
		
		<div class="xem">Tiến độ-進捗状況 : <%= request.getAttribute("tongbvok") %>%</div>
		<div class="xem1">Hủy bỏ-削除 : <%= request.getAttribute("tongbvhuy") %>%</div>
		<div class="xem2">Bài lỗi-エラーの記事: <%= request.getAttribute("tongbvloi") %></div>
		
	</div>
	<div class="col-sm-10 col-md-10">
	<strong> <%= ((String)request.getAttribute("meg"))==null ? "" : ((String)request.getAttribute("meg")) %> </strong><br>
	<form action="Gui-bai-dich" method="post">
		<button type="button" id="huy" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#huybai">Hủy bài - 削除</button>
		<button type="button" id="gui" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#guibai">Gửi bài - 送信</button>
		<!-- dialog xác nhận hủy -->
		<div class="modal fade" id="huybai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Quay lại - 戻り</span></button>
				        <h4 class="modal-title" id="myModalLabel">Hủy bài dịch-翻訳の記事を削除うする</h4>
				      </div>
				      <div class="modal-body">
				        Vì trường hợp  hủy bài dịch sẽ ảnh hưởng xấu đến thành tích của bạn. Bạn có thật sự muốn hủy bài dịch này không?
				        <br>翻訳の記事がキャンセルされた場合は悪い評価が付けられるため、本当に翻訳の記事をキャンセルしたいですか？
				        <br><strong>Bạn thật sự muốn hủy bài dich?<br>あなたは本当に翻訳の記事をキャンセルしたいですか？</strong>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Không-いいえ</button>
				        <button type="submit" name="submit" value="huy" class="btn btn-primary">Có-はい</button>
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
				        <h4 class="modal-title" id="myModalLabel">Gửi bài dịch-記事を送信する</h4>
				      </div>
				      <div class="modal-body">
				        Các bài dịch sẽ được gửi lên Admin để kiểm duyệt.<br>翻訳の記事は管理者がチェックされる。
						<br><label>Bạn muốn gửi?<br>本当に送信したい？</label>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Không-いいえ</button>
				        <button type="submit" name="submit" value="gui" class="btn btn-primary">Có-はい</button>
				      </div>
				    </div>
				  </div>
		</div>
		
		<label>Danh sách bài mới chuyển đến - 届いたばかり文書のリスト </label>
		<table class="table table-hover">
		  <tr id="tieude">
		  	<td class="clid">ID</td>
		  	<td class="cltde">Tiêu Đề - タイトル</td>
		  	<td class="clmta">Mô Tả - 説明</td>
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
			  		<a href="Xem-bai-dich?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  	<a href="Dich-bai?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
			  	</td>
			  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= listmoi.get(i).getIdBaiViet() %></td>
					  	<td><%= listmoi.get(i).getTenBaiVietJa() %></td>
					  	<td><%= listmoi.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= listmoi.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="Xem-bai-dich?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  			<a href="Dich-bai?id=<%= listmoi.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
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
		  	<td class="clmta">Mô Tả - 説明</td>
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
			  		<a href="Xem-bai-dich?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  	<a href="Dich-bai?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
			  	</td>
			  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= listtre.get(i).getIdBaiViet() %></td>
					  	<td><%= listtre.get(i).getTenBaiVietJa() %></td>
					  	<td><%= listtre.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= listtre.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="Xem-bai-dich?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  			<a href="Dich-bai?id=<%= listtre.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
					  	</td>
					  </tr>
			  <% } %>
		  <% i++; } %>
		</table>
	</form>
	</div>
</body>
</html>