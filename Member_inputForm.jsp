<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Input Test</title>
</head>
<body>

<form method="post" action = "Member_inputTest.jsp">
<td>Name : <input type = "text" name="Name" maxlength="50"></td><br>
<td>Phone : <input type = "text" name="Phone" maxlength="50"></td><br>
<td>Univ : <input type = "text" name="Univ" maxlength="50"></td><br>
<td>Group : <input type = "text" name="Group" maxlength="50"></td><br>
<td>IT_Number : <input type = "text" name="IT_Number" maxlength="50"></td><br>
<td align="center"><input type = "submit" value="입력완료"></td>
</form>
<!-- 
<form method="post" action = "Member_viewTest.jsp">
<td align="center"><input type = "submit" value="목록보기"></td>
</form>
 -->
</body>
</html>