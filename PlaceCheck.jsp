<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="java.util.ArrayList"  %>
    
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
	String placekey = request.getParameter("placekey");
	String GroupName = request.getParameter("GroupName");
	
	String entrykey = "";
	String group = "";
	String p = "";

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	boolean check = false;
	boolean check2 = false;

	
	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select * from gaeinentry");
		rs = ps.executeQuery();
		breakOut:
		while(rs.next()){
			String tm1key = rs.getString(5);
			String tm2key = rs.getString(7);
			group = rs.getString(4);
			String place = rs.getString(10);
			entrykey = rs.getString(1);
			if(group.equals(GroupName)){
				if(tm1key.length()<4){
					if(tm2key.length()<4){
						if(place==null){
							out.println("해당 경기에 경기장 배치하기");
							check = true;
							break breakOut;
			}	}	}	}	}
		
		ps = conn.prepareStatement("select * from place where onplaying=?");
			ps.setString(1,"empty");
		rs = ps.executeQuery();
		breakOut:
		while(rs.next()){
			String g = rs.getString(5);
			if(g.equals(GroupName)){
				check2 = true;
				break breakOut;
			}
		}
		
		if(check == true){
			//경기는 있지만 경기장이 배정이 되지 않음.
			if(check2==false){
				//경기는 생성되어있지만 경기장이 없는 경우.
				conn.close();
				%>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="Admin_main_Entry.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
					document.comeback.submit();
				</script>
				<%
			}else{
				String place = rs.getString(1);
				//해당 경기장에 위에서 찾은 경기를 배정.
				ps = conn.prepareStatement("update gaeinentry set Placekey=? where entrykey=?");
					ps.setString(1, place);
					ps.setString(2, entrykey);
				ps.executeUpdate();
				ps = conn.prepareStatement("update gaeinentry set Result=? where entrykey=?");
					ps.setString(1, "경기중");
					ps.setString(2, entrykey);
				ps.executeUpdate();
				ps = conn.prepareStatement("update place set Onplaying=? where placekey=?");
					ps.setString(1, "onplaying");
					ps.setString(2, place);
				ps.executeUpdate();
				
				conn.close();
				%>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="PlaceCheck.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
					document.comeback.submit();
				</script>
				<%
			}
			
		}else{
			//대기중인 본선 경기가 없는 경우.
			out.println("여기다");
			conn.close();
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="Admin_main_Entry.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
				document.comeback.submit();
			</script>
			<%
		}


		}catch(Exception e){
			e.printStackTrace();
		}
%>

</body>
</html>