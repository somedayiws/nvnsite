<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
   <input type="text"  id="status" name="status" value="<%=request.getAttribute("result") %>" disabled="disabled">
 <p id="result" style="display: none;"><%=request.getAttribute("result") %></p>