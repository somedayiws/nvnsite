<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		<%
			ArrayList<DANHMUC> list = (ArrayList<DANHMUC>)request.getAttribute("list");
			int i = 0;
			while(list != null && i<list.size()){
				if(list.get(i).getBaiViets()!= null && list.get(i).getBaiViets().size()>0) {
		%>
		<!-- Bắt đầu 1 danh mục -->
		<div class="danhmucx">
			<strong><i class="fa fa-star-o"></i> <%= list.get(i).getTenDanhMucVi() %>
				- <%= list.get(i).getTenDanhMucJa() %></strong>
			<div class="row">
				<div class="row">
					<%
							ArrayList<BAIVIET> bviet = list.get(i).getBaiViets();
							int j=0;
							if(bviet != null && j<bviet.size()){
					%>
					<!-- Bài viết nổi bậc -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<a href="BaiVietServlet?id=<%= bviet.get(j).getIdBaiViet()%>"> <img alt="Ảnh đại diện" src="images/baiviet.jpg" style="width: 50px; float: left;">
							<small><%= bviet.get(j).getTaiKhoan().getHoTen() %></small>
							<p>
								<%= bviet.get(j).getTenBaiVietVi() %>
								-
								<%= bviet.get(j).getTenBaiVietJa() %>
							</p>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<% if(bviet.get(j).getMoTaVi() != null) { %>
						<p><%= bviet.get(j).getMoTaVi().length()>150 ? (bviet.get(j).getMoTaVi().substring(0, 150)+"..."): bviet.get(j).getMoTaVi() %></p>
						<% } %>
						<% if(bviet.get(j).getMoTaJa() != null) { %>
						<p><%= bviet.get(j).getMoTaJa().length()>150 ? (bviet.get(j).getMoTaJa().substring(0, 150)+"..."): bviet.get(j).getMoTaJa() %></p>
						<% } %>
					</div>
					<% j++; } %>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;">
					<em><i class="fa fa-list-ul"></i> Các bài viết liên quan - 関連記事</em>
				</div>

				<!-- danh sách bài viết mới -->
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;" id="binhluan<%= i %>">
					<%
							while(bviet != null && j<bviet.size()){
					%>
					<div class="row">
						<!-- danh sách các bài viết trong nhóm -->
						<div class="col-xs-1 col-sm-1 col-md-1">
							<img alt="Ảnh đại diện" src="images/baiviet.jpg"
								style="width: 20px;">
						</div>
						<div class="col-xs-10 col-sm-11 col-md-11">
							<a href="BaiVietServlet?id=<%= bviet.get(j).getIdBaiViet()%>"> <%= bviet.get(j).getTenBaiVietVi() %> - <%= bviet.get(j).getTenBaiVietJa() %>
							</a>
						</div>
					</div>
					<% 
						j++; } 
					%>
				</div>
				<!-- Kết thúc binh luận -->
				<div class="col-xs-12 col-sm-12 col-md-12 text-right">
					<button type="button" class="btn btn-default btn-xs"
						onclick="loadData('DanhSachBaiVietServlet','<%= list.get(i).getIdDanhMuc().trim() %>');">
						<span class="glyphicon glyphicon-sort-by-attributes"></span>Xem thêm - 詳細
					</button>
				</div>
			</div>
		</div>
		<% 
			} i++; } 
		%>