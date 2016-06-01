<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<p>
<% 
 String number = request.getParameter("number");
 String id = request.getParameter("id");
 String comment = request.getParameter("comment");
 
%>
  글번호:<%=number%><br>
  아이디:<%=id%><br>
  코멘트:<%=comment%><br>
</p>
