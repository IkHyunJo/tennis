<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String num = "";
	String Univ = "";
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/Tennis";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		for(int numm = 6; numm>3; numm--){ //numm 의 값에 JoName이 같은 칼럼의 IT_Number의 개수를 입력.
			num = String.valueOf(numm);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			ps = conn.prepareStatement("select * from member where IT_Number=?");
				ps.setString(1, num);
			rs = ps.executeQuery();
	
			while(rs.next()){
				String M_Number = rs.getString(1);
				String Name = rs.getString(2);
				String Phone = rs.getString(3);
				Univ = rs.getString(4);
				String IT_Number = rs.getString(5);
				
				ps = conn.prepareStatement("update indiv_team set TeamName=concat(TeamName, ?) where IT_Number=?");
				ps.setString(1, Name +", ");
				ps.setString(2, num);
				ps.executeUpdate();
			}
			ps = conn.prepareStatement("update indiv_team set TeamName=concat(TeamName, ?) where IT_Number=?");
				ps.setString(1, "(" + Univ + ")");
				ps.setString(2, num);
				ps.executeUpdate();
			//"(" + Univ + ")" +
		}
		}catch(Exception e){
			e.printStackTrace();
		}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form method="post" action = "Member_inputForm.jsp">
<td align="center"><input type = "submit" value="추가입력"></td>

</body>
</html>