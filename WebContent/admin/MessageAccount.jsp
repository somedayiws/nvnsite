<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
%>
<%=result.equals("MoiTao")? "Mới tạo" : (result.equals("CanhCao1")) ? "Cảnh cáo lần 1" : (result.equals("CanhCao2")) ? "Cảnh cáo lần 2" : (result.equals("CanhCao3")) ? "Cảnh cáo lần 3" : (result.equals("KhoaTK") )? "Khóa tài khoản" : "Mới tạo"%>

														