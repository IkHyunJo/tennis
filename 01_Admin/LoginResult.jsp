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

<%= Id %>���� �α����� �����Դϴ�. <br><br>
�޴��� �����Ͽ� �ֽʽÿ�. <br>

<!-- <form method="post" action = "../02_MakeTeam/PutMember.jsp"> -->
<td align="center"><input type = "submit" value="�������" onclick="javascript:window.location.href='../02_MakeTeam/PutMember.jsp'"></td>
<td align="center"><input type = "submit" value="���Է�" onclick="javascript:window.location.href='admin_list.jsp'"></td>
<!--</form>-->
						
</body>
</html>