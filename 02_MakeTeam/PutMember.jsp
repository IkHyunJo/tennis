<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String IT_Number = "";
	String Univ = "";
	int cnt = 0;
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
		while(rs.next()){
			IT_Number = rs.getString(1);
			String TeamName = rs.getString(2);
			String JoSoonWe = rs.getString(3);
			String Jo_Number = rs.getString(4);
			
			ps = conn.prepareStatement("update indiv_team set TeamName='' where IT_Number=?");
			ps.setString(1, IT_Number);
			ps.executeUpdate();
		}
		
		cnt = Integer.parseInt(IT_Number);
		
		while(cnt>0){ //numm 의 값에 JoName이 같은 칼럼의 IT_Number의 개수를 입력.
			IT_Number = String.valueOf(cnt);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			ps = conn.prepareStatement("select * from member where IT_Number=?");
				ps.setString(1, IT_Number);
			rs = ps.executeQuery();
	
			while(rs.next()){
				String M_Number = rs.getString(1);
				String Name = rs.getString(2);
				String Phone = rs.getString(3);
				Univ = rs.getString(4);
				String Group = rs.getString(5);
				IT_Number = rs.getString(6);
				
				ps = conn.prepareStatement("update indiv_team set TeamName=concat(TeamName, ?) where IT_Number=?");
				ps.setString(1, Name +", ");
				ps.setString(2, IT_Number);
				ps.executeUpdate();
			}
			ps = conn.prepareStatement("update indiv_team set TeamName=concat(TeamName, ?) where IT_Number=?");
				ps.setString(1, "(" + Univ + ")");
				ps.setString(2, IT_Number);
				ps.executeUpdate();
			//"(" + Univ + ")" +
				
			cnt--;
		}

		}catch(Exception e){
			e.printStackTrace();
		}
	out.println("<script>");
	out.println("alert('팀이 편성되었습니다.')");
	out.println("history.go(-1)");
	out.println("</script>");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>