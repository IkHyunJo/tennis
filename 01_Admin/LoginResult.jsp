<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String Id = (String) session.getAttribute("name");
%>

<%= Id %>님이 로그인한 상태입니다. <br><br>
메뉴를 선택하여 주십시오. <br>

<!-- <form method="post" action = "../02_MakeTeam/PutMember.jsp"> -->
<td align="center"><input type = "submit" value="팀만들기" onclick="javascript:window.location.href='../02_MakeTeam/PutMember.jsp'"></td>
<td align="center"><input type = "submit" value="조입력" onclick="javascript:window.location.href='admin_list.jsp'"></td>
<!--</form>-->
						
</body>
</html>