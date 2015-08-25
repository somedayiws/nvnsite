<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	/* Top 10 bài viết đầu tiên được hiển thị */
	ArrayList<BAIVIET> listbaiviet = (ArrayList<BAIVIET>)request.getAttribute("listbaiviet");
	/* Chi số hiện tại */
	String son = (String)request.getAttribute("n");
	int n = Integer.parseInt(son);
	int i = 0;
	while(listbaiviet != null && i<listbaiviet.size()){
%>

<!-- Bắt đầu 1 danh mục -->
			<div
				style="float: left; min-width: 280px; min-height: 215px; width: 47%; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; margin: 10px; box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) inset;">
				<strong><i class="fa fa-star-o"></i> <%= listbaiviet.get(i).getTenBaiVietVi() %>
					- <%= listbaiviet.get(i).getTenBaiVietJa() %></strong>
				<div class="row">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<a href="BaiVietServlet?id=<%= listbaiviet.get(i).getIdBaiViet()%>"> <img alt="Ảnh đại diện" src="images/baiviet.jpg"
								style="width: 50px; float: left;"> <small><%= listbaiviet.get(i).getTaiKhoan().getHoTen() %></small>
								<p><%= listbaiviet.get(i).getTenBaiVietVi() %>
									-
									<%= listbaiviet.get(i).getTenBaiVietVi() %>
								</p>
							</a>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12">
							<% if(listbaiviet.get(i).getMoTaVi() != null) { %>
							<p><%= listbaiviet.get(i).getMoTaVi().length()>90 ? (listbaiviet.get(i).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaVi() %></p>
							<% } %>
							<% if(listbaiviet.get(i).getMoTaJa() != null) { %>
							<p><%= listbaiviet.get(i).getMoTaJa().length()>90 ? (listbaiviet.get(i).getMoTaJa().substring(0, 90)+"..."): listbaiviet.get(i).getMoTaJa() %></p>
							<% } %>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12" style="background-color: white;" id="tuychonviet">
						<a href="BaiVietServlet?id=<%= listbaiviet.get(i).getIdBaiViet()%>"><i class="fa fa-comments-o"></i> Bình luận - コメント</a>
						<a href="BaiVietServlet?id=<%= listbaiviet.get(i).getIdBaiViet()%>"><i class="fa fa-hand-o-right"></i> Xem thêm - 詳細</a>
					</div>
				</div>
			</div>
			<% 
				i++; } 
			%>