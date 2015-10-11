<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	/* Top 10 bài viết đầu tiên được hiển thị */
	ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
	int i = 0;
	while(listbaiviet != null && i<listbaiviet.size()){
%>
	<div class="baivieti col-xs-12 col-sm-12 col-md-12">
			<a href="Xem-bai-viet?id=<%= listbaiviet.get(i).getIdBaiViet()%>" class="thongtinthem">
				<img src="<%=listbaiviet.get(i).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(i).getLienKet()%>"><strong><i
				class="fa fa-user"></i> <%=listbaiviet.get(i).getTaiKhoan().getHoTen()%></strong>
				<em> <i class="fa fa-calendar"></i> <%=listbaiviet.get(i).getNgayDang()%></em>
				<em><i class="fa fa-eye"></i> <%=listbaiviet.get(i).getLuotXem()%>
				</em>
			</a>
			<div class="motabai">
				<a href="Xem-bai-viet?id=<%= listbaiviet.get(i).getIdBaiViet()%>">
				<%= listbaiviet.get(i).getTenBaiVietVi()== null ? "" : listbaiviet.get(i).getTenBaiVietVi() + "<br>" %> 
				<%= listbaiviet.get(i).getTenBaiVietJa()== null ? "" : listbaiviet.get(i).getTenBaiVietJa() %>
				</a>
				<p>
					<% if(listbaiviet.get(i).getMoTaVi() != null) { %>
						<%= listbaiviet.get(i).getMoTaVi().length()>90 ? (listbaiviet.get(i).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaVi() %><br>
					<% } %>
					<% if(listbaiviet.get(i).getMoTaJa() != null) { %>
						<%= listbaiviet.get(i).getMoTaJa().length()>60 ? (listbaiviet.get(i).getMoTaJa().substring(0, 60)+"..."): listbaiviet.get(i).getMoTaJa() %></p>
					<% } %>
				<a href="Xem-bai-viet?id=<%= listbaiviet.get(i).getIdBaiViet()%>" class="xemthem">Xem thêm - 詳細</a>
			</div>
	</div>
<% 
	i++; } 
%>