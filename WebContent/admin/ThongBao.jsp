<%@page import="model.bean.THONGBAO"%>
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
<title>Quản lý thông báo - 広告を管理します</title>
<style type="text/css">
#advNoHomepage {
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#themthongbao").validate({
			rules : {
				TieuDe : {
					required : true
				},
				NoiDung : {
					required : true
				},
				GuiDen : {
					required : true
				}
			},
			messages : {
				TieuDe : {
					required : "<br>Chưa nhập tiêu đề!"
				},
				NoiDung : {
					required : "<br>Chưa nhập nội dung!"
				},
				GuiDen : {
					required : "<br>Chưa chọn nơi hiển thị!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
		$("#suathongbao").validate({
			rules : {
				TieuDe : {
					required : true
				},
				NoiDung : {
					required : true
				},
				GuiDen : {
					required : true
				}
			},
			messages : {
				TieuDe : {
					required : "<br>Chưa nhập tiêu đề!"
				},
				NoiDung : {
					required : "<br>Chưa nhập nội dung!"
				},
				GuiDen : {
					required : "<br>Chưa chọn nơi hiển thị!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</head>
<%
	//Danh sách thông báo được hiển thị
	ArrayList<THONGBAO> listHienThi =(ArrayList<THONGBAO>)request.getAttribute("listhienthi");
	//Danh sách thông báo đang được ẩn
	ArrayList<THONGBAO> listAn =(ArrayList<THONGBAO>)request.getAttribute("listan");
%>
<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<form action="ThongBaoServlet" id="ftimkiem">
			<div class="col-md-3 col-md-offset-1">
				<select name="timtheo" class="form-control">
					<option value="1">Tất cả</option>
					<option value="2">Id</option>
					<option value="3">Nơi hiển thị</option>
					<option value="4">Nội dung thông báo</option>
				</select>
			</div>
			<div class="col-md-6">
				<input type="text" name="txtFind" class="form-control" placeholder="Nội dung cần tìm ...">
			</div>
			<input type="submit" value="Tìm kiếm" class="btn btn-primary">
		</form>
		<%= request.getAttribute("meg")==null?"":request.getAttribute("meg") %>
		<!-------------------- Nội dung quản lý quảng cáo ------------------------>
		<div id="content">
			<!--------------------------- Tạo quảng cáo ---------------------------------------------------------->
			<button type="button" class="btn btn-primary btn-sm them"
				data-toggle="modal" data-target="#themThongBao">Thêm thông
				báo - 広告を作成</button>

			<div class="col-md-10 col-md-offset-2 panel panel-primary quangcao">
				<div class="panel-heading">Quảng cáo đang hiển thị - リスト広告</div>
				<div class="panel-body">
					<div class="table-responsive table-hover">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="sua">Gửi đến<br>像
									</th>
									<th>Nội dung tin nhắn<br>像
									</th>
									<th class="sua">Ngày Đăng <br>位置
									</th>
									<th class="sua"></th>
									<th class="xoa"></th>
								</tr>
							</thead>
							<tbody>
								<%
									if(listHienThi!=null){
																																											for(int i=0;i<listHienThi.size();i++){
								%>
								<tr>
									<td><%=listHienThi.get(i).getIdThongBao()%></td>
									<td><%=listHienThi.get(i).getGuiDen()==null?"":listHienThi.get(i).getGuiDen().equals("DienDan")?"Diễn đàn":listHienThi.get(i).getGuiDen()%></td>
									<td><%=listHienThi.get(i).getNoiDung()%></td>
									<td><%=listHienThi.get(i).getNgayDang()%></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="HienThi('<%=listHienThi.get(i).getIdThongBao()%>', '1');">Gỡ
											bỏ - 削除します</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="CapNhat('<%=listHienThi.get(i).getIdThongBao()%>');">Chi
											tiết - 編集</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="XoaQC(<%=listHienThi.get(i).getIdThongBao()%>);">Xóa
											- 削除します</button></td>
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
			<!--------------------------- Hiển thị danh sách các quảng cáo trong cơ sở dữ liệu ------------------->


			<%=request.getAttribute("mes")==null ? "" : request.getAttribute("mes")%>
			<div class="col-md-10 col-md-offset-2 panel panel-primary quangcao">
				<div class="panel-heading">Danh sách quảng cáo - リスト広告</div>
				<div class="panel-body">
					<div class="table-responsive table-hover">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="sua">Gửi đến<br>像
									</th>
									<th>Nội dung tin nhắn<br>像
									</th>
									<th class="sua">Ngày Đăng <br>位置
									</th>
									<th class="sua"></th>
									<th class="xoa"></th>
								</tr>
							</thead>
							<tbody>
								<%
									if(listAn!=null){
																																											for(int i=0;i<listAn.size();i++){
								%>
								<tr>
									<td><%=listAn.get(i).getIdThongBao()%></td>
									<td><%=listAn.get(i).getGuiDen()==null?"":listAn.get(i).getGuiDen().equals("DienDan")?"Diễn đàn":listAn.get(i).getGuiDen()%></td>
									<td><%=listAn.get(i).getNoiDung().length()>150?listAn.get(i).getNoiDung().substring(0, 150)+" ...":listAn.get(i).getNoiDung()%></td>
									<td><%=listAn.get(i).getNgayDang()%></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="HienThi('<%=listAn.get(i).getIdThongBao()%>', '0');">Hiển
											thị - 削除します</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="CapNhat('<%=listAn.get(i).getIdThongBao()%>');">Chi
											tiết - 編集</button></td>
									<td><button type="button" class="btn btn-primary btn-sm"
											onclick="XoaQC(<%=listAn.get(i).getIdThongBao()%>);">Xóa
											- 削除します</button></td>
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
					function HienThi(x, b){
						if(b=='1')
							$("#idQCgo").text("Bạn thật sự muốn gỡ bỏ thông báo " + x);
						else
							$("#idQCgo").text("Cho phép đăng thông báo " + x);
						$("#idGo").val(x);
						$("#hienthi").val(b);
						$('#goQC').modal('show');
					}
					function DieuHuong(url){
						window.location.href = url;
					}
					function CapNhat(x){
						//Dùng ajax load dữ liệu về
						$("#idTBSua").html(x);
						$.ajax({
							url : "DataThongBaoServlet", //file 
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
								$("#noidungsua").html("<div class='alert alert-danger' role='alert'>Lỗi truy vấn dữ liệu từ Server!</div>");
							}
						});
						$('#suaThongBao').modal('show');
					}
				</script>
			<!-- dialog thêm thông báo -->
			<form action="ThemThongBaoServlet" method="post" id="themthongbao">
				<div class="modal fade" id="themThongBao" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Thêm thông báo
									mới</h4>
							</div>
							<div class="modal-body">
								<!-- Đơn vị quảng cáo -->
								<div class="form-group">
									<label for="company"> Tiêu đề - 企業広告</label> <input type="text"
										class="form-control" name="TieuDe" maxlength="200">
								</div>
								<div class="form-group">
									<label for="company"> Nội dung thông báo - 企業広告</label>
									<textarea rows="5" cols="10" name="NoiDung"
										class="form-control"></textarea>
								</div>
								<div class="form-group">
									<label for="company"> Gửi đến - 企業広告</label> <input type="text"
										class="form-control" name="GuiDen" maxlength="200">
								</div>
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-primary">Xong</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- dialog thêm thông báo -->
			<form action="SuaThongBaoServlet" method="post" id="suathongbao">
				<div class="modal fade" id="suaThongBao" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									Cập nhật thông báo <label id="idTBSua"></label>
								</h4>
							</div>
							<div class="modal-body" id="noidungsua"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-primary" id="xong"
									disabled="disabled">Xong</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- dialog xác nhận xóa dữ liệu -->
			<form action="XoaThongBaoServlet" method="post">
				<div class="modal fade" id="xoaQC" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Xóa dữ liệu thông
									báo</h4>
							</div>
							<div class="modal-body">
								Bạn thật sự muốn xóa thông báo <label id="idQC"></label> ??? <input
									type="hidden" name="id" id="idXoa">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-primary">Xóa</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- dialog xác nhận xóa dữ liệu -->
			<form action="HienThiThongBaoServlet" method="post">
				<div class="modal fade" id="goQC" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Quản lý hiện/ẩn
									thông báo</h4>
							</div>
							<div class="modal-body">
								<label id="idQCgo"></label> ??? <input type="hidden" name="id"
									id="idGo"> <input type="hidden" name="hienthi"
									id="hienthi">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-primary">Chấp nhận</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>