<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
​<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList"  %>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if IE 8]><html class="lt-ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <title>TENNIS ENTRY</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<!-- 버튼  -->
<!-- 버튼 종료 -->
  <link rel="stylesheet" href="css/normalize.css" />
  <link rel="stylesheet" href="css/foundation.min.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/ie.css" />
  <link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Cabin+Condensed:600' rel='stylesheet' type='text/css'>
<!--	<script src="//code.jquery.com/jquery-latest.min.js"></script>-->
  <script src="js/vendor/custom.modernizr.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
$("#m_btn").click(function(){
      $(".mainmenu-ul").slideToggle();
});
});

</script>


<link rel="stylesheet" type="text/css" href="main01.css" media="screen, projection"/>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.touchSwipe-1.2.5.js"></script>
<script type="text/javascript" src="jquery.baramangSwipe-1.0.js"></script>
<script type="text/javascript" src="baramangSwipeTemplate.js"></script>


</head>
<body>

					
		<%
		request.setCharacterEncoding("UTF-8");
		
		String DB_URL = "jdbc:mysql://localhost:3306/db";
		String DB_USER = "root";
		String DB_PASSWORD= "knuvrlab";
		
		Connection conn; //
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement ps = null; 
		ResultSet rs = null;
			
			String Group = request.getParameter("GroupName");
			String entrykey = request.getParameter("entrykey");
			
			String winteam ="";
			String loseteam = "";
			String teamname = "";
			String BoxNum ="";
			String RoundNum ="";
			
			boolean done = false;
			
			ps = conn.prepareStatement("select * from teamentry where entrykey=?");
			ps.setString(1, entrykey);
			rs = ps.executeQuery();
			rs.first();
			
			String Round = rs.getString(2);
			String Roundbox = rs.getString(3);
			String team1key = rs.getString(5);
			String team2key = rs.getString(7);
			String team1score = rs.getString(6);
			String team2score = rs.getString(8);
			String result = rs.getString(9);
			
			if(result.equals("경기전")){
				done = false;
			}else{
				done = true;
			}
			
			if(done == true){
				conn.close();
				%>
				<script type="text/javascript">
					alert("이미 종료된 경기입니다.");
				</script>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="admin_T_main_Entry.jsp?GroupName=<%=Group%>";  
					document.comeback.submit();
				</script><%
			}else if(done == false){
				if(Integer.parseInt(team1score) > Integer.parseInt(team2score)){
					winteam = team1key;
					loseteam = team2key;
				}else if(Integer.parseInt(team2score) < Integer.parseInt(team1score)){
					winteam = team2key;
					loseteam = team1key;
				}
				
				ps = conn.prepareStatement("select * from teamentry where entrykey=?");
				ps.setString(1, entrykey);
				rs = ps.executeQuery();
				while(rs.next())
				{
					RoundNum = rs.getString(2);
					BoxNum = rs.getString(3);
				}
				
				int rcnt = 0;
				ps = conn.prepareStatement("select * from teamentry where Round=?");
				ps.setString(1, RoundNum);
				rs = ps.executeQuery();
				while(rs.next()){
					String g = rs.getString(4);
					if(g.equals(Group)){
						rcnt++;
						System.out.println(rcnt);
					}
				}
				
				if(rcnt==1){
					if(Group.equals("단체전B1")){
						ps = conn.prepareStatement("update teamteam set Cal=? where TeamKey=?");
						ps.setString(1, "DBB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();	
					}else if(Group.equals("단체전B2")){
						ps = conn.prepareStatement("update teamteam set Cal=? where TeamKey=?");
						ps.setString(1, "DBB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();	
					}else if(Group.equals("단체전B3")){
						ps = conn.prepareStatement("update teamteam set Cal=? where TeamKey=?");
						ps.setString(1, "DBB3W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("단체전B4")){
						ps = conn.prepareStatement("update teamteam set Cal=? where TeamKey=?");
						ps.setString(1, "DBB4W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}
					
					conn.close();
					%>
					<form type = "hidden" method="post" name="comeback"></form>
					<script type="text/javascript">
						document.comeback.action="T_Entry_Bon.jsp?GroupName=<%=Group%>";  
						document.comeback.submit();
					</script><%
					
				}else{
					ps = conn.prepareStatement("select * from teamteam where teamkey=?");
					ps.setString(1, winteam);
					rs = ps.executeQuery();
					rs.first();
					teamname = rs.getString(2);
					
					ps = conn.prepareStatement("update teamentry set Result=? where entrykey=?");
					ps.setString(1, teamname + "<br>승");
					ps.setString(2, entrykey);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update teamteam set cal=? where teamkey=?");
					ps.setString(1, Round + "R" + Roundbox + "BW");
					ps.setString(2, winteam);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update teamteam set cal=? where teamkey=?");
					ps.setString(1, Round + "R" + Roundbox + "BL");
					ps.setString(2, loseteam);
					ps.executeUpdate();
					
					conn.close();
					%>
					<form type = "hidden" method="post" name="comeback"></form>
					<script type="text/javascript">
					document.comeback.action="T_Entry2.jsp?GroupName=<%=Group%>";  
					document.comeback.submit();
					</script><%
				}
			}

			%>
</div>


  <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="js/foundation.min.js"></script>
  <script type="text/javascript" src="js/functions.js"></script>
  <script type="text/javascript" src="js/jquery.nicescroll.js"></script>
  <script src="js/jquery.localscroll-1.2.7.js" type="text/javascript"></script>
  <script src="js/jquery.scrollTo-1.4.3.1.js" type="text/javascript"></script>
  <link rel="stylesheet" href="css/flexslider.css"> <!-- Flex slider -->
  <script src="js/jquery.flexslider.js" type="text/javascript"></script><!-- Flex slider -->
  <script type="text/javascript" src="js/custom.js"></script>		
</body>
</html>