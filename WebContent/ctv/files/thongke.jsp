<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<strong id="tke"><i class="fa fa-area-chart"></i> Thống kê</strong>
<ul class="nav nav-pills nav-stacked" id="capnhat">
	<li class="active" id="all"><a
		href="DanhSachBaiDichServlet?view=all"> <span
			class="badge pull-right">0</span> Tất cả bài dịch<br>全て翻訳文書
	</a></li>
	<li class="active" id="moi"><a
		href="DanhSachBaiDichServlet?view=moi"> <span
			class="badge pull-right">0</span> Bài mới<br>新しい文書
	</a></li>
	<li class="active" id="dich"><a
		href="DanhSachBaiDichServlet?view=dich"> <span
			class="badge pull-right">0</span> Bài đang dịch<br>翻訳中の文書
	</a></li>
	<li class="active" id="qua"><a
		href="DanhSachBaiDichServlet?view=qua-han"> <span
			class="badge pull-right">0</span> Bài đã quá hạn<br>期限が過ぎた文書 
	</a></li>
</ul>