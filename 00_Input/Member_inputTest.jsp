<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");

	String Name = request.getParameter("Name");
	String Univ= request.getParameter("Univ");
	String Phone = request.getParameter("Phone");
	
	Connection conn;
	PreparedStatement stmt = null;
	

	String str = "";
	
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/database";
		String DB_USER = "vrlab";
		String DB_PASSWORD= "knuvrlab";
		
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		stmt = conn.prepareStatement(
				"insert into member VALUES(?,?,?,?,?,?)");
			stmt.setString(1, null);
			stmt.setString(2, Name);
			stmt.setString(3, Phone);
			stmt.setString(4, Univ);
			stmt.setString(5, null);
			stmt.setString(6, null);

			
			stmt.executeUpdate();
			
			%>
			<script type="text/javascript">
			alert("데이터 입력 성공");
			</script>
			
			<form method="post" action = "Member_inputForm.jsp">
			<input type = "submit" value="추가입력">
			<%
			

		}catch(Exception e){
			e.printStackTrace();
			%>
			<script type="text/javascript">
			alert("데이터 입력 실패");
			</script>
			<%
		}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Input Test</title>
</head>
<body>

</body>
</html>