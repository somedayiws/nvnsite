<%@page import="model.bean.THONGBAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	THONGBAO tb = (THONGBAO) request.getAttribute("thongbao");
%>
<input type="hidden" name="id" value="<%=tb.getIdThongBao()%>">
<!-- Đơn vị quảng cáo -->
<div class="form-group">
	<label for="company"> Tiêu đề - タイトル</label> <input type="text"
		class="form-control" name="TieuDe" value="<%=tb.getTieuDe()%>"
		maxlength="200">
</div>
<div class="form-group">
	<label for="company"> Nội dung thông báo - お知らせの内容</label>
	<textarea rows="5" cols="10" name="NoiDung" class="form-control"><%=tb.getNoiDung()%></textarea>
</div>
<div class="form-group">
	<label for="company"> Gửi đến - 送信する</label> <select
		class="form-control" id="typeSend2" name="typeSend2"
		onchange="chonGui2('<%=tb.getGuiDen()%>')">
		<option value="DienDan"
			<%=tb.getGuiDen().equals("DienDan") ? "selected" : ""%>>Toàn
			diễn đàn - 全フォーラム</option>
		<option value="TenThanhVien"
			<%=!tb.getGuiDen().equals("DienDan") ? "selected" : ""%>>Thành
			viên - 会員</option>
	</select>
</div>
<div class="form-group" style="display: none;" id="GuiDenForm2">
	<label for="company"> Tên thành viên - 会員の氏名</label> <input type="text"
		class="form-control" name="GuiDen" maxlength="200"
		value="<%=tb.getGuiDen()%>" id="GuiDen2">
</div>
<script type="text/javascript">
	function chonGui2(type) {
		var x = type;
		if ($('#typeSend2').val() == "DienDan") {
			$('#GuiDenForm2').attr("style", "display: none;");
			$('#GuiDen2').attr("value", "DienDan");
		} else {
			if (x != "DienDan") {
				$('#GuiDen2').attr("value", x);
			} else {
				$('#GuiDen2').text("");
			}
			$('#GuiDenForm2').removeAttr("style");
		}
	}
	chonGui2();
</script>
