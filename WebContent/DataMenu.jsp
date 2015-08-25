<%@page import="model.bean.BINHLUAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.BAIVIET"%>
<%@page import="model.bean.DANHMUC"%>

<%
	/* Top 50 danh muc được phép hiển thị */
	ArrayList<DANHMUC> listdanhmuc = (ArrayList<DANHMUC>)request.getAttribute("listdanhmuc");
%>
<!-- Kết thúc quá trình lấy dữ liệu -->
<!-- Khởi tạo các biến cần thiết -->
<form class="navbar-form navbar-right" role="search"
	style="margin-right: 20px; margin-top: 20px;">
	<div class="form-group">
		<input type="text" class="form-control"
			placeholder="Tìm kiếm - Nhật ngữ">
	</div>
	<button type="submit" class="btn btn-default">Search</button>
</form>
<!-- Kết thúc khởi tạo -->

<img alt="Logo" src="images/trangchu/logo-vietnhat24h.png"
	style="width: 100%; height: 180px; margin-top: -20px;">
<!-- menu ngang -->
<nav class="navbar navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<img alt="Tiếng Việt" src="images/viet.gif" style="height: 55px;"
			id="ngonngu"> <img alt="Tiếng Nhật" src="images/nhat.gif"
			style="height: 55px;" id="ngonngu">
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#" class="fa fa-home fa-2x"></a></li>
			<%
				int i = 0;
				while(listdanhmuc != null && i < listdanhmuc.size() && i<12) {
			%>
			<li><a href="#"> <small class=vi><%=listdanhmuc.get(i).getTenDanhMucVi()%></small><br>
				<small class=ja><%=listdanhmuc.get(i).getTenDanhMucJa()%></small></a></li>
			<%
				i++; } 
				if(listdanhmuc != null && i < listdanhmuc.size()){
			%>
			<!-- <li><a href="#"> <small class=vi>Thông Tin</small><br><small class=ja>じょうほう </small></a></li> -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <small class=vi>Danh
						Mục</small><br>
				<small class=ja>カタログ</small> <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<%
						while(listdanhmuc != null && i < listdanhmuc.size()) {
					%>
					<li><a href="#"><%=listdanhmuc.get(i).getTenDanhMucVi()%>-<%=listdanhmuc.get(i).getTenDanhMucJa()%></a></li>
					<%
						i++; }
					%>
				</ul></li>
			<%
				}
			%>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
</div>
</nav>
