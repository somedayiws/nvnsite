<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//Check session exist
		HttpSession session_user = request.getSession();
		String username =(String)session_user.getAttribute("username");	
		if(username!=null){
	String id = (String) request.getAttribute("id");
	String result = (String) request.getAttribute("result");
%>
<button type="button" id="<%=id%>" <%if (result.contains("Đã ghim")) {%>
	class="btn btn-warning btn-sm btnbookmark" <%} else {%>
	class="btn btn-primary btn-sm btnbookmark" <%}%>
	onclick="changeBookmark('<%=id%>')" data-toggle="tooltip"
	<%if (result.contains("Đã ghim")) {%> title="Đã ghim - 固定された。" <%} else {%>
	title="Chưa ghim - まだ固定しない。" <%}%>>
	<span class="glyphicon glyphicon-bookmark"></span>
</button>
<p id="result" style="display: none;"><%=request.getAttribute("result")%></p>
<%}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowloginAdmin");
	    dispatcher.forward(request, response);
	}%>