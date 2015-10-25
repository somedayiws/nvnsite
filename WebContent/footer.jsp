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
				<p><a href="Trang-chu">Cổng thông tin thương mại Việt-Nhật <br> 日越ビジネス情報の窓口</a></p>
				<p>Liên hệ - 連絡先の情報  : <%= request.getAttribute("LienHe")==null?"":request.getAttribute("LienHe") %></p>
				<p>Điện thoại - 電話番号: <%= request.getAttribute("DienThoai")==null?"":request.getAttribute("DienThoai") %></p>
				<p>Email: <%= request.getAttribute("Email")==null?"congthongtin.vietnhat@gmail.com":request.getAttribute("Email") %></p>
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
				<p class ="itemconnect" id="facebookitem"><a href="#"><i class="fa fa-facebook"></i> Facebook</a></p>
				<p class ="itemconnect" id="googleitem"><a href="#"><i class="fa fa-google-plus"></i> Google+</a></p>
			</div>
		</div>
	</div>
	<div id="copyright">
		<div id="wcopyright">© 2015 COPYRIGHT BY JPVN.NET, 2015</div>
	</div>
</div>