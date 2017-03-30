<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	String Jo_Number = request.getParameter("Jo_Number");
	String GroupName = request.getParameter("GroupName");
	String Matchkey = request.getParameter("Matchkey");
	String team1key = request.getParameter("team1key");
	String team2key = request.getParameter("team2key");
	String mscore1 = request.getParameter("mscore1");
	String mscore2 = request.getParameter("mscore2");
	String placekey = request.getParameter("placekey");
	String Match_Num = request.getParameter("");

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;	
	
	try {
		//db에 연결
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				
		//------
		if(Match_Num.equals("1")){
			
		}else if(Match_Num.equals("2")){
			
		}else if(Match_Num.equals("3")){
			
		}else{
			
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
%>


</body>
</html>