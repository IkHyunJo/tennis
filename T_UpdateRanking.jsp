<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
	<%@ page import="java.util.ArrayList"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";

	String Jo_Number = request.getParameter("Jo_Number");
	String Group = request.getParameter("GroupName");
	String placekey = request.getParameter("placekey");
	
	ArrayList<String> teamkey = new ArrayList<String>();
	ArrayList<String> cal = new ArrayList<String>();

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	PreparedStatement ps2 = null;
	ResultSet rs2 = null;
	PreparedStatement ps3 = null;
	ResultSet rs3 = null;
	PreparedStatement ps4 = null;
	ResultSet rs4 = null;
	
	try {
		//db에 연결
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		ps = conn.prepareStatement("select * from teamteam where Jo=?");
		ps.setString(1, String.valueOf(Jo_Number));
		rs = ps.executeQuery();
		while(rs.next()){
			String GroupName = rs.getString(12);
			if(GroupName.equals(Group)){
				teamkey.add(rs.getString(1));
				cal.add(rs.getString(15));
			}
		}
		
		int Cal1 = Integer.parseInt(cal.get(0));
		int Cal2 = Integer.parseInt(cal.get(1));
		int Cal3 = Integer.parseInt(cal.get(2));
		
		if(Cal1>Cal2){
			if(Cal2>Cal3){
				//Cal1 > Cal2 > Cal3
				ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps2.setString(1, Jo_Number+"조"+"1위");
				ps2.setString(2, teamkey.get(0));
				ps2.executeUpdate();
				ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps3.setString(1, Jo_Number+"조"+"2위");
				ps3.setString(2, teamkey.get(1));
				ps3.executeUpdate();
				ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps4.setString(1, Jo_Number+"조"+"3위");
				ps4.setString(2, teamkey.get(2));
				ps4.executeUpdate();
				
			}else{
				if(Cal1>Cal3){
					//Cal1 > Cal3 > Cal2
					ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps2.setString(1, Jo_Number+"조"+"1위");
					ps2.setString(2, teamkey.get(0));
					ps2.executeUpdate();
					ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps3.setString(1, Jo_Number+"조"+"2위");
					ps3.setString(2, teamkey.get(2));
					ps3.executeUpdate();
					ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps4.setString(1, Jo_Number+"조"+"3위");
					ps4.setString(2, teamkey.get(1));
					ps4.executeUpdate();
				}else{
					//Cal3 > Cal1 > Cal2
					ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps2.setString(1, Jo_Number+"조"+"1위");
					ps2.setString(2, teamkey.get(2));
					ps2.executeUpdate();
					ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps3.setString(1, Jo_Number+"조"+"2위");
					ps3.setString(2, teamkey.get(0));
					ps3.executeUpdate();
					ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps4.setString(1, Jo_Number+"조"+"3위");
					ps4.setString(2, teamkey.get(1));
					ps4.executeUpdate();
				}
				
			}
			conn.close();
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="admin_T_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
				document.comeback.submit();
			</script>
			<%	
		}else if(Cal2>Cal1){
			if(Cal1>Cal3){
				//Cal2 > Cal1 > Cal3
				ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps2.setString(1, Jo_Number+"조"+"1위");
				ps2.setString(2, teamkey.get(1));
				ps2.executeUpdate();
				ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps3.setString(1, Jo_Number+"조"+"2위");
				ps3.setString(2, teamkey.get(0));
				ps3.executeUpdate();
				ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
				ps4.setString(1, Jo_Number+"조"+"3위");
				ps4.setString(2, teamkey.get(2));
				ps4.executeUpdate();
			}else{
				if(Cal3>Cal2){
					//Cal3 > Cal2 > Cal1
					ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps2.setString(1, Jo_Number+"조"+"1위");
					ps2.setString(2, teamkey.get(2));
					ps2.executeUpdate();
					ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps3.setString(1, Jo_Number+"조"+"2위");
					ps3.setString(2, teamkey.get(1));
					ps3.executeUpdate();
					ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps4.setString(1, Jo_Number+"조"+"3위");
					ps4.setString(2, teamkey.get(0));
					ps4.executeUpdate();
				}else{
					//Cal2 > cal3 > Cal1
					ps2 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps2.setString(1, Jo_Number+"조"+"1위");
					ps2.setString(2, teamkey.get(1));
					ps2.executeUpdate();
					ps3 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps3.setString(1, Jo_Number+"조"+"2위");
					ps3.setString(2, teamkey.get(2));
					ps3.executeUpdate();
					ps4 = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
					ps4.setString(1, Jo_Number+"조"+"3위");
					ps4.setString(2, teamkey.get(0));
					ps4.executeUpdate();
				}
			}
			conn.close();
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="T_Entry.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
				document.comeback.submit();
			</script>
			<%					
		}else{
			%>
			<script type="text/javascript">
			alert("승점으로 순위를 판단 할 수 없습니다. 수동입력 하여 주십시오.");
			</script>
			conn.close();
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="T_check_Raking.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
				document.comeback.submit();
			</script>
			<%	
		}
		
		
		
		//트라이 끝
		}catch(Exception e){
			e.printStackTrace();
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