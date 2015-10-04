<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		if(username!=null){
			String result = (String)request.getAttribute("result");
		
%>
<p><%=result.equals("MoiTao")? "Mới tạo" : (result.equals("CanhCao1")) ? "Cảnh cáo lần 1" : (result.equals("CanhCao2")) ? "Cảnh cáo lần 2" : (result.equals("CanhCao3")) ? "Cảnh cáo lần 3" : (result.equals("KhoaTK") )? "Khóa tài khoản" : "Mới tạo"%></p>
<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>	

														