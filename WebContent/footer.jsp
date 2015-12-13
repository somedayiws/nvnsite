<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="footer">
	<div id="wFooter">
		<span id="leftFooter">Cổng thông tin thương mại Việt-Nhật - 日越ビジネス情報の窓口</span> <span
			id="rightFooter"> <a href="Trang-chu">Trang chủ-ホーム</a> | <a
			href="Gia-dich-vu">Quảng cáo-広告 | </a><a href="#"> 
				<i class="fa fa-chevron-up"></i>
		</a>
		</span>
	</div>
	<div id="contentFooter">
		<div class="infoContent" id="about">
			<div id="titleContent">GIỚI THIỆU - 自己紹介</div>
			<div id="infoContent">
				<p><a href="Gioi-Thieu">Về chúng tôi - について</a></p>
				<p><a href="Quy-dinh">Quy định sử dụng - 利用規約</a></p>
				<p>Liên hệ - 連絡先の情報  : <%= request.getAttribute("LienHe")==null?"":request.getAttribute("LienHe") %></p>
				<p>Điện thoại - 電話番号: <%= request.getAttribute("DienThoai")==null?"":request.getAttribute("DienThoai") %></p>
				<p>Email - メール: <%= request.getAttribute("Email")==null?"congthongtin.vietnhat@gmail.com":request.getAttribute("Email") %></p>
			</div>
		</div>
		<div class="infoContent" id="link">
			<div id="titleContent">LIÊN KẾT - 連結</div>
			<div id="infoContent">
			<div id="linkleft">
			<p><a href="https://www.jetro.go.jp/" target="_blank">
				Tổ chức Thương Mại Nhật Bản <br> 日本貿易振興機構</a></p>
				<p><a href="http://www.vn.emb-japan.go.jp/index_jp.html" target="_blank">
				Đại sứ quán Nhật Bản tại Việt Nam <br> 在ベトナム日本国大使館</a></p>
				<p><a href="http://www.mofa.gov.vn/vnemb.jp/" target="_blank">
				Đại sứ quán Việt Nam tại Nhật Bản <br> 在日ベトナム国大使館</a></p>
			</div>
			<div id="linkright">
				<p><a href="http://www.immi-moj.go.jp/" target="_blank">
				Cục Quản Lý Nhập Cảnh Nhật Bản <br> 日本入国管理局</a></p>
				<p><a href="http://www.xuatnhapcanh.com.vn/" target="_blank">
				Cục xuất nhập cảnh TP.Hồ Chí Minh <br> ホーチミン市にて出入国管理局</a></p>
				<p><a href="http://www.jasso.go.jp/job/" target="_blank">
				Tổ chức Hỗ Trợ Sinh viên tại Nhật Bản <br> 日本学生支援機構</a></p>
			</div>
			</div>
		</div>
		<div class="infoContent" id="connect">
			<div id="titleContent">KẾT NỐI - コンタクト</div>
			<div id="infoContent">
				<p class ="itemconnect" id="facebookitem"><a href="https://www.facebook.com/Jpvnnet-1049870061692951/"><i class="fa fa-facebook"></i> Facebook</a></p>
				<p class ="itemconnect" id="googleitem"><a href="#"><i class="fa fa-google-plus"></i> Google+</a></p>
			</div>
		</div>
	</div>
	<div id="copyright">
		<div id="wcopyright">© 2015 COPYRIGHT BY JPVN.NET, 2015</div>
	</div>
	<div id="resultAjax" style="display: none;">
	</div>
	<div id="wait-icon" style="display: none;">
	<i class="fa fa-spinner fa-pulse"></i>
	</div>
</div>
<div id="sahred">
				<g:plusone></g:plusone>
				<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
				<div id="fb-root"></div>
				<!-- Your share button code -->
				<div class="fb-share-button"
					data-href="http://webvietnhat-demo.jelastic.skali.net/"
					data-layout="button_count"></div>
</div>
<!-- Google+ -->
<script type="text/javascript"
	src="https://apis.google.com/js/plusone.js"></script>
<!-- Twitter -->
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
<!-- Facebook -->
<script>
	(function(d, s, id) {
		$('.fb-share-button').attr("data-href",window.location.href);
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.4&appId=1671772309710877";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
window.fbAsyncInit = function() {
  FB.init({
    appId      : '925159020912140',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.5' // use version 2.3
  });

};

function FBLogin()
{
      FB.login(function(response) {
         if (response.authResponse) 
         {
        	 $.ajax({
                 type: "POST",
                 data: {access_token: response.authResponse.accessToken},
                 url: 'LoginFacebook',
                 success: function(responseText) {
                 	$('#resultAjax').html(responseText);
                 	uiLogged();
                 }
           });
        } else
          {
        	$('#loiDangNhap').html("<div class='alert alert-danger' role='alert'><p>Bạn chưa cấp quyền cho ứng dụng facebook!.<br></p></div>");
          }
       },{scope: 'public_profile,email'});
}
function uiLogged(){
	if($('#resultAjax #result #resultMessage').text().match("Thanhcong")) {
   	 $.ajax({
			url : "CheckEmailServlet",
			type : "post",
			success : function(result) {
				$("#checkmail").html(result);
				$("#countMailSide").text($("#countMail").text());
			}
			});
   	 $('#loiDangNhap').html("<div class='alert alert-success' role='alert'><p>Đăng nhập thành công!</p></div>");
   	 $('#wait-icon').removeAttr("style");
   	 setTimeout(function(){
   		 $('#headerTop #login #topmenu').html($('#resultAjax #result #topmenu').html());
   		 $('#fix-post-news').html($('#resultAjax #result #fix-post-news').html());
       	 $('#textdiv .col-sm-3').html($('#resultAjax #result .col-sm-3 button'));
       	 $('#wait-icon').attr("style","display: none;");
       	 $('#mdangnhap').modal('hide');	
   	 }, 1500);
   	 
    } else {
   	 $('#loiDangNhap').html($('#resultAjax').html());
    }
}
</script>
<script type="text/javascript">

$(document).ready(function() {
	$("#fdangnhap").validate({
		rules : {
			taikhoan : {
				required : true
			},
			matkhau : {
				required : true
			}
		},
		messages : {
			taikhoan : {
				required : "<br>Chưa nhập tên tài khoản<br>アカウントのユーザー名をまだ入力しない"
			},
			matkhau : {
				required : "<br>Chưa nhập mật khẩu<br>ログインをまだしない!"
			}
		},
		submitHandler : function(form) {
			/* form.submit(); */
			$.ajax({
                type: 'POST',
                url: 'DangNhapAjaxServlet',
                data: $('#fdangnhap').serialize(),
                success: function(responseText) {
                	$('#resultAjax').html(responseText);
                	uiLogged();
                }
            });
		}
	});
});
</script>