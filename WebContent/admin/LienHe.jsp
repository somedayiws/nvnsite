<%@page import="model.bean.LIENHE"%>
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
<title>Quản lý phản hồi - </title>
<style type="text/css">
#advNoHomepage {
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#suathongbao").validate({
			rules : {
				tieude : {
					required : true
				},
				traloi : {
					required : true
				}
			},
			messages : {
				tieude : {
					required : "タイトルをまだ入力しない<br>Chưa nhập tiêu đề!"
				},
				traloi : {
					required : "内容をまだ入力しない<br>Chưa nhập nội dung!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Danh sách bài đã đăng */
		ArrayList<LIENHE> list = (ArrayList<LIENHE>)request.getAttribute("list");
		/* Thông báo báo lỗi */
		String hthi = request.getParameter("xuly");
		if(hthi!=null && hthi.equals("traloi-thanhcong")) hthi = "<div class='alert alert-success' role='alert'>Trả lời phản hồi thành công.</div>";
		else if(hthi!=null && hthi.equals("traloi-thatbai")) hthi = "<div class='alert alert-danger' role='alert'>Trả lời phản hồi thất bại.</div>";
		else if(hthi!=null && hthi.equals("xoa-thanhcong")) hthi = "<div class='alert alert-success' role='alert'>Xóa phản hồi thành công.</div>";
		else if(hthi!=null && hthi.equals("xoa-thatbai")) hthi = "<div class='alert alert-danger' role='alert'>Xóa phản hồi thất bại.</div>";
		else if(hthi!=null && hthi.equals("loi-he-thong")) hthi = "<div class='alert alert-danger' role='alert'>Lỗi hệ thống. Vui lòng reset lại trang(Ctrl+F5).<br>システムのエラです。ホームページを改めてリセットして下さい(Ctrl+F5)。</div>";
	%>

	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<form action="LienHeServlet" id="ftimkiem">
			<div class="col-md-3 col-md-offset-1">
				<select name="timtheo" class="form-control">
					<option value="1">Tất cả - 全て</option>
					<option value="2">Id</option>
					<option value="3">Người gửi - </option>
					<option value="4">Nội dung phản hồi - </option>
				</select>
			</div>
			<div class="col-md-6">
				<input type="text" name="txtFind" class="form-control"
					placeholder="Nội dung cần tìm - 知りたい内容です。">
			</div>
			<input type="submit" value="Tìm kiếm - 検索" class="btn btn-primary">
		</form>
		<%= (hthi!=null && hthi.equals("")) ? hthi : "" %>
		<!-------------------- Nội dung quản lý quảng cáo ------------------------>
		<div id="content">
			<!--------------------------- Hiển thị danh sách các quảng cáo trong cơ sở dữ liệu ------------------->
			<%=request.getAttribute("mes")==null ? "" : request.getAttribute("mes")%>
			<div class="col-md-10 col-md-offset-2 panel panel-primary quangcao">
				<div class="panel-heading">Danh sách phản hồi - </div>
				<div class="panel-body">
					<div class="table-responsive table-hover">
						<table class="table">
							<thead>
								<tr>
									<th class="sua">Người gửi - 
									</th>
									<th>Tiêu đề - 
									</th>
									<th class="sua">Ngày gửi - 
									</th>
									<th class="sua"></th>
									<th class="xoa"></th>
								</tr>
							</thead>
							<tbody>
								<%
									if(list!=null){
									for(int i=0;i<list.size();i++){
								%>
								<tr <%= list.get(i).getDaDoc()==0?"class='active'":"" %> id="bg<%= list.get(i).getIdLienHe() %>">
									<td><%=list.get(i).getHoTen()==null?"":list.get(i).getHoTen()%></td>
									<td><%=list.get(i).getTieuDe().length()>150?list.get(i).getTieuDe().substring(0, 150)+" ...":list.get(i).getTieuDe()%></td>
									<td><%=list.get(i).getNgayGui()%></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="CapNhat('<%=list.get(i).getIdLienHe()%>', '<%= list.get(i).getHoTen() %>');">Chi
											tiết - 詳細</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="XoaQC(<%=list.get(i).getIdLienHe()%>);">Xóa
											- 削除</button></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="menuPhanTrang" id="page">
				<%=request.getAttribute("pageNav")%>
			</div>
			<!-- Script xóa quảng cáo -->
			<script type="text/javascript">
					function XoaQC(x){
						$("#idQC").text(x);
						$("#idXoa").val(x);
						$('#xoaQC').modal('show');
					}
					function DaDoc(x){
						$.ajax({
							url : "DaDocServlet", //file 
							type : "POST", //phuong thức gưi
							data : {
								id : x
							}, //dữ liệu gửi
						});
					}
					function DieuHuong(url){
						window.location.href = url;
					}
					function CapNhat(x, name){
						//Dùng ajax load dữ liệu về
						$("#idTBSua").html(name);
						$("#bg"+x).removeAttr("class");
						DaDoc(x);
						$.ajax({
							url : "DataLienHeServlet", //file 
							type : "POST", //phuong thức gưi
							data : {
								id : x
							}, //dữ liệu gửi
							async : true, //
							success : function(res) {
								$("#noidungsua").html(res);
								$("#xong").removeAttr("disabled");
							},
							error : function() {
								$("#noidungsua").html("<div class='alert alert-danger' role='alert'>Lỗi truy vấn dữ liệu từ Server - サーバにデータベースのエラーが発生した!</div>");
							}
						});
						$('#suaThongBao').modal('show');
					}
				</script>
			<!-- dialog thêm thông báo -->
			<form action="GuiLienHeServlet" method="post" id="suathongbao">
				<div class="modal fade" id="suaThongBao" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
								</button>
								<h4 class="modal-title" id="myModalLabel">
									Khách hàng -  <label id="idTBSua"></label>
								</h4>
							</div>
							<div class="modal-body" id="noidungsua">
							
							
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy - 削除する</button>
								<button type="submit" class="btn btn-primary" id="xong"
									disabled="disabled">Gửi - </button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- dialog xác nhận xóa dữ liệu -->
			<form action="XoaLienHeServlet" method="post">
				<div class="modal fade" id="xoaQC" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
								</button>
								<h4 class="modal-title" id="myModalLabel">Xóa dữ liệu liên hệ - </h4>
							</div>
							<div class="modal-body">
								Bạn thật sự muốn xóa phản hồi này - <label id="idQC"></label> ??? <input
									type="hidden" name="id" id="idXoa">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy - 削除する</button>
								<button type="submit" class="btn btn-primary">Xóa - 完了する</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>