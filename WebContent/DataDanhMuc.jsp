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
			<strong><i class="fa fa-star-o"></i> <%=list.get(i).getTenDanhMucVi()==null ? "" : list.get(i).getTenDanhMucVi() + " - "%>
				<%=list.get(i).getTenDanhMucJa()==null ? "" : list.get(i).getTenDanhMucJa()%></strong>
			<div class="row">
				<div class="row">
					<div id="wrapper_carousel" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<%
								ArrayList<BAIVIET> listbaiviet = list.get(i).getBaiViets();
									int j=0;
									if(listbaiviet != null && j<listbaiviet.size()){
							%>
							<div class="item active">
								<div class="baivieti col-xs-12 col-sm-12 col-md-12">
									<a
										href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>"
										class="thongtinthem"> <embed src="<%=listbaiviet.get(j).getLienKet()%>"><strong>Tác
											giả : <%=listbaiviet.get(j).getTaiKhoan().getHoTen()%></strong><br>
										<em> Ngày : <%=listbaiviet.get(j).getNgayDang()%><br>
											View : <%=listbaiviet.get(j).getLuotXem()%>
									</em>
									</a>
									<div class="motabai">
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
											<%=listbaiviet.get(j).getTenBaiVietVi()%> <br> <%=listbaiviet.get(j).getTenBaiVietJa()%>
										</a>
										<p>
											<%
												if(listbaiviet.get(j).getMoTaVi() != null) {
											%>
											<%=listbaiviet.get(j).getMoTaVi().length()>90 ? (listbaiviet.get(j).getMoTaVi().substring(0, 90)+"..."): listbaiviet.get(j).getMoTaVi()%><br>
											<%
												}
											%>
											<%
												if(listbaiviet.get(j).getMoTaJa() != null) {
											%>
											<%=listbaiviet.get(j).getMoTaJa().length()>90 ? (listbaiviet.get(j).getMoTaJa().substring(0, 90)+"..."): listbaiviet.get(j).getMoTaJa()%></p>
										<%
											}
										%>
										<a
											href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>"
											class="xemthem">Xem thêm ...</a>
									</div>
								</div>
							</div>
							<%
								j++; }
							%>

						</div>
						<a class="left carousel-control"
							 data-slide="prev"><span class="sr-only">Previous</span>
						</a> <a class="right carousel-control"
							 data-slide="next"><span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;">
					<em><i class="fa fa-list-ul"></i> Các bài viết liên quan - 関連</em>
				</div>

				<!-- danh sách bài viết mới -->
				<div class="col-xs-12 col-sm-12 col-md-12"
					style="background-color: white;" id="binhluan<%=i%>">
					<%
						j = 0;
										while(listbaiviet != null && j<listbaiviet.size()){
					%>
					<div class="row">
						<!-- danh sách các bài viết trong nhóm -->
						<div class="col-xs-1 col-sm-1 col-md-1">
							<img alt="Ảnh đại diện" src="images/baiviet.jpg"
								style="width: 20px;">
						</div>
						<div class="col-xs-10 col-sm-11 col-md-11">
							<a
								href="BaiVietServlet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
								<%=listbaiviet.get(j).getTenBaiVietVi()%><br><%=listbaiviet.get(j).getTenBaiVietJa()%>
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
						onclick="loadData('DanhSachBaiVietServlet','<%=list.get(i).getIdDanhMuc().trim()%>');">
						<span class="glyphicon glyphicon-sort-by-attributes"></span>Xem
						thêm - 詳細
					</button>
				</div>
			</div>
		</div>
<% 
		} i++; } 
%>