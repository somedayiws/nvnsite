<%@page import="java.util.Date"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@page import="controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Thư viện cho menu -->
<title>Đăng bài viết</title>
<!-- ck -->
<script src="ckeditor/ckeditor.js"></script>
<style type="text/css">
.modal-body img {
    width: 100%;
}
.modal-content {
    max-width: 100%;
}
</style>
</head>

<body onLoad="initialize()">
	<div id="wrapper">
	<%@include file="header.jsp"%>
	
	<input type="hidden" id="sotu" value="<%= request.getAttribute("sotu") %>">
	<input type="hidden" id="giavn" value="<%= request.getAttribute("giaVN") %>">
	<input type="hidden" id="giaja" value="<%= request.getAttribute("giaJA") %>">
	
	<div id="mainContent">
		<!-- hiển thị nội dung chính ở đây -->
		<div class="col-sm-9 col-md-9" id="baiviet">
			<form action="DangBaiVietServlet" method="post" id="fdangbai"
				enctype="multipart/form-data">
				<!-- hiển thị nội dung chính ở đây -->
				<div class="form-group">
					<label>Ngôn ngữ soạn thảo - 言語</label> <select id="NgonNgu"
						name="NgonNgu" class="form-control" onchange="hienan();">
						<option value="0">Tiếng Việt -</option>
						<option value="1">Tiếng Nhật -</option>
						<option value="2">Song ngữ -</option>
					</select>
				</div>
				<div class="donngu">
					<div class="form-group">
						<label>Tiêu đề - タイトル</label> <input id="TieuDe" name="TieuDe"
							type="text" class="form-control" onblur="check();"></input>
					</div>
					<div class="form-group">
						<label>Mô tả - 概要</label>
						<textarea id="MoTa" name="MoTa" rows="5" cols="30"
							class="form-control"></textarea>
					</div>
				</div>
				<div class="dangu" style="display: none;">
					<div class="col-sm-6 col-md-6 tviet">
						<div class="form-group">
							<label>Tiêu đề</label> <input id="TieuDeVi" name="TieuDeVi"
								type="text" class="form-control" onblur="check();"></input>
						</div>
						<div class="form-group">
							<label>Mô tả</label>
							<textarea id="MoTaVi" name="MoTaVi" rows="5" cols="30"
								class="form-control"></textarea>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 tnhat">
						<div class="form-group">
							<label>タイトル</label> <input id="TieuDeJa" name="TieuDeJa"
								type="text" class="form-control" onblur="check();"></input>
						</div>
						<div class="form-group">
							<label>概要</label>
							<textarea id="MoTaJa" name="MoTaJa" rows="5" cols="30"
								class="form-control"></textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>Thể loại - カテゴリ</label> <select id="TheLoai" name="TheLoai"
						class="form-control">
						<%
							i = 0;
									while(listdanhmuc != null && i < listdanhmuc.size()) {
						%>
						<option value="<%=listdanhmuc.get(i).getIdDanhMuc()%>"><%=listdanhmuc.get(i).getTenDanhMucVi()%>
							-
							<%=listdanhmuc.get(i).getTenDanhMucJa()%></option>
						<%
							i++; }
						%>
					</select>
				</div>
				<div class="donngu">
					<div class="form-group">
						<label>Nội dung - 内容</label>
						<textarea id="NoiDung" name="NoiDung" class="ckeditor"></textarea>
					</div>
				</div>
				<div class="dangu" style="display: none;">
					<div class="col-sm-6 col-md-6 tviet">
						<div class="form-group">
							<label>Nội dung</label>
							<textarea id="NoiDungVi" name="NoiDungVi" class="ckeditor"></textarea>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 tnhat">
						<div class="form-group">
							<label>内容</label>
							<textarea id="NoiDungJa" name="NoiDungJa" class="ckeditor"></textarea>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-12">
					<div class="form-group">
						<label>Hình ảnh - イメージ</label> <input type="file" id="HinhAnh"
							name="HinhAnh" onchange="xem(this);" />
						<p class="help-block">
							Chọn file .png, .jpg ...<br> <img alt="Ảnh đại diện" src=""
								id="fu2">
						</p>
					</div>
					<input type="hidden" id="dichbai" name="dichbai" value="luu">
					<input type="hidden" id="dangbai" name="dangbai" value="Đăng bài -">
					<div class="form-group">
						<input type="submit" value="Lưu bài - 保存"  onclick="LuuBai();" name="luubai" class="btn btn-success" />
						<input type="button" value="Đăng bài - ポスト" onclick="DichBai1();" name="dangbai" class="btn btn-success" data-toggle="modal" data-target="#xacnhandich"/> 
						<input type="button" value="Quay lại - 戻り" class="btn" onclick="history.go(-1);" />
					</div>
				</div>
			</form>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="xacnhandich" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Dịch bài viết song ngữ Việt-Nhật</h4>
		      </div>
		      <div class="modal-body">
		      	Báo giá dịch thuật Việt-Nhật
		      	<br>
		      	<img alt="" src="<%= request.getAttribute("banggiadich") %>">
		      	<br>
		      	<label id="thongbaodich">Dịch cái này mấy xxx đồng.</label>
		        Bạn có muốn dịch bài viết này không???
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="DichBai(false);">Không dịch</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="DichBai(true);">Dịch bài</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Quảng cáo lung tung -->
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="clearfix"></div>
	<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
