<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
​<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn;
	PreparedStatement stmt = null;
	String GroupCount ="";
	String str = "";
	
	try {
		String DB_URL = "jdbc:mysql://localhost:3306/database";
		String DB_USER = "root";
		String DB_PASSWORD= "knuvrlab";
		
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		int joname = 1;
		while(joname<5){
			stmt = conn.prepareStatement(
					"insert into indiv_jo VALUES(?,?,?)");
				stmt.setString(1, null);
				stmt.setString(2, String.valueOf(joname));
				stmt.setString(3, "청년부B");
				stmt.executeUpdate();		
				joname++;
		}

			
			%>
			<script type="text/javascript">
			alert("팀 생성 성공");
			</script>
			<input type="button" value="Next" onclick="javascript:window.location.href='MakeJoForm.jsp'">
			<%
			

		}catch(Exception e){
			e.printStackTrace();
			%>
			<script type="text/javascript">
			alert("팀 생성 실패");
			</script>
			<input type="button" value="Back" onclick="javascript:window.location.href='admin_list.jsp'">
			<%
		}
%>

</body>
</html>