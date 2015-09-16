<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<title>Quản lý quảng cáo</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>

		<%@include file="Menu.jsp"%>

		<div class="danhsach">
			<br> <label>Danh sách quảng cáo</label>
			<table class="table table-hover" id="example">
			<thead>
				<tr>
					<th>ID
					</th>
					<th>Liên kết
					</th>
					<th>Vị trí
					</th>
					<th>Hiển thị
					</th>
					<th>Sửa - Xóa
					</th>
				</tr>
			</thead>
				<tr class="hang1">
					<td>1
					</td>
					<td>https://google.com
					</td>
					<td>Top phải
					</td>
					<td><input type="checkbox" checked="checked">
					</td>
					<td>Sửa - Xóa
					</td>
				</tr>
				<tr class="hang1">
					<td>2
					</td>
					<td>https://google.com
					</td>
					<td>Top phải
					</td>
					<td><input type="checkbox">
					</td>
					<td>Sửa - Xóa
					</td>
				</tr>
			</table>
			<div class="menuPhanTrang">
				<%=request.getAttribute("pageNav")%>
			</div>
		</div>
		<div class="tuychon">
			<center><label>Thông tin quảng cáo</label></center>
			<label>ID quảng cáo</label>
			<input type="text" readonly="readonly" name="id" class="form-control">
			<label>Liên kết trang(*)</label>
			<input type="text" name="lienket" class="form-control">
			<label>Vị trí hiển thị(*)</label>
			<select class="form-control">
				<option value="1">Góc trên phải</option>
				<option value="2">Góc trên trái</option>
				<option value="3">Góc dưới phải</option>
				<option value="4">Góc dưới trái</option>
			</select>
			<input type="checkbox" name="hienthi" checked="checked">
			<label>Cho phép hiển thị</label>
			<br><label>Hình ảnh quảng bá(*)</label>
			<input type="file" name="hinhanh">
			<img id="anh" alt="Hiển thị" src="../images/logo_VN.jpg"><br>
			<button class="btn btn-primary btn-xs">Thêm quảng cáo</button>
			<button class="btn btn-primary btn-xs">Cập nhật</button>
			<button class="btn btn-default btn-xs">Hủy bỏ</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	function Xem(x){
		alert("Kết quả : " + x);
	}
	
	$(document).ready(function() {
	    $('#example tr').click(function() {
	        var href = $(this).html();
	        if(href) {
	            alert(" " + href);
	        }
	    });
	});
</script>
</html>