<script type="text/javascript">
	function xem(f) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.getElementById("fu2");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
	
	function DichBai(x) {
		if(x) $('#dichbai').val('dich');
		else $('#dichbai').val('khong');
		$('#fdangbai').submit();
	}
	function LuuBai() {
		$('#dichbai').val('luu');
		$('#fdangbai').submit();
	}
	function DichBai1() {
		var value = CKEDITOR.instances['NoiDung'].getData();
		var donvi = $("#sotu").val();
		var giavn = $("#giavn").val();
		var giaja = $("#giaja").val();
		/* alert("Xem : " + value.length); */
		$("#thongbaodich").text("Giá của bài dịch này là " + Math.ceil(value.split(/[ .,?!]+/).length*giavn/donvi) + "VND(" + Math.ceil(value.split(/[ .,?!]+/).length*giaja/donvi) + "JPY)");
	}
	
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
		ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=f6fdedfea03ad1bcd7118f3fed15d856&data=eyJzc29faWQiOjEzNDI2MjcsImhhc2giOiIzMzRmODIxY2QwNmFiNTM4ZTBkOTMzNzM2ZDA2ZThlMSJ9&pname='
				+ product_name;
		var s = document.getElementsByTagName('script');
		s[0].parentNode.insertBefore(ga, s[0]);
	})();
</script>
<!-- Hiện ẩn tùy chọn -->
<script type="text/javascript">
	function hienan() {
		var giatri = $('#NgonNgu').val();
		if (giatri == "2") {
			$('.donngu').hide();
			$('.dangu').show();
		} else {
			$('.dangu').hide();
			$('.donngu').show();
		}
	}
</script>
<!-- check validate -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fdangbai").validate({
			rules : {
				TieuDe : {
					required : true
				},
				TieuDeVi : {
					required : true
				},
				TieuDeJa : {
					required : true
				},
				MoTa : {
					required : true
				},
				MoTaVi : {
					required : true
				},
				MoTaJa : {
					required : true
				},
				NoiDung : {
					required : function() {
						CKEDITOR.instances.NoiDung.updateElement();
					}
				},
				NoiDungVi : {
					required : function() {
						CKEDITOR.instances.NoiDungVi.updateElement();
					}
				},
				NoiDungJa : {
					required : function() {
						CKEDITOR.instances.NoiDungJa.updateElement();
					}
				}
			},
			messages : {
				TieuDe : {
					required : "<br>Chưa nhập tiêu đề!"
				},
				TieuDeJa : {
					required : "<br>Chưa nhập tiêu đề tiếng Nhật!"
				},
				TieuDeVi : {
					required : "<br>Chưa nhập tiêu đề tiếng Việt!"
				},
				MoTa : {
					required : "<br>Chưa nhập mô tả!"
				},
				MoTaVi : {
					required : "<br>Chưa nhập mô tả tiếng Việt!"
				},
				MoTaJa : {
					required : "<br>Chưa nhập mô tả tiếng Nhật!"
				},
				NoiDung : {
					required : "<br>Chưa nhập nội dung!"
				},
				NoiDungVi : {
					required : "<br>Chưa nhập nội dung tiếng Việt!"
				},
				NoiDungJa : {
					required : "<br>Chưa nhập nội dung tiếng Nhật!"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</html>