<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(!request.getAttribute("baimoi").equals("0") || !request.getAttribute("dichxong").equals("0") || !request.getAttribute("huydich").equals("0"))  { %>
	<img alt="" src="http://xenlu.sextgem.com/taowap/icon/data/hn/new_3.gif"><br>
	<a href="ListPostsServlet?view=moidang">Bài mới <span class="badge  pull-right"><%=request.getAttribute("baimoi")%></span></a><br>
	<a href="ListPostsServlet?view=dadich">Đã dịch <span class="badge  pull-right"><%=request.getAttribute("dichxong")%></span></a><br>
	<a href="ListPostsServlet?view=huydich">Hủy dịch &#160&#160<span class="badge  pull-right"><%=request.getAttribute("huydich")%></span></a>
<% } %>
   