<%@page import="model.bean.LIENHE"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	LIENHE tb = (LIENHE) request.getAttribute("thongbao");
%>

<%
	if (tb.getTaiKhoan() != null && !tb.getTaiKhoan().trim().equals("")) {
%>
<input type="hidden" name="taikhoan" value="<%=tb.getTaiKhoan()%>">
<%
	}
%>
<!-- Đơn vị quảng cáo -->
<div class="form-group">
	<label for="company"> Email - メール </label> <input type="text"
		class="form-control" name="email" maxlength="200"
		value="<%=tb.getEmail()%>" readonly="readonly">
</div>
<div class="form-group">
	<label for="company"> Nội dung - 内容</label>
	<textarea rows="5" cols="10" name="noidung" class="form-control" readonly="readonly"><%=tb.getNoiDung()%></textarea>
</div>
<div class="form-group">
	<label for="company"> Tiêu đề - タイトル</label> <input type="text"
		class="form-control" name="tieude" value="<%=tb.getTieuDe()%>"
		maxlength="200">
</div>
<div class="form-group">
	<label for="company"> Trả lời - </label>
	<textarea rows="5" cols="10" name="traloi" class="form-control"></textarea>
</div>
