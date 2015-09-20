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

</head>
<%
	//Nhận danh sách quảng cáo
	ArrayList<QUANGCAO> advertisement =(ArrayList<QUANGCAO>)request.getAttribute("advertisement");

%>
<body>
		<div class="container-fluid">
			<%@include file="header_ver_1.jsp"%>			
			<%@include file="Menu.jsp"%>
<!-------------------- Nội dung quản lý quảng cáo ------------------------>
			<div id="content">
	<!--------------------------- Tạo quảng cáo ---------------------------------------------------------->
			
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalCreate">Tạo quảng cáo - 広告を作成</button>

				<!-- Modal -->
				<div id="modalCreate" class="modal fade" role="dialog">
  					<div class="modal-dialog">

    			<!-- Modal content-->
    				<div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">Quảng cáo - 広告</h4>
					      </div>
					      <div class="modal-body">
					        
					        <form name="formCreateAdv" id = "formCreateAdv" action="AdvertisementServlet" method="post" enctype="multipart/form-data">
					        	<!-- Đơn vị quảng cáo -->
					        	<div class="form-group">
					        		<label for="company">Đơn vị quảng cáo - 企業広告</label>
					        		<input type="text"  class="form-control" name = "company" id ="company" maxlength="200">
					        	</div>
					        	<!-- Liên kết -->
					        	<div class="form-group">
					        		<label for="link">Link quảng cáo - リンク</label>
					        		<input type="url" class="form-control" name="link" id="link">
					        	</div>					        	
					        	<!-- Trang hiển thị -->
					        	<div class="form-group">
								      <label for="page">Trang hiển thị - ページショー</label>
								      <select class="form-control" id="page" name="page">
								        <option value="1">Trang chủ - ホームページ</option>
								        <option value="2">Trang khác - 別のページ</option>								       							      
								      </select>
								  </div>								
								  <!-- Nếu là trang chủ thì có 7 vị trí, ngược lại là có 2 vị trí -->
								  
					        	<!-- Vị trí -->	
					        		<!-- Vị trí trang chủ  -->				        	
					        	<div class="form-group" id="advHomepage">
								      <label for="postion">Vị trí - 位置</label>
								      <select class="form-control" id="positionInHome" name="positionInHome">
								        <option value="1">1</option>
								        <option value="2">2</option>
								        <option value="3">3</option>
								        <option value="4">4</option>
								        <option value="5">5</option>
								        <option value="6">6</option>
								      </select>
								  </div>
								  	<!-- Vị trí các trang khác -->
								<div class="form-group" id="advNoHomepage">
									<label for="postion">Vị trí - 位置</label>
								      <select class="form-control" id="positionInNoHome" name="positionInNoHome">
								        <option value="1">1</option>
								        <option value="2">2</option>								       
								      </select>
								</div>
					        	<!-- Hiển thị -->
					        	<div class="form-group">
						        	<label>Hiển thị - ディスプレイ</label>
						        	<div class="radio">
										  <label><input type="radio" name="display" id="display" checked="checked" value="1">Có - はい</label>
									</div>
									<div class="radio">
									  <label><input type="radio" name="display" id="display" value="0">Không - いいえ</label>
									</div>						        	
								</div>
								<!-- Ngày đăng -->
								<div class="form-group">
									<label>Ngày đăng - </label>
									<input type="date" class="form-control" name="date">
								</div>
					        	<!-- Số ngày -->
					        	<div class="form-group">
					        		<label>Số ngày hiển thị - 一日数</label>
					        		<input type="number" class="form-control" name="numberOfDay" id="numberOfDay">
					        	</div>
					        	<!-- Hình ảnh -->
					        	<div class="form-group">
									<label>Hình ảnh - 像 <input type="file" id="Image" name="Image" onchange="xem(this,'fua');"/></label>
									<p class="help-block">Chọn file .png, .jpg ...<br>
										<img alt="Icon đại diện" src="../images/icondefault.png" id="fua">
									</p>
								</div>
								<!-- Kích thước -->
								<div class="form-group">
								      <label for="size">Kích thước - サイズ</label>
								      <select class="form-control" id="size" name="size" disabled="disabled">
								        <option value="1">320x250</option>
								        <option value="2">728x90</option>
								        <option value="3">300x150</option>									       							      
								      </select>
								  </div>
								<!-- Giá quảng cáo -->
								<div class="form-group">
									<label for="price">Giá quảng cáo - 価格</label>
									<input type="text" name="price" class="form-control" id="price">
								</div>
								<button class="btn btn-primary btn-sm" type="submit" id="createAdv" name="createAdv">Thêm quảng cáo - 広告を作成</button>
					        </form>
					        
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
    				</div>

  					</div>
			</div>
	
	<!--------------------------- Hiển thị danh sách các quảng cáo trong cơ sở dữ liệu ------------------->
				<div class="col-md-10 col-md-offset-2 panel panel-primary">
					<div class="panel-heading">Danh sách quảng cáo - リスト広告</div>
					<div class="panel-body">
						<div class="table-responsive table-hover">
							<table class="table">
							<thead>
								<tr>
									<th>STT</th>
									<th>Liên kết<br>リンク</th>
									<th>Hình ảnh<br>像</th>
									<th>Vị trí<br>位置</th>
									<th>Hiển thị<br>ディスプレイ</th>
									<th>Số ngày</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<%if(advertisement!=null){
							for(int i=0;i<advertisement.size();i++){ %>
								<tr>
									<td><%=advertisement.get(i).getIdQuangCao() %></td>
									<td><%=advertisement.get(i).getLienKet() %></td>
									<td><%=advertisement.get(i).getHinhAnh() %></td>
									<td><%=advertisement.get(i).getViTri() %></td>
									<td><%=advertisement.get(i).getHienThi() %></td>	
									<td><%=advertisement.get(i).getSoNgay() %></td>	
									<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editAdvertiment">Chỉnh sửa - 編集</button></td>
									<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#deleteAdvertiment">Xóa - 削除します</button></td>							
								</tr>
							<%} %>
							<%} %>
							</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</div>
</body>
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
</html>