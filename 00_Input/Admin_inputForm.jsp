<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Input Test</title>
</head>
<body>

<form method="post" action = "Admin_inputTest.jsp">
<td>ID : <input type = "text" name="ID" maxlength="50"></td><br>
<td>PW : <input type = "password" name="PW" maxlength="50"></td><br>
<td>Grade : <input type = "text" name="Grade" maxlength="50"></td><br>
<td align="center"><input type = "submit" value="입력완료"></td>
</form>

<form method="post" action = "Admin_viewTest.jsp">
<td align="center"><input type = "submit" value="목록보기"></td>
</form>

</body>
</html>