<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String all = (String)request.getAttribute("all");
	if(all == null) all = "0";
	String moi = (String)request.getAttribute("moi");
	if(moi == null) moi = "0";
	String dich = (String)request.getAttribute("dich");
	if(dich == null) dich = "0";
	String tre = (String)request.getAttribute("tre");
	if(tre == null) tre = "0";
%>

<li class="active" id="all"><a
	href="Danh-sach-bai-dich?view=all"> <span
		class="badge pull-right"><%= all %></span> Tất cả bài dịch<br>全て翻訳文書
</a></li>
<li class="active" id="moi"><a
	href="Danh-sach-bai-dich?view=moi"> <span
		class="badge pull-right"><%= moi %></span> Bài mới<br>新しい文書
</a></li>
<li class="active" id="dich"><a
	href="Danh-sach-bai-dich?view=dich"> <span
		class="badge pull-right"><%= dich %></span> Bài đang dịch<br>翻訳中の文書
</a></li>
<li class="active" id="qua"><a
	href="Danh-sach-bai-dich?view=qua-han"> <span
		class="badge pull-right"><%= tre %></span> Bài đã quá hạn<br>期限が過ぎた文書 
</a></li>
