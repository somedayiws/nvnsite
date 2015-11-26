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
	<%
		BAIVIET baiviet = (BAIVIET) request.getAttribute("baiviet");
		String titleStr = "";
		if(baiviet.getTenBaiVietVi() != null ) {
			titleStr = baiviet.getTenBaiVietVi();
		}
		if(baiviet.getTenBaiVietVi() != null && baiviet.getTenBaiVietJa() != null) {
			titleStr += "<br>";
		}
		if(baiviet.getTenBaiVietJa() != null ) {
			titleStr += baiviet.getTenBaiVietJa();
		}		
	%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:image" content="http://jpvn.net/<%=((BAIVIET) request.getAttribute("baiviet")).getLienKet()%>" />
<meta property="og:title" content="<%=titleStr%>" />
<link rel="stylesheet" type="text/css" href="css/jssocials.css" />
<link rel="stylesheet" type="text/css" href="css/jssocials-theme-flat.css" />
<!-- <script type="text/javascript" src="js/disable-copyright.js"></script> -->
<title>Chi tiết bài viết - 詳細な記事</title>
</head>
<body>
	<!-- Lấy dữ liệu từ server gửi về -->
	<%
		/* Top 10 bài viết đầu tiên được hiển thị */
		ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>) request.getAttribute("listbaiviet");
		/* binh luan tiếng việt*/
		ArrayList<BINHLUAN> blviet = baiviet.getBinhLuanVi();
		/* bình luận tiếng nhật*/
		ArrayList<BINHLUAN> blnhat = baiviet.getBinhLuanJa();
	%>
	<div id="wrapper">
		<!-- Kết thúc quá trình lấy dữ liệu -->
		<%@include file="header.jsp"%>
		<div id="mainContent">
			<!-- hiển thị nội dung chính ở đây -->
			<div class="col-sm-9 col-md-9" id="baiviet">
				<h3>
					<i class="fa fa-empire"></i>
					<%=titleStr%>
				</h3>
				<div id="infoNews">
					<div class="infoDetail" id="category">
						<a
							href="Danh-sach-bai-viet?id=<%=baiviet.getDanhMuc().getIdDanhMuc()%>">
							<%=baiviet.getDanhMuc().getTenDanhMucVi()+"-"+baiviet.getDanhMuc().getTenDanhMucJa()%></a>
					</div>
					<div class="infoDetail">
						<i class="fa fa-user"></i>
						<%=baiviet.getTaiKhoan().getHoTen()%></div>
					<div class="infoDetail">
						<i class="fa fa-calendar"></i>
						<%=baiviet.getNgayDang()%></div>
					<div class="infoDetail">
						<i class="fa fa-eye"></i>
						<%=baiviet.getLuotXem()%></div>
					<div id="socialLink"></div>
				</div>
				<div class="clearfix"></div>
				<p>
					<%
						if(baiviet.getMoTaVi() != null ) {
					%>
					<strong> <%=baiviet.getMoTaVi()%></strong> <br>
					<%
						}
					%>
					<%
						if(baiviet.getMoTaJa() != null ) {
					%>
					<strong> <%=baiviet.getMoTaJa()%></strong>
					<%
						}
					%>
				</p>
				<div id="share"></div>

			   	<script src="js/jssocials.min.js"></script>
			  	<script>
			     	  $("#share").jsSocials({
   					 	showCount: false,
    					showLabel: true,
    					shares: [
             			     { share: "facebook", label: "FACEBOOK" },
         					 { share: "twitter", label: "TWITTER" },
         					 { share: "googleplus", label: "GOOGLE+" },
                  			 { share: "email", label: "EMAIL" }
    					]
					});
			    </script>
				<br> <br>
				
				<div id="noidung">
					<%
						if(baiviet.getNoiDungVi() != null && !baiviet.getNoiDungVi().equals("")  && baiviet.getNoiDungJa() != null && !baiviet.getNoiDungJa().equals("") ) {
					if(!baiviet.getLienKet().equals("images/baiviet.jpg")){
					%>
					<img src="<%=baiviet.getLienKet() %>" >
					<%
					}
					%>
					
					<div class="col-xs-12 col-sm-6 col-md-6" id="tiengviet">
						<%=baiviet.getNoiDungVi()%>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="tiengnhat">
						<%=baiviet.getNoiDungJa()%>
					</div>
					<div class="clearfix"></div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="blviet">
						<strong id="selfComment"> Bình luận - コメント </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn - あなたのコメントです。"
								class="form-control" id="txtviet"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentvi('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác - 他のコメントです。</span>
						</p>

						<div class="row" id="listblviet">
							<%
								i = 0;
																																							while(blviet != null && i<blviet.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blviet.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blviet.get(i).getNgayDang()%></span>
								<p><%=blviet.get(i).getPhanHoiVi()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonviet">
							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'vi');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6" id="blnhat">
						<strong id="selfComment"> Bình luận - コメント</strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn - あなたのコメントです。"
								class="form-control" id="txtnhat"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentja('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác - 他のコメントです。</span>
						</p>

						<div class="row" id="listblnhat">
							<%
								i = 0;
												while(blnhat != null && i<blnhat.size()){
							%>
							<div id="itemComment">

								<i class="fa fa-user"></i> <em><%=blnhat.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blnhat.get(i).getNgayDang()%></span>
								<p><%=blnhat.get(i).getPhanHoiJa()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonnhat">

							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'ja');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						} else {
					%>
					<%
						if(baiviet.getNoiDungVi() != null && !baiviet.getNoiDungVi().equals("")) {
					%>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengviet">
						<%=baiviet.getNoiDungVi()%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blviet">
						<strong id="selfComment"> Bình luận - コメント</strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn - あなたのコメントです。"
								class="form-control" id="txtviet"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentvi('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác - 他のコメントです。</span>
						</p>

						<div class="row" id="listblviet">
							<%
								i = 0;
																																								while(blviet != null && i<blviet.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blviet.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blviet.get(i).getNgayDang()%></span>
								<p><%=blviet.get(i).getPhanHoiVi()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonviet">

							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'vi');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						}
					%>
					<%
						if(baiviet.getNoiDungJa() != null && !baiviet.getNoiDungJa().equals("")) {
					%>
					<div class="col-xs-12 col-sm-12 col-md-12" id="tiengnhat">
						<%=baiviet.getNoiDungJa()%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" id="blnhat">
						<strong id="selfComment"> Bình luận - コメント </strong>
						<div class="row">
							<textarea rows="3" placeholder="Bình luận của bạn - あなたのコメントです。"
								class="form-control" id="txtnhat"></textarea>
						</div>
						<button type="button" class="btn btn-link"
							onclick="comentja('<%=baiviet.getIdBaiViet()%>');">
							<i class="fa fa-comments-o"></i> Gửi - コメント
						</button>
						<p id="anotherComments">
							<span>Bình luận khác - 他のコメントです。</span>
						</p>

						<div class="row" id="listblnhat">
							<%
								i = 0;
																																								while(blnhat != null && i<blnhat.size()){
							%>
							<div id="itemComment">
								<i class="fa fa-user"></i> <em><%=blnhat.get(i).getTaiKhoan().getHoTen()%></em><span
									id="dateComment"><%=blnhat.get(i).getNgayDang()%></span>
								<p><%=blnhat.get(i).getPhanHoiJa()%></p>
							</div>
							<%
								i++; }
							%>
						</div>
						<div class="row" id="tuychonnhat">
							<button type="button" class="btn btn-link"
								onclick="loadBinhLuan('<%=baiviet.getIdBaiViet()%>', 'ja');">
								<i class="fa fa-hand-o-right"></i> Xem thêm - 詳細
							</button>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>

				</div>
				<!-- danh sách bài viết mới -->
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;" id="listbaiviet">
					<strong>Danh sách bài viết liên quan - 関係がある記事のリストです。</strong>
					<%
						i=0;
								while(listbaiviet != null && i<listbaiviet.size()){
					%>
					<div class="row">
						<!-- danh sách các bài viết trong nhóm -->
						<img alt="Ảnh đại diện-プロファイルの画像" src="images/baiviet.jpg"
							style="width: 20px;"> <a
							href="Xem-bai-viet?id=<%=listbaiviet.get(i).getIdBaiViet()%>">
							<%=listbaiviet.get(i).getTenBaiVietVi()==null?"":listbaiviet.get(i).getTenBaiVietVi()+"<br>"%>
							<%=listbaiviet.get(i).getTenBaiVietJa()==null?"":listbaiviet.get(i).getTenBaiVietJa()%></a>
					</div>
					<%
						i++; }
					%>
				</div>
			</div>
			<%@include file="sidebar.jsp"%>
		</div>
		<div class="clearfix"></div>

		<%@include file="footer.jsp"%>
	</div>
</body>
<!-- Script ở đây -->
<!-- Xử lý load lấy bình luận -->
<script type="text/javascript">
	function loadBinhLuan(id, ngonngu) {
		if (ngonngu == 'vi') {
			var nvitri = $("#listblviet").children().size();
			$.ajax({
				url : "DataBinhLuanServlet", //file  
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : nvitri
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblviet").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra - エラが発生した。!');
				}
			});
		} else {
			var nvitri = $("#listblnhat").children().size();
			$.ajax({
				url : "DataBinhLuanServlet", //file 
				type : "POST", //phuong thức gưi
				data : {
					idbaiviet : id,
					ngonngu : ngonngu,
					vitri : nvitri
				},//dữ liệu gửi
				async : true, //
				success : function(res) {
					$("#listblnhat").append(res);
				},
				error : function() {
					alert('Có lỗi xảy ra - エラが発生した。!');
				}
			});
		}
	}
</script>
<!-- Chuyển hướng đến danh muc x -->
<script type="text/javascript">
	function loadData(trang, x) {
		window.location.href = trang + "?id=" + x;
	};
	function dichuyen(x) {
		window.location.href = x;
	};
	function comentvi(id) {
		var bien = $("#tkDangNhap").val();
		var date = $("#dateComment").val();
		if (bien == 'null') {
			alert("Bạn phải đăng nhập, mới được bình luận.\nログインをしないと、コメントをすることができい。");
			$('#mdangnhap').modal('toggle');
		} else {
			var txt = $("#txtviet").val();
			if (txt != "") {
				var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
						+ bien
						+ "</em> <span id='dateComment'>"
						+ date
						+ "</span> <p>" + txt + "</p></div>";
				$("#listblviet").prepend(htm);
				$("#txtviet").val("");
				updatedatavi(id, 'vi', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.\nあなたはコメントをまだ入力しない。");
			}
		}
		$("#txtviet").val("");
	};
	function comentja(id) {
		var bien = $("#tkDangNhap").val();
		var date = $("#dateComment").val();
		if (bien == 'null') {
			alert("Bạn phải đăng nhập, mới được bình luận.\nログインをしないと、コメントをすることができい。");
			$('#mdangnhap').modal('toggle');
		} else {
			var txt = $("#txtnhat").val();
			if (txt != "") {
				var htm = "<div id='itemComment'><i class='fa fa-user'></i> <em>"
						+ bien
						+ "</em> <span id='dateComment'>"
						+ date
						+ "</span> <p>" + txt + "</p></div>";
				$("#listblnhat").prepend(htm);
				$("#txtnhat").val("");
				updatedatavi(id, 'ja', txt);
			} else {
				alert("Bạn chưa nhập bình luận của mình.\nあなたはコメントをまだ入力しない。");
			}
		}
		$("#txtnhat").val("");
	};
	function updatedatavi(id, laguage, bluan) {
		$.ajax({
			url : "UpDateDataBinhLuan", //file 
			type : "POST", //phuong thức gưi
			data : {
				idbaiviet : id,
				ngonngu : laguage,
				binhluan : bluan
			}, //dữ liệu gửi
			async : true
		});
	};
</script>
</html>