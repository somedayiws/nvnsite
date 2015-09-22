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
<title>Quản lý quảng cáo - 広告を管理します</title>
<style type="text/css">
#advNoHomepage{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){       	                           
        $( "#page" ).change(function() {
        	 var page = $('#page').val();
        	 if(page==1){
        		 $("#advHomepage").show();
        		 $("#advNoHomepage").hide();
        	 }
        	 else{
        		 $("#advHomepage").hide();
        		 $("#advNoHomepage").show();
        	 }
        });
       
//         $("#formCreateAdv").submit(function(){
//         	//lấy dữ liệu các field
//         	var company = $("#company").val();
//         	var link = $("#link").val();
//         	var numberOfDay = $("#numberOfDay").val();
//         	var price = $("#price").val();
        	
//         /* 	alert("company: "+company+".link: "+link+".numberOfDay: "+numberOfDay+".price: "+price); */
//         	//kiểm tra dữ liệu
//         	if(company == ""){
//         		alert("Phải nhập tên đơn vị quảng cáo - 会社の広告を入力してください");
//         		return false;
//         	}
//         	//if()
//         	return false;
//         });
     $( "#formCreateAdv" ).validate({
  rules: {
	  company: {
	      	required: true,        	    
	    },
    link: {
      required: true,
      url: true
    },
    page :{
			required: true,
		},
		positionInHome:{
			required: true,
		},
		positionInNoHome:{
			required: true,
		},	
		date:{
			 required: true,
		      date: true
		},
		numberOfDay:{
	    	required: true, 
	    	range: [1, 100]
	    },
	    Image:{
	    	 required: true,
	         accept: "jpg"
	    },
	    price:{
	    	required: true, 
	    }
   },
	  messages : {
	company:{
		required:"Phải nhập tên đơn vị quảng cáo - 会社の広告を入力してください",        			
	},
	link: {
		required: "Phải nhập link quảng cáo - リンク広告を入力してください",
		url: "Link không hợp lệ - リンク無効"
	},
	page:{ 
		required: "Phải chọn trang hiển thị - 選択ページの表示",        			        			
	},
	positionInHome:{
		required: "Phải chọn vị trí hiển thị trên trang chủ - ホームページでの選択位置表示",        		
	},
	positionInNoHome:{
		required: "Phải chọn vị trí hiển thị trên các trang khác - 別のページで選択位置表示", 
	},	
	date:{
		required: "Phải nhập ngày đăng - 日付を入力します",
		date: "Ngày không hợp lệ - 無効な日付"
	},
	numberOfDay:{
		required: "Phải nhập số ngày hiển thị - 日付の数を入力します",
		range: "Số ngày trong khoảng từ 1 đến 100 - 1から100までの値を入力してください。"
	},
	Image:{
		required: "Phải chọn hình ảnh để hiển thị - 表示する画像を選択します",
		accept: "Định dạng ảnh không phù hợp - フォーマット無効"
	}, 
	price:{
		required: "Phải nhập giá quảng cáo - 価格広告を入力してください",
	}
}
});
//         	  rules: {
//         		company: {
//         	      	required: true,        	    
//         	    },
//         		link:{
//         			required: true, 
//         			url: true,
//         		},
//         		page :{
//         			required: true,
//         		},
//         		positionInHome:{
//         			required: true,
//         		},
//         		positionInNoHome:{
//         			required: true,
//         		},
//         		display:{
//         			require: true,
//         		},
//         		date:{
//         			 required: true,
//         		      date: true
//         		},
//         	    numberOfDay:{
//         	    	required: true, 
//         	    	range: [1, 100]
//         	    },
//         	    Image:{
//         	    	 required: true,
//         	         accept: "png/jpg"
//         	    },        	   
//         	    price:{
//         	    	required: true, 
//         	    }
//         	  },
//         	  messages : {
//       			company:{
//       				required:"Phải nhập tên đơn vị quảng cáo - 会社の広告を入力してください",        			
//       			},
//       			link: {
//       				required: "Phải nhập link quảng cáo - リンク広告を入力してください",
//       				url: "Link không hợp lệ - リンク無効"
//       			},
//       			page:{ 
//       				required: "Phải chọn trang hiển thị - 選択ページの表示",        			        			
//       			},
//       			positionInHome:{
//       				required: "Phải chọn vị trí hiển thị trên trang chủ - ホームページでの選択位置表示",        		
//       			},
//       			positionInNoHome:{
//       				required: "Phải chọn vị trí hiển thị trên các trang khác - 別のページで選択位置表示", 
//       			},
//       			display:{
//       				required: "Bạn có muốn hiển thị hay không - あなたが表示したいですか？"
//       			},
//       			date:{
//       				required: "Phải nhập ngày đăng - 日付を入力します",
//       				date: "Ngày không hợp lệ - 無効な日付"
//       			},
//       			numberOfDay:{
//       				required: "Phải nhập số ngày hiển thị - 日付の数を入力します",
//       				range: "Số ngày trong khoảng từ 1 đến 100 - 1から100までの値を入力してください。"
//       			},
//       			Image:{
//       				required: "Phải chọn hình ảnh để hiển thị - 表示する画像を選択します",
//       				accept: "Định dạng ảnh không phù hợp - フォーマット無効"
//       			}, 
//       			price:{
//       				required: "Phải nhập giá quảng cáo - 価格広告を入力してください",
//       			}
//       		}
//         	});
//         function xem(f,x){
//         	alert("message");
//         	var reader = new FileReader();
//         	reader.onload = function (e) {
//         		var img = document.getElementById(x);
//         		img.src = e.target.result;
//         		img.style.display = "inline";
//         	};
//         	reader.readAsDataURL(f.files[0]);
//         }     
function xem(f,x){
	var reader = new FileReader();
	reader.onload = function (e) {
		var img = document.getElementById(x);
		img.src = e.target.result;
		img.style.display = "inline";
	};
	reader.readAsDataURL(f.files[0]);
}
           
});
</script>
</head>
<%
	//Danh sách đăng ký
	ArrayList<QUANGCAO> advertisement =(ArrayList<QUANGCAO>)request.getAttribute("listDangKy");
	//Danh sách đang hiển thị
	ArrayList<QUANGCAO> listHienThi =(ArrayList<QUANGCAO>)request.getAttribute("listHienThi");
%>
<body>
		<div class="container-fluid">
			<%@include file="header_ver_1.jsp"%>			
			<%@include file="Menu.jsp"%>
<!-------------------- Nội dung quản lý quảng cáo ------------------------>
			<div id="content">
	<!--------------------------- Tạo quảng cáo ---------------------------------------------------------->
			
				<button type="button" class="btn btn-primary btn-sm them" onclick="DieuHuong('ThemQuangCaoServlet');">Tạo quảng cáo - 広告を作成</button>
		
			<div class="col-md-10 col-md-offset-2 panel panel-primary quangcao">
					<div class="panel-heading">Quảng cáo đang hiển thị - リスト広告</div>
					<div class="panel-body">
						<div class="table-responsive table-hover">
							<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Liên kết<br>リンク</th>
									<th>Ngày đăng<br>像</th>
									<th>Vị trí<br>位置</th>
									<th>Số ngày</th>
									<th class="sua"></th>
									<th class="xoa"></th>
								</tr>
							</thead>
							<tbody>
							<%if(listHienThi!=null){
							for(int i=0;i<listHienThi.size();i++){ %>
								<tr>
									<td><%=listHienThi.get(i).getIdQuangCao() %></td>
									<td><%=listHienThi.get(i).getLienKet() %></td>
									<td><%=listHienThi.get(i).getNgayDang() %></td>
									<td><%=listHienThi.get(i).getViTri() %></td>
									<td><%=listHienThi.get(i).getSoNgay() %></td>	
									<td><button type="button" class="btn btn-primary btn-sm" onclick="HienThi('<%= listHienThi.get(i).getIdQuangCao() %>', '1');">Gỡ bỏ - 削除します</button></td>
									<td><button type="button" class="btn btn-primary btn-sm" onclick="DieuHuong('CapNhatQuangCaoServlet?id=<%= listHienThi.get(i).getIdQuangCao() %>');">Chỉnh sửa - 編集</button></td>
								</tr>
							<%} %>
							<%} %>
							</tbody>
							</table>
						</div>
					</div>
				</div>
	<!--------------------------- Hiển thị danh sách các quảng cáo trong cơ sở dữ liệu ------------------->
				<%= request.getAttribute("mes")==null ? "" : request.getAttribute("mes") %>
				<div class="col-md-10 col-md-offset-2 panel panel-primary quangcao">
					<div class="panel-heading">Danh sách quảng cáo - リスト広告</div>
					<div class="panel-body">
						<div class="table-responsive table-hover">
							<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Liên kết<br>リンク</th>
									<th>Ngày đăng<br>像</th>
									<th>Vị trí<br>位置</th>
									<th>Số ngày</th>
									<th class="sua"></th>
									<th class="sua"></th>
									<th class="xoa"></th>
								</tr>
							</thead>
							<tbody>
							<%if(advertisement!=null){
							for(int i=0;i<advertisement.size();i++){ %>
								<tr>
									<td><%=advertisement.get(i).getIdQuangCao() %></td>
									<td><%=advertisement.get(i).getLienKet() %></td>
									<td><%=advertisement.get(i).getNgayDang() %></td>
									<td><%=advertisement.get(i).getViTri() %></td>
									<td><%=advertisement.get(i).getSoNgay() %></td>	
									<td><button type="button" class="btn btn-primary btn-sm" onclick="HienThi('<%= advertisement.get(i).getIdQuangCao() %>', '0')">Hiển thị - 削除します</button></td>	
									<td><button type="button" class="btn btn-primary btn-sm" onclick="DieuHuong('CapNhatQuangCaoServlet?id=<%= advertisement.get(i).getIdQuangCao() %>');">Chỉnh sửa - 編集</button></td>
									<td><button type="button" class="btn btn-primary btn-sm" onclick="XoaQC(<%= advertisement.get(i).getIdQuangCao() %>);">Xóa - 削除します</button></td>							
								</tr>
							<%} %>
							<%} %>
							</tbody>
							</table>
						</div>
					</div>
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
							$("#idQCgo").text("Bạn thật sự muốn gỡ bỏ quảng cáo " + x);
						else
							$("#idQCgo").text("Cho phép đăng quảng cáo " + x);
						$("#idGo").val(x);
						$("#hienthi").val(b);
						$('#goQC').modal('show');
					}
					function DieuHuong(url){
						window.location.href = url;
					}
				</script>
				<!-- dialog xác nhận xóa dữ liệu -->
				<form action="XoaQuangCaoServlet" method="post">
				<div class="modal fade" id="xoaQC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel">Xóa dữ liệu quảng cáo</h4>
				      </div>
				      <div class="modal-body">
				        Bạn thật sự muốn xóa quảng cáo <label id="idQC"></label> ???
				        <input type="hidden" name="idQC" id="idXoa">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
				        <button type="submit" class="btn btn-primary">Xóa</button>
				      </div>
				    </div>
				  </div>
				</div>
				</form>
				<!-- dialog xác nhận xóa dữ liệu -->
				<form action="HienThiQuangCaoServlet" method="post">
				<div class="modal fade" id="goQC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel">Quản lý hiện/ẩn quảng cáo</h4>
				      </div>
				      <div class="modal-body">
				        <label id="idQCgo"></label> ???
				        <input type="hidden" name="idQC" id="idGo">
				        <input type="hidden" name="hienthi" id="hienthi">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
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