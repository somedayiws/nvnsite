<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(!request.getAttribute("baimoi").equals("0") || !request.getAttribute("dichxong").equals("0") || !request.getAttribute("huydich").equals("0"))  { %>
	<img alt="" src="http://xenlu.sextgem.com/taowap/icon/data/hn/new_3.gif"><br>
	<a href="ListPostsServlet?view=moidang"><button class="btn btn-primary" style="min-width: 300px"><b><i>Bài mới - 新しい記事</i></b><span class="badge  pull-right"><%=request.getAttribute("baimoi")%></span></button></a><br>
	<a href="ListPostsServlet?view=dadich"><button class="btn btn-warning" style="min-width: 300px"><b><i>Đã dịch - 翻訳された </i></b><span class="badge  pull-right"><%=request.getAttribute("dichxong")%></span></button></a><br>
	<a href="ListPostsServlet?view=huydich"><button class="btn btn-danger" style="min-width: 300px"><b><i>Hủy dịch - 翻訳をキャンセルする。</i></b><span class="badge  pull-right"><%=request.getAttribute("huydich")%></span></button></a>
<% } %>
   