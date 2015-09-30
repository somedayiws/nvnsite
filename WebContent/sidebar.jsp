<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.THONGBAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="controller.SessionCounter"%>
<%
	/* Top 10 bài viết moi */
	ArrayList<BAIVIET> topmoi = (ArrayList<BAIVIET>) request
			.getAttribute("topmoi");
	ArrayList<THONGBAO> listthongbao = (ArrayList<THONGBAO>) request
			.getAttribute("listthongbao");
%>
<div class="col-sm-3 col-md-3">
	<!-- Quảng cáo lung tung -->
	<div id="sidebar">
		<div class="sidebar-item">
			<div id="title-item"><i class="fa fa-bell-o"></i> THÔNG BÁO</div>
			<div id="content-item">
				<div class="item-style">
					<%
						int l = 0;
						while (listthongbao != null && l < listthongbao.size()) {
					%>
					<p>
						<a
							href="ChiTietThongBaoServlet?id=<%=listthongbao.get(l).getIdThongBao()%>">
							<i class="fa fa-angle-double-right"></i> <%=listthongbao.get(l).getTieuDe()%>
						</a>
					</p>
					<%
						l++;
						}
					%>
				</div>
			</div>
		</div>
		<div class="xemnhieu">
			<div id="titleTabBar">
				<div class="col-sm-6 col-md-6 active" id="pMoiNhat">
					<p>Mới nhất</p>
					<p>人気の動画</p>
				</div>
			</div>
			<ul id="contentMoiNhat">
				<%
					l = 0;
					while (topmoi != null && l < topmoi.size()) {
				%>
				<li><a
					href="BaiVietServlet?id=<%=topmoi.get(l).getIdBaiViet()%>"><i
						class="fa fa-thumbs-o-up"></i> <%=topmoi.get(l).getTenBaiVietVi() == null ? "" : topmoi
						.get(l).getTenBaiVietVi() + "<br>"%> <%=topmoi.get(l).getTenBaiVietJa() == null ? "" : topmoi
						.get(l).getTenBaiVietJa()%></a></li>
				<%
					l++;
					}
				%>
			</ul>
		</div>
		<div id="them">
			<%
				SessionCounter counter = (SessionCounter) session
						.getAttribute("counter");
				request.getRemoteAddr();
			%>
			<p>
				<span id="icon"><i class="fa fa-users fa-4x"></i> <br>
					Views - 履歴</span><span id="count"><%=counter.getActiveView()%></span>
			</p>
			<p>
				<span id="icon"><i class="fa fa-globe fa-4x"></i> <br>Online
					- 直結</span><span id="count"><%=counter.getActiveSessionNumber()%></span>

			</p>
		</div>
		<!-- 			Quảng cáo banner -->
		<div class="adv300x250">
			<img src="http://placehold.it/300x250">
		</div>
		<!-- 			Quảng cáo banner -->
	</div>
</div>
