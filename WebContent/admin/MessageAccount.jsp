<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		if(username!=null){
			String result = (String)request.getAttribute("result");
		
%>
<p><%=result.equals("MoiTao")? "Mới tạo - 新規" : (result.equals("CanhCao1")) ? "Cảnh cáo lần 1 - 第1回目の警告" : (result.equals("CanhCao2")) ? "Cảnh cáo lần 2 - 第2回目の警告" : (result.equals("CanhCao3")) ? "Cảnh cáo lần 3 - 第3回目の警告" : (result.equals("KhoaTK") )? "Khóa tài khoản - アカウントをロックする。" : "Mới tạo - 新規"%></p>
<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	

														