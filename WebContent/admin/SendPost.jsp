<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="model.bean.TAIKHOAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../check_validate/formEdit.js"></script>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/sendPost.css">
<script type="text/javascript"
	src="../check_validate/checkCreate(Admin).js"></script>
<title>Chuyển bài viết</title>
<script type="text/javascript">
	
</script>
</head>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
	/**Receive data from server*/
	ArrayList<TAIKHOAN> listAccountCTV = (ArrayList<TAIKHOAN>) request.getAttribute("listAccountCTV");

	//Lấy ghi chú của bài viết
	String note =(String)request.getAttribute("note");

	String idPost = (String)request.getAttribute("idPost");
	ArrayList<TAIKHOAN> listAccountByStatus =(ArrayList<TAIKHOAN>)request.getAttribute("listAccountByStatus");
	TAIKHOAN accountErrorTranslate =(TAIKHOAN) request.getAttribute("accountErrorTranslate");
	String status =(String)request.getAttribute("status");
	
	/*
		Lấy ngôn ngữ bài viết
		0 : Song ngữ
		1 : Tiếng việt
		2 : Tiếng nhật
	*/
	String languagePost =(String)request.getAttribute("languagePost");
	
%>
<body>
<%if(username!=null){ %>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>
		<%@include file="Menu.jsp"%>
		<div id="content">
		
		
		<!-- Hiển thị ngôn ngữ bài viết -->
		
		<div style="text-align: center;">
		<%System.out.println(languagePost + "Ngôn ngữ"); %>
			<h3>Dịch nội dung bài viết sang - 
			<%if(languagePost == "1"){ %><span class="label label-success">Tiếng việt - </span>
			<%}else if(languagePost == "2") {%><span class="label label-success">Tiếng nhật -</span>
			<%}else{ %><span class="label label-success">Song ngữ -</span> <%} %></h3>
		</div>
		<div class="table-responsive">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên cộng tác viên - </th>
						<th>Email - メールアドレス</th>
						<th>Ngôn ngữ - </th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					if(status!=null){
					if(status.equals("HuyDich")){
						if(listAccountByStatus!=null){
							for(int i=0;i<listAccountByStatus.size();i++){
					%>
						<tr>
						<td><%=listAccountByStatus.get(i).getIdTaiKhoan() %></td>
						<td><%=listAccountByStatus.get(i).getHoTen() %></td>
						<td><%=listAccountByStatus.get(i).getEmail() %></td>
						<td><%=listAccountByStatus.get(i).getNgonNgu().equals("vi")?"Việt -> Nhật":"Nhật -> Việt" %></td>
						
						
						<td><button class="btn btn-primary" data-toggle="modal"
								data-target="#myModal<%=listAccountByStatus.get(i).getIdTaiKhoan()%>">Chuyển
								bài - 投稿を送信</button></td>

					</tr>
					<%
							}
						}else{
					%>
						<div class="panel panel-warning">
      <div class="panel-heading">Cảnh báo - 警告</div>
      <div class="panel-body">Không có tài khoản nào dịch được bài này - </div>
    </div>
					<%}}
					else if(status.equals("LoiDich")){
						if(accountErrorTranslate!=null){
					%>
						<tr>
						<td><%=accountErrorTranslate.getIdTaiKhoan() %></td>
						<td><%=accountErrorTranslate.getTenTaiKhoan() %></td>
						<td><%=accountErrorTranslate.getEmail() %></td>
						<td><button class="btn btn-primary" data-toggle="modal"
								data-target="#myModal<%=accountErrorTranslate.getIdTaiKhoan()%>">Chuyển
								bài - 投稿を送信</button></td>
					</tr>
					<%
						}
						else{
						%>
						<div class="panel panel-warning">
      <div class="panel-heading">Cảnh báo - 警告</div>
      <div class="panel-body">Không có lỗi bài dịch -  </div>
    </div>
					<%}	
						}
					}
					else{
						if (listAccountCTV != null) {													
							for (int i = 0; i < listAccountCTV.size(); i++) {
					%>
					<tr>
						<td><%=listAccountCTV.get(i).getIdTaiKhoan() %></td>
						<td><%=listAccountCTV.get(i).getHoTen() %></td>
						<td><%=listAccountCTV.get(i).getEmail() %></td>
						<td><%=listAccountCTV.get(i).getNgonNgu().equals("vi")?"Việt -> Nhật":"Nhật -> Việt" %></td>	
						
						<!-- Nếu ngôn ngữ bài viết là tiếng việt thì gợi ý ctv có ngôn ngữ là tiếng nhật nghĩa là không cho ctv có ngôn ngữ tiếng việt dịch
							Nếu ngôn ngữ bài viết là tiếng nhật thì gợi ý ctv có ngôn ngữ là tiếng việt nghĩa là không cho ctv có ngôn ngữ tiếng nhật dịch
							Nếu là song ngữ thì luôn cho hiển thị nút chuyển bài
						 -->				
						 <td><button class="btn btn-primary" data-toggle="modal" 
						 <%if(languagePost == "1"){
							 //Ngôn ngữ bài viết là tiếng việt							 
								if(listAccountCTV.get(i).getNgonNgu().equals("vi")){
									//Ngôn ngữ ctv là tiếng việt							
						%>
								disabled="disabled"
						<%}
								
						 } else if( languagePost == "2") {
							//Ngôn ngữ bài viết là tiếng nhật
								if(listAccountCTV.get(i).getNgonNgu().equals("ja")){
									//Ngôn ngữ ctv là tiếng nhật
						%>
							disabled="disabled"
						<%}} %> 
						data-target="#myModal<%=listAccountCTV.get(i).getIdTaiKhoan()%>">Chuyển
								bài - 投稿を送信</button></td>
					</tr>
					<%}
						}
						}
					%>

				</tbody>
			</table>
			</div>
			<!-- Modal -->
			<%for(int i=0;i<listAccountCTV.size();i++){ %>
			<div id="myModal<%=listAccountCTV.get(i).getIdTaiKhoan()%>"
				class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->

					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Lời nhắn - メッセージ</h3>

						</div>
						<div id="message">
							<form action="SendPostServlet" method="post">
								<input type="text" class="form-control" name="idPost"
									value="<%=idPost%>" readonly="readonly"> 
								<input
									type="text" class="form-control" placeholder="From - から: admin"
									readonly="readonly"> 
								<input type="text"
									class="form-control" name="idAccount"
									placeholder="To - まで: <%=listAccountCTV.get(i).getTenTaiKhoan()%>"
									value="<%=listAccountCTV.get(i).getIdTaiKhoan()%>" readonly="readonly">
								<div class="form-group">
								<%if(note!=null && !note.trim().equals("")){ %>
      								<div style="max-height: 200px;overflow: scroll">
      								<h4>Tin nhắn bài viết - </h4>
	      								<%=note %>
	      							</div>
      							<%} %>
      							</div>
								<div class="form-group col-md-10 col-md-offset-1" >
									<label>Lời nhắn - メッセージ:</label>
									<textarea class="form-control" rows="5" id="message"
										name="message">
									</textarea>
								</div>
								<button type="submit" id ="btnSend" class="btn btn-primary btn-sm">Gởi bài - 送信</button>
								<button type="button" class="btn btn-default"
								data-dismiss="modal">Quay lại - </button>
							</form>

						</div>
					</div>

				</div>
			</div>
			<%} %>
		</div>
	</div>
<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	
</body>
</html>
