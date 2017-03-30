<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="java.util.ArrayList"  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	
	ArrayList<String> entrykey = new ArrayList<String>();
	ArrayList<String> t1key = new ArrayList<String>();
	ArrayList<String> t2key = new ArrayList<String>();
	ArrayList<String> Ranking = new ArrayList<String>();
	ArrayList<String> teamkey = new ArrayList<String>();
	
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
		//엔트리 크기 구하기
		int entcnt = 0;
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select * from teamentry");
		rs = ps.executeQuery();
		while(rs.next()){
			String group = rs.getString(4);
			if(group.equals(GroupName)){
				entrykey.add(rs.getString(1));
				t1key.add(rs.getString(5));
				t2key.add(rs.getString(7));
				entcnt++;
			}	
		}
		//팀 크기 구하기
		int teamcnt = 0;
		ps2 = conn.prepareStatement("select * from teamteam");
		rs2 = ps2.executeQuery();
		while(rs2.next()){
			String group = rs2.getString(12);
			if(group.equals(GroupName)){
				Ranking.add(rs2.getString(14));
				teamkey.add(rs2.getString(1));
				teamcnt++;
			}	
		}
		
		for(int i=0; i<entcnt; i++){//엔트리 처음부터 끝까지.
			for(int j=0; j<teamcnt; j++){
				if(t1key.get(i).equals(Ranking.get(j))){
					out.println(Ranking.get(j));
					ps3 = conn.prepareStatement("update teamentry set team1key=? where entrykey=?");
					ps3.setString(1, teamkey.get(j));
					ps3.setString(2, entrykey.get(i));
					ps3.executeUpdate();
				}else if(t2key.get(i).equals(Ranking.get(j))){
					out.println(Ranking.get(j));
					ps3 = conn.prepareStatement("update teamentry set team2key=? where entrykey=?");
					ps3.setString(1, teamkey.get(j));
					ps3.setString(2, entrykey.get(i));
					ps3.executeUpdate();
				}
			}
		}
		
		conn.close();
		
		if(Jo_Number == null){
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="admin_T_main_Entry.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
				document.comeback.submit();
			</script>
			<%		
		}
		
		%>
		<form type = "hidden" method="post" name="comeback"></form>
		<script type="text/javascript">
			document.comeback.action="admin_T_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
			document.comeback.submit();
		</script>
		<%		
			

		}catch(Exception e){
			e.printStackTrace();
		}
%>

</body>
</html>