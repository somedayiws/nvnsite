<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<a href="Thong-bao"> <i class="fa fa-envelope-o"></i>
		<span id="countMail"><%=request.getAttribute("soEmail") == null ? "0" : request
					.getAttribute("soEmail")%></span>
		</a> |
