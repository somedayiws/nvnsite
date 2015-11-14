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
<title>Danh sách bài viết - 文書のリスト</title>
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
		ArrayList<BAIVIET> list = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
		String tbao = request.getParameter("xuly");
		if(tbao!=null && tbao.equals("luu-thanhcong")) tbao = "<div class='alert alert-success' role='alert'>Lưu bài dịch thành công.<br>翻訳の記事が保存できた。</div>";
		else if(tbao!=null && tbao.equals("gui-thanhcong")) tbao = "<div class='alert alert-success' role='alert'>Gửi bài dịch thành công.<br>翻訳の記事が送信できた。</div>";
		else if(tbao!=null && tbao.equals("huy-thanhcong")) tbao = "<div class='alert alert-success' role='alert'>Hủy bài dịch thành công.<br>翻訳の記事が削除できた。</div>";
		else if(tbao!=null && tbao.equals("luu-thatbai")) tbao = "<div class='alert alert-danger' role='alert'>Lưu bài dịch thất bại.<br>翻訳の記事が保存できない。</div>";
		else if(tbao!=null && tbao.equals("gui-thatbai")) tbao = "<div class='alert alert-danger' role='alert'>Gửi bài dịch thất bại.<br>翻訳の記事が送信できない。</div>";
		else if(tbao!=null && tbao.equals("huy-thatbai")) tbao = "<div class='alert alert-danger' role='alert'>Hủy bài dịch thất bại.<br>翻訳の記事が削除できない。</div>";
	%>
	<!-- nội dung chính -->
	<div class="col-sm-2 col-md-2">
		<%@include file="files/thongke.jsp" %>
		
		<div class="xem">Tiến độ-進捗状況 : <%= request.getAttribute("tongbvok") %>%</div>
		<div class="xem1">Hủy bỏ-削除 : <%= request.getAttribute("tongbvhuy") %>%</div>
		<div class="xem2">Bài lỗi-エラーの記事 : <%= request.getAttribute("tongbvloi") %></div>
		
	</div>
	<div class="col-sm-10 col-md-10">
	
	<%= ((String)request.getAttribute("meg"))==null ? "" : ((String)request.getAttribute("meg")) %>
	
	<%= (tbao == null || tbao.equals("")) ? "" : tbao %>
	<form action="Gui-bai-dich" method="post">
		<label>Danh sách bài viết - 文書のリスト</label>
		<table class="table table-hover dulieu">
		  <tr id="tieude">
		  	<td class="clid">ID</td>
		  	<td class="cltde">Tiêu Đề - タイトル</td>
		  	<td class="clmta">Mô Tả - 説明</td>
		  	<td class="clx"><i class="fa fa-check-square"></i></td>
		  	<td class="clvd"></td>
		  </tr>
		  <%
		  		int i = 0;
		  		while(list != null && i<list.size()) {
		  			if(user != null && user.getNgonNgu().equals("vi")) {
		  %>
				  <tr class="noidung">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  	</td>
				  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= list.get(i).getIdBaiViet() %></td>
					  	<td><%= list.get(i).getTenBaiVietJa() %></td>
					  	<td><%= list.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  			<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
					  	</td>
					  </tr>
			  <% } %>
		  <% 
		  		i++; } 
		  %>
		</table>
		
		<div class="menuPhanTrang">
			<%= request.getAttribute("pageNav") %>
		</div>
		
		<button type="button" id="huy" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#huybai">Hủy bài - 削除</button>
		<button type="button" id="gui" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#guibai">Gửi bài - 送信</button>
		<!-- dialog xác nhận hủy -->
		<div class="modal fade" id="huybai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
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
	</form>
	</div>
</body>
</html>