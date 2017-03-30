<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/database";
	String DB_USER = "vrlab";
	String DB_PASSWORD= "knuvrlab";

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "select * from admin";
	
	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();

		while(rs.next()){
			String a = rs.getString(1);
			String s = rs.getString(2);
			String d = rs.getString(3);

			out.println(a + "\t" + s + "\t" + d);
			%><br><%
		}
		}catch(Exception e){
			e.printStackTrace();
		}
%>

<form method="post" action = "Admin_inputForm.jsp">
<td align="center"><input type = "submit" value="추가입력"></td>

</body>
</html>