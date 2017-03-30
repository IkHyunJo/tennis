<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.DriverManager"  %>
<%@ page import="java.sql.Connection"  %>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet"  %>
<%@ page import="java.sql.SQLException"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 결과</title>
</head>
<body>

<%
	String DB_URL = "jdbc:mysql://localhost:3306/database";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";

	request.setCharacterEncoding("euc-kr");

	String id=request.getParameter("id");
	String password=request.getParameter("password");

	PreparedStatement stmt = null;
	Connection conn =null;
	ResultSet rs = null;
	boolean bLogin=false;
	String name=null;

	try{		
		conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		stmt=conn.prepareStatement("select * from admin where ID=?");
		stmt.setString(1, id);
		rs = stmt.executeQuery();
	
		if(rs.next()){
			if(password.equals(rs.getString("PW"))){
				bLogin=true;
				name=rs.getString("Grade");
			}
		}else {
			bLogin=false;	
		}
	}catch(SQLException ex){}
	finally{
		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
	if(bLogin){
		session.setAttribute("login","success");
		session.setAttribute("id",id);
		session.setAttribute("name",name);
		response.sendRedirect("LoginResult.jsp");
	}else{
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호 오류입니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>
</body>
</html>