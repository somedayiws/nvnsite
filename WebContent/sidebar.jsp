<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Quảng cáo lung tung -->
<div id="sidebar">
<div class="col-sm-3 col-md-3">
	<!-- 			Quảng cáo banner -->
	<div class="adv300x250">
		<img src="http://placehold.it/300x250">
	</div>
	<!-- 			Quảng cáo banner -->
	<div id="danhmuchot" class="facebookdiv">
		<div class="fb-page"
			data-href="https://www.facebook.com/congthongtinvietnhat"
			data-small-header="false" data-adapt-container-width="true"
			data-hide-cover="true" data-show-facepile="true"
			data-show-posts="false">
			<div class="fb-xfbml-parse-ignore">
				<blockquote cite="https://www.facebook.com/congthongtinvietnhat">
					<a href="https://www.facebook.com/congthongtinvietnhat">Cổng
						Thông Tin Việt Nhật</a>
				</blockquote>
			</div>
		</div>
	</div>
	<div class="xemnhieu">
		<div id="titleTabBar">
			<div class="col-sm-6 col-md-6 active" id="pXemNhieu"
				onmousemove="showXemNhieu()">
				<p>Đọc nhiều</p>
				<p>人気の動画</p>
			</div>
			<div class="col-sm-6 col-md-6" id="pMoiNhat"
				onmousemove="showMoiNhat()">
				<p>Mới nhất</p>
				<p>人気の動画</p>
			</div>
		</div>
		<ul id="contentXemNhieu">
			<%
				i = 0;
				while (top != null && i < top.size()) {
			%>
			<li><a href="BaiVietServlet?id=<%=top.get(i).getIdBaiViet()%>"><i
					class="fa fa-thumbs-o-up"></i> <%=top.get(i).getTenBaiVietVi()==null?"":top.get(i).getTenBaiVietVi()+"<br>"%>
					<%=top.get(i).getTenBaiVietJa()==null?"":top.get(i).getTenBaiVietJa()%></a></li>
			<%
				i++;
				}
			%>
		</ul>
		<ul id="contentMoiNhat" style="display: none;">
			<%
				i = 0;
				while (topmoi != null && i < topmoi.size()) {
			%>
			<li><a href="BaiVietServlet?id=<%=topmoi.get(i).getIdBaiViet()%>"><i
					class="fa fa-thumbs-o-up"></i> <%=topmoi.get(i).getTenBaiVietVi()==null?"":topmoi.get(i).getTenBaiVietVi()+"<br>"%>
					<%=topmoi.get(i).getTenBaiVietJa()==null?"":topmoi.get(i).getTenBaiVietJa()%></a></li>
			<%
				i++;
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
</div>
</div>
