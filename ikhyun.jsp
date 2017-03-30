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
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select * from indiv_team");
		rs = ps.executeQuery();
		rs.last(); int cnt = rs.getRow(); rs.first();
		System.out.println(cnt);
		int jo = 1;
		
		while(cnt>0){
			ps = conn.prepareStatement("select * from indiv_team where Jo_Number=?");
			ps.setString(1, String.valueOf(jo));
			rs = ps.executeQuery();
			
			while(rs.next()){
				String IT_Number = rs.getString(1);
				String TeamName = rs.getString(2);
				String JoSoonWe = rs.getString(3);
				String Jo_Number = rs.getString(4);
				out.println(IT_Number + "\t" + TeamName + "\t" + JoSoonWe +"\t" + Jo_Number);
				%><br><%
				cnt--;
			}
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
%>

<form method="post" action = "Member_inputForm.jsp">
<td align="center"><input type = "submit" value="추가입력"></td>

</body>
