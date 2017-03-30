<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>

<html>
 <head><title>세션 사용 예제</title></head>
 <body>
 
<%
	request.setCharacterEncoding("EUC-KR");

	String Group = new String(request.getParameter("GroupName").getBytes("8859_1"), "EUC-KR");
	System.out.println(Group + "\t");
%>

<%=Group%>

<tr>
</tr>
 </body>
</html>