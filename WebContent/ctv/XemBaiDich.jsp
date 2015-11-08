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
<title>Xem bài dịch - 翻訳の記事を読む</title>
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
			<label>ID : <%= bviet.getIdBaiViet() %></label>
			<label><i class="fa fa-file-text-o"></i> : <%= request.getAttribute("TinhTrang") %></label>
			<label><i class="fa fa-calendar"></i> : <%= request.getAttribute("NgayGui") %></label>
		</div>
	</div>
	<div class="col-sm-10 col-md-10">
		<div class="title-page">
			Chi tiết bài viết - 詳細な記事
		</div>
		<input type="hidden" id="iduser" name="iduser" value="<%= user.getIdTaiKhoan() %>">
		<!-- ngôn ngữ chính của ctv là tiếng việt -->
		<% if(user.getNgonNgu().equals("vi")) { %>
			<% if(bviet.getTrangThai().equals("ChuyenDich")) { %>
			<div class="col-xs-12 col-sm-12 col-md-12">
					<label>Tiêu đề - タイトル</label>
					<p><%= bviet.getTenBaiVietVi() %></p>
					<label>Mô tả - 説明</label>
					<p><%= bviet.getMoTaVi() %>"></p>
					<label>Nội dung - 内容</label>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			<% } else { %>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề</strong>
					<p><%= bviet.getTenBaiVietVi() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>タイトル</strong>
					<p><%= bviet.getTenBaiVietJa() %></p>
			</div>
			</div>
			<div class="row cot2">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả</strong>
					<p><%= bviet.getMoTaVi() %>"></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>説明</strong>
					<p><%= bviet.getMoTaJa() %></p>
			</div>
			</div>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>内容</strong>
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
					<label>Mô tả - 説明</label>
					<p><%= bviet.getMoTaJa() %></p>
					<label>Nội dung - 内容</label>
					<p id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</p>
			</div>
			<% } else { %>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>タイトル</strong>
					<p><%= bviet.getTenBaiVietJa() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Tiêu đề</strong>
					<p><%= bviet.getTenBaiVietVi() %></p>
			</div>
			</div>
			<div class="row cot2">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>説明</strong>
					<p><%= bviet.getMoTaJa() %></p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Mô tả</strong>
					<p><%= bviet.getMoTaVi() %></p>
			</div>
			</div>
			<div class="row cot1">
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>内容</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungJa() %>
					</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
					<strong>Nội dung</strong>
					<p id="ndviet">
						<%= bviet.getNoiDungVi() %>
					</p>
			</div>
			</div>
			<% } %>
		<% } %>
		<div class="col-xs-12 col-sm-12 col-md-12 khungbinhluan">
			<strong> Phản hồi bài dịch - 翻訳文書の返事 </strong>
			<div class="row" id="listblviet">
				<%= bviet.getGhiChu()==null ? "" : bviet.getGhiChu().replace("<strong>"+user.getIdTaiKhoan(), "<strong>Tôi") %>
			</div>
			<div class="row">
				<textarea rows="3" placeholder="Bình luận của bạn - あなたのコメントです" class="form-control" id="txtviet"></textarea>
			</div>
			<div class="row" id="tuychonviet">
				<button type="button" class="btn btn-link" onclick="comentvi('<%= bviet.getIdBaiViet() %>');"><i class="fa fa-comments-o"></i> Bình luận - コメント</button>
				<form action="Gui-bai-dich" method="post">
					<input type="hidden" name="chon" value="<%= bviet.getIdBaiViet() %>">
					<button type="button" class="btn btn-primary btn-sm" id="lui" name="submit" value="lui" onclick="history.go(-1);">Quay lại - 戻り</button>
					<button type="button" id="huy" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#huybai">Hủy bài - 削除</button>
					<button type="button" id="gui" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#guibai">Gửi bài - 送信</button>
					<button type="button" class="btn btn-primary btn-sm" id="luu" onclick="loadData('Dich-bai','<%= bviet.getIdBaiViet() %>');">Dịch bài - 翻訳の文書 </button>
				
					<!-- dialog xác nhận hủy -->
					<div class="modal fade" id="huybai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-exclamation-triangle"></i> Hủy bài dịch - 翻訳の記事を削除うする。</h4>
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
							        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Quay lại - 戻り</span></button>
							        <h4 class="modal-title" id="myModalLabel">Gửi bài dịch - 記事を送信する。</h4>
							      </div>
							      <div class="modal-body">
							        Các bài dịch sẽ được gửi lên Admin để kiểm duyệt.<br>翻訳の記事は管理者がチェックされる。
									<br><strong>Bạn muốn gửi(本当に送信したい)?</strong>
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
			alert("Bạn chưa nhập bình luận của mình.\nコメントをまだ記入しない。");
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