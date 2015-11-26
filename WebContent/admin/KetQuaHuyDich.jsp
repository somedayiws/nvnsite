<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%= request.getAttribute("KetQua")==null?"Hủy bài dịch không thành công - 記事を削除することができなかった ":request.getAttribute("KetQua") %>
