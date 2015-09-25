<%@page import="model.bean.THONGBAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	THONGBAO tb = (THONGBAO)request.getAttribute("thongbao");
%>
<input type="hidden" name="id" value="<%= tb.getIdThongBao()%>">
<!-- Đơn vị quảng cáo -->
<div class="form-group">
	<label for="company"> Tiêu đề - 企業広告</label>
	<input type="text" class="form-control" name="TieuDe" value="<%= tb.getTieuDe()%>" maxlength="200">
</div>
<div class="form-group">
	<label for="company"> Nội dung thông báo - 企業広告</label>
	<textarea rows="5" cols="10" name="NoiDung" class="form-control"><%= tb.getNoiDung()%></textarea>
</div>
<div class="form-group">
	<label for="company"> Gửi đến - 企業広告</label>
	<input type="text" class="form-control" name="GuiDen" value="<%= tb.getGuiDen()%>" maxlength="200">
</div>
