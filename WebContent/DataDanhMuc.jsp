<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ArrayList<DANHMUC> list = (ArrayList<DANHMUC>) request.getAttribute("list");
	int i = 0;
	while (list != null && i < list.size()) {
		if (list.get(i).getBaiViets() != null
				&& list.get(i).getBaiViets().size() > 0) {
%>
<!-- Bắt đầu 1 danh mục -->
<div class="danhmucx"
	id="<%=list.get(i).getIdDanhMuc().trim().substring(2)%>">
	<p id="titleDanhMuc">
		<strong
			onclick="loadData('Danh-sach-bai-viet','<%=list.get(i).getIdDanhMuc().trim()%>');">
			<span id="iconImg"> <%
 	if (list.get(i).getIcon() != null) {
 %> <img src="<%=list.get(i).getIcon()%>"> <%
 	} else {
 %> <i class="fa fa-star-o"></i> <%
 	}
 %>
		</span> <span><%=list.get(i).getTenDanhMucVi()%></span> - <%=list.get(i).getTenDanhMucJa()%></strong>
		<a id="AllPosts"
			href="Danh-sach-bai-viet?id=<%=list.get(i).getIdDanhMuc().trim()%>">
			Xem tất cả - 全て<i class="fa fa-chevron-right"></i>
		</a>
	</p>

	<div class="row">
		<div class="row">
			<div id="wrapper_carousel" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<%
						ArrayList<BAIVIET> listbaiviet = list.get(i).getBaiViets();
								int j = 0;
								if (listbaiviet != null && j < listbaiviet.size()) {
					%>
					<div class="item active">
						<div class="baivieti col-xs-12 col-sm-12 col-md-12">
							<a
								href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>"
								class="thongtinthem"> <img
								src="<%=listbaiviet.get(j).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(j).getLienKet()%>"><strong><i
									class="fa fa-user"></i> <%=listbaiviet.get(j).getTaiKhoan().getHoTen()%></strong>
								<em> <i class="fa fa-calendar"></i> <%=listbaiviet.get(j).getNgayDang()%></em>
								<em><i class="fa fa-eye"></i> <%=listbaiviet.get(j).getLuotXem()%>
							</em>
							</a>
							<div class="motabai">
								<a
									href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
									<%=listbaiviet.get(j).getTenBaiVietVi()==null?"":listbaiviet.get(j).getTenBaiVietVi()%> 
									<%=listbaiviet.get(j).getTenBaiVietJa()==null?"":"<br>"+listbaiviet.get(j).getTenBaiVietJa()%>
								</a>
								<p>
									<%
										if (listbaiviet.get(j).getMoTaVi() != null) {
									%>
									<%=listbaiviet.get(j).getMoTaVi().length() > 90 ? (listbaiviet
									.get(j).getMoTaVi().substring(0, 90) + "...")
									: listbaiviet.get(j).getMoTaVi()%><br>
									<%
										}
									%>
									<%
										if (listbaiviet.get(j).getMoTaJa() != null) {
									%>
									<%=listbaiviet.get(j).getMoTaJa().length() > 90 ? (listbaiviet
									.get(j).getMoTaJa().substring(0, 90) + "...")
									: listbaiviet.get(j).getMoTaJa()%></p>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<%
						j++;
								}
					%>

				</div>
			</div>
		</div>
		<!-- danh sách bài viết mới -->
		<div class="col-xs-12 col-sm-12 col-md-12"
			style="background-color: white;" id="binhluan<%=i%>">
			<%
				j = 0;
						while (listbaiviet != null && j < listbaiviet.size()) {
			%>
			<div class="row">
				<!-- danh sách các bài viết trong nhóm -->
				<div class="col-xs-2 col-md-1">
					<img alt="Ảnh đại diện" src="<%=listbaiviet.get(j).getLienKet()==null?"images/baiviet.jpg":listbaiviet.get(j).getLienKet()%>"
						style="width: 70px;">
				</div>
				<div class="col-xs-10 col-md-11">
					<a href="Xem-bai-viet?id=<%=listbaiviet.get(j).getIdBaiViet()%>">
						<%=listbaiviet.get(j).getTenBaiVietVi()==null?"":listbaiviet.get(j).getTenBaiVietVi()%> 
						<%=listbaiviet.get(j).getTenBaiVietJa()==null?"":"<br>"+listbaiviet.get(j).getTenBaiVietJa()%>
					</a>
				</div>
			</div>
			<%
				j++;
						}
			%>
		</div>
		<!-- Kết thúc binh luận -->
	</div>
</div>
<%
	} else {
%>
<div class="danhmucx"
	id="<%=list.get(i).getIdDanhMuc().trim().substring(2)%>"
	style="display: none;"></div>
<%
	}
		i++;
	}
%>