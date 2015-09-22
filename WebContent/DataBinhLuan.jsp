<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ArrayList<BINHLUAN> bluan = (ArrayList<BINHLUAN>)request.getAttribute("list");
	String language = request.getParameter("ngonngu");
	int j=0;
	while(bluan != null && j<bluan.size()){
		if(language.equals("vi")) {
%>
<div id="itemComment">
	<i class="fa fa-user"></i> <em><%= bluan.get(j).getTaiKhoan().getHoTen() %></em><span id="dateComment"><%=bluan.get(j).getNgayDang() %></span>
	<p><%= bluan.get(j).getPhanHoiVi() %></p>
	</div>
	<% } else { %>
	<div id="itemComment">
	<i class="fa fa-user"></i> <em><%= bluan.get(j).getTaiKhoan().getHoTen() %></em><span id="dateComment"><%=bluan.get(j).getNgayDang() %></span>
	<p><%= bluan.get(j).getPhanHoiJa() %></p>
	</div>
<%
	} j++; }
%>
</div>