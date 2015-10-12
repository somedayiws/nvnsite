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
			<div id="titleContent">GIỚI THIỆU-自己紹介</div>
			<div id="infoContent">
				<p><a href="Trang-chu">Cổng thông tin thương mại Việt-Nhật - 日越ビジネス情報の窓口</a></p>
				<p>Liên hệ - 連絡先の情報  : <%= request.getAttribute("LienHe")==null?"":request.getAttribute("LienHe") %></p>
				<p>Điện thoại - 電話番号: <%= request.getAttribute("DienThoai")==null?"":request.getAttribute("DienThoai") %></p>
				<p>Email: <%= request.getAttribute("Email")==null?"congthongtin.vietnhat@gmail.com":request.getAttribute("Email") %></p>
			</div>
		</div>
		<div class="infoContent" id="link">
			<div id="titleContent">LIÊN KẾT-連結する</div>
			<div id="infoContent">
				<p><a href="https://www.jetro.go.jp/" target="_blank">Tổ chức Thương Mại Nhật Bản - 日本貿易振興機構</a></p>
				<p><a href="http://www.immi-moj.go.jp/" target="_blank">Cục Quản Lý Nhập Cảnh Nhật Bản - 日本入国管理局</a></p>
				<p><a href="http://www.xuatnhapcanh.com.vn/" target="_blank">Cục quản lý xuất nhập cảnh TP Hồ Chí Minh - ホーチミン市にて出入国管理局</a></p>
				<p><a href="http://www.vn.emb-japan.go.jp/index_jp.html" target="_blank">Đại sứ quán Nhật Bản tại Việt Nam - 在ベトナム日本国大使館</a></p>
				<p><a href="http://www.mofa.gov.vn/vnemb.jp/" target="_blank">Đại sứ quán Việt Nam tại Nhật Bản - 在日ベトナム国大使館</a></p>
				<p><a href="http://www.jasso.go.jp/job/" target="_blank">Tổ chức Hỗ Trợ Sinh viên tại Nhật Bản - 日本学生支援機構</a></p>
				<p><a href="http://www.jsda.or.jp/" target="_blank">Hiệp Hội Chứng Khoán Nhật Bản - 日本証券業協会</a></p>
			</div>
		</div>
		<div class="infoContent" id="connect">
			<div id="titleContent">KẾT NỐI VỚI CHÚNG TÔI-我々とのコンタクトをする</div>
			<div id="infoContent">
				<p>Để có thông báo cho các bạn về các tài liệu mới hữu ích, xin
					vui lòng theo dõi chúng tôi trên mạng xã hội.<br>あなたに最新の情報を知らせするために、Facebookに当ホームページの情報をご覧ください。</p>
				<p>Chúng tôi sẽ cập nhật cho bạn những thông tin mới nhất.<br>我々はあなたに最新の情報を更新させる。</p>
				<p id="linkconnect">
					<a><span id="facebookdiv"></span> </a> <a><span id="twitterdiv"></span>
					</a><a><span id="googlediv"></span></a>
				</p>
			</div>
		</div>
	</div>
	<div id="copyright">
		<div id="wcopyright">© 2015 COPYRIGHT BY JPVN.NET, 2015</div>
	</div>
</div>