<%@page import="model.bean.BAIVIET"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.TAIKHOAN"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		TAIKHOAN user = (TAIKHOAN)request.getSession().getAttribute("user");
		ArrayList<BAIVIET> list = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
		int i = 0;
		while(list != null && i<list.size()) {
		  	if(user != null && user.getNgonNgu().equals("vi")) {
%>
				  <tr class="noidung1">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
				  	</td>
				  </tr>
				  
				  <tr class="noidung1">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
				  	</td>
				  </tr>
				  <tr class="noidung1">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
				  	</td>
				  </tr>
				  <tr class="noidung1">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
				  	</td>
				  </tr>
				  <tr class="noidung1">
				  	<td><%= list.get(i).getIdBaiViet() %></td>
				  	<td><%= list.get(i).getTenBaiVietVi() %></td>
				  	<td><%= list.get(i).getMoTaVi() %></td>
				  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
				  	<td class="ctv-chon">
				  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
				  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  		<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
				  	</td>
				  </tr>
			  <% } else { %>
			  		<tr class="noidung">
					  	<td><%= list.get(i).getIdBaiViet() %></td>
					  	<td><%= list.get(i).getTenBaiVietJa() %></td>
					  	<td><%= list.get(i).getMoTaJa() %></td>
					  	<td><input type="checkbox" name="chon" value="<%= list.get(i).getIdBaiViet() %>"></td>
					  	<td class="ctv-chon">
					  		<a href="XemBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
					  		<a href="DichBaiDichServlet?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a>
					  		<%-- <a href="Xem-bai-dich?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-eye-slash"> Xem-観覧する</i></a>
				  			<a href="Dich-bai?id=<%= list.get(i).getIdBaiViet() %>"><i class="fa fa-pencil-square-o"> Dich-翻訳する</i></a> --%>
					  	</td>
					  </tr>
	<% } %>
<% i++; } %>