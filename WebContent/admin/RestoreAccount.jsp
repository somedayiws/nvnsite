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
<script type="text/javascript"
	src="../check_validate/checkCreate(Admin).js"></script>
<title>Đăng ký tài khoản</title>
<script type="text/javascript">
	
</script>
</head>
<%
	/**Receive data from server*/
	ArrayList<TAIKHOAN> listAccountDeleted = (ArrayList<TAIKHOAN>) request
			.getAttribute("listAccountDeleted");
%>
<body>
	<div class="container-fluid">
		<%@include file="header_ver_1.jsp"%>


		<%@include file="Menu.jsp"%>



		<div style="margin-top: 10px">
			<div class="col-md-6 col-md-offset-3">
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tài khoản</th>
								<th></th>
							</tr>
						</thead>
						<%
							for (int i = 0; i < listAccountDeleted.size(); i++) {
						%>
						<tbody>
							<tr>
								<td><%=listAccountDeleted.get(i).getIdTaiKhoan()%></td>
								<td><%=listAccountDeleted.get(i).getTenTaiKhoan()%></td>
								<td><a
									href="RestoreServlet?idAccount=<%=listAccountDeleted.get(i).getIdTaiKhoan()%>"><button
											type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-pencil"></span>Phục hồi
										</button></a></td>
							</tr>
						</tbody>


						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
