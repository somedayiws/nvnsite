<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css">
<title>Giao diện banner</title>
<link rel="stylesheet" href="css/ClientStyle.css">
<!--Start of Zopim Live Chat Script-->
<script src="js/ZopimLiveChat.js"></script>
<!--End of Zopim Live Chat Script-->
<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
	window.$zopim || (function(d, s) {
		var z = $zopim = function(c) {
			z._.push(c)
		}, $ = z.s = d.createElement(s), e = d.getElementsByTagName(s)[0];
		z.set = function(o) {
			z.set._.push(o)
		};
		z._ = [];
		z.set._ = [];
		$.async = !0;
		$.setAttribute("charset", "utf-8");
		$.src = "//v2.zopim.com/?3FOgGzfAoFtSeOFmlJO53aKC2cSx0dLm";
		z.t = +new Date;
		$.type = "text/javascript";
		e.parentNode.insertBefore($, e)
	})(document, "script");
</script>
<!--End of Zopim Live Chat Script-->
</head>
<body>
	<div id="banner">
		<a id="bnvi" href="TrangChuServlet"><marquee direction="right">Cổng thông tin</marquee></a>
		<form id="seach" class="navbar-form navbar-right" role="search"
			action="TimKiemServlet" method="post">
			<div class="form-group">
				<input type="text" name="txtFind" class="form-control"
					placeholder="Tìm kiếm - Nhật ngữ">
			</div>
			<button type="submit" class="btn btn-default">Search</button>
		</form>
		<a id="bnja" href="TrangChuServlet">はじめまして、ぞろしくおねがいしま</a> <a id="bnlogov" href="TrangChuServlet"><i
			class="fa fa-joomla fa-spin"></i> V</a> <a id="bnlogo" href="TrangChuServlet">IỆT NHẬT</a> <img
			alt="Việt Nam" src="images/viet.gif"> <img alt="にほんご"
			src="images/nhat.gif">
	</div>

	<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
	<script>
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
					.test(d.location) ? 'http' : 'https';
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = p + '://platform.twitter.com/widgets.js';
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, 'script', 'twitter-wjs');
	</script>

	<!-- <g:plusone></g:plusone>

	<script type="text/javascript">
		(function() {
			var po = document.createElement('script');
			po.type = 'text/javascript';
			po.async = true;
			po.src = 'https://apis.google.com/js/plusone.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(po, s);
		})();
	</script> -->

	<!-- <script type="text/javascript">
  window.___gcfg = {
        lang: 'vi',
        lang: 'ja'
      };

      (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
      })();
    </script> -->
	
	<form id="fThemSanPham" action="UpAnhServlet" enctype="multipart/form-data"
				method="POST">
				<table class="bang" cellpadding="10px">
					<tr>
						<td style="width: 125px; text-align: left;">Tên sản phẩm(*) :
						<td><input type="text" name="tensanpham"></td>
					</tr>
					<tr>
						<td style="width: 125px; text-align: left;">Mô tả(*) :</td>
						<td><input type="text" name="mota"></td>
					</tr>
					<tr>
						<td style="width: 125px; text-align: left;">Giá bán(*) :</td>
						<td><input type="text" name="giaban"></td>
					</tr>
					<tr>
						<td style="width: 125px; text-align: left;">Hình ảnh :</td>
						<td><input type="file" name="hinhanh"></td>
					</tr>
					<tr>
						<th colspan="2" align="right"><input type="submit"
							value="Xong"> <input type="reset" value="Reset"></th>
					</tr>
				</table>
			</form>
			<input id="f" type="file" onchange="file_change(this)" />
			<img id="img" style="display: none" />
<script type="text/javascript">
	function file_change(f){
		var reader = new FileReader();
		reader.onload = function (e) {
			var img = document.getElementById("img");
			img.src = e.target.result;
			img.style.display = "inline";
		};
		reader.readAsDataURL(f.files[0]);
	}
</script>

<%-- <div id="menuPhanTrang">
			<ul class="pagination  pagination-sm" id="menupt">
			  <li class="disabled" onclick="chuyen(0);"><a href="#">&laquo;</a></li>
			  <li><a href="#" onclick="loadMenu('giam');" >... <span class="sr-only">(current)</span></a></li>
			  <li class="active" onclick="chuyen(2);"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			  <%
			  		i = 3;
			  		int n = Integer.parseInt(tong)+2;
			  		while(i<n) {
			  %>
			  			<li><a href="#" onclick="chuyen(<%= i %>);"><%= i-1 %> <span class="sr-only">(current)</span></a></li>
			  <%
			  		i++;
			  		}
			  %>
			  <li><a href="#" onclick="loadMenu('tang');" >... <span class="sr-only">(current)</span></a></li>
			  <li><a href="#" onclick="chuyen(<%= (Integer.parseInt(tong)+3) %>);">&raquo;</a></li>
			</ul>
		</div> --%>

<script type="text/javascript">
			var index = 2;
			var day = 0;
			var tongtrang = parseInt($("#tongtrang").val());
			function chuyen(x){
				if(x==0 && index>2){
					x = index-1;
					if(x<day+2){
						loadMenu('giam');
						return;
					}
				}
				if(x==(tongtrang+3) && index<tongtrang+1){
					x = index+1;
					if(x>day+11){
						loadMenu('tang');
						return;
					}
				}
				var chon = $('#menupt li:eq('+x+')');
				var dachon = $('#menupt li[class="active"]');
				if(x!=2) {
					$('#menupt li:eq(0)').removeClass();
				}
				else {
					$('#menupt li:eq(0)').attr("class", "disabled");
				}
				if(x!=(tongtrang+1)) {
					$('#menupt li:last-child').removeClass();
				}
				else {
					$('#menupt li:last-child').attr("class", "disabled");
				}
				var noidung = $('.noidung'+(x-1));
				
				if(noidung.val() == null){
					//load ajax
					$.ajax({
						url : "DanhSachDichServlet",
						type : "post",
						data : {
							id: x-1
						},
						success : function(result) {
							$(".dulieu").append(result);
						}
					});
				}
				$('.noidung'+(index-1)).hide();
				$('.noidung'+(x-1)).show();
				index = x;
				dachon.removeClass();
				chon.attr("class", "active");
			}
			function loadMenu(kieu){
				var i = 1;
				if(kieu == "tang"){
					day += 10;
				}else{
					if(day>0) day -= 10;
				}
				if(day == 0){
					$('#menupt li:eq(1)').hide();
					for(i=2; i<tongtrang+2; i++){
						if(i<12) $("#menupt li:eq("+i+")").show();
						else $("#menupt li:eq("+i+")").hide();
					}
					if(day+10 < tongtrang+2) $("#menupt li:eq("+(tongtrang+2)+")").show();
					else $("#menupt li:eq("+(tongtrang+2)+")").hide();
				}else{
					$('#menupt li:eq(1)').show();
					var dem = 0;
					for(i=2; i<=tongtrang+1; i++){
						if(i>(day+1)){
							$("#menupt li:eq("+i+")").show();
							if(dem>9) break;
							dem++;
						}
						else $("#menupt li:eq("+i+")").hide();
					}
					while(i<=tongtrang){
						$("#menupt li:eq("+i+")").hide();
						i++;
					}
					if(day+10 < tongtrang+2) $("#menupt li:eq("+(tongtrang+2)+")").show();
					else $("#menupt li:eq("+(tongtrang+2)+")").hide();
				}
				chuyen(day+2);
			}
		</script>

</body>	
</html>
