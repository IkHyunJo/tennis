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
		PreparedStatement ps = null; 
		ResultSet rs = null;
		
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
		String Score1 = request.getParameter("Score1");
		String Score2 = request.getParameter("Score2");
		String EntryKey = request.getParameter("EntryKey");
		String TeamKey1 = request.getParameter("TeamKey1");
		String TeamKey2 = request.getParameter("TeamKey2");
		String Result = request.getParameter("Result");
		String Group = request.getParameter("GroupName");
		String placekey = request.getParameter("placekey");
		
		String winteam = "";
		String loseteam = "";
		String BoxNum ="";
		String RoundNum ="";
		
		boolean ready = false;
		
		boolean yet = false;
		
		if((Integer.parseInt(Score1)<6)){
			if(Integer.parseInt(Score2)<6){
				yet = true;
			}
		}else if(Integer.parseInt(Score1)<6){
			if(Integer.parseInt(Score2)<6){
				yet = true;
			}
		}
		
		if( yet == true ){
			
			conn.close();
			
			%>
			<script type="text/javascript">
					alert("점수를 다시 확인하여 주십시오. 점수가 6점 이하입니다.");
				</script>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="Admin_main_Entry.jsp?&GroupName=<%=Group%>";  
				document.comeback.submit();
			</script><%
			
		}else{
			
			ps = conn.prepareStatement("select * from gaeinentry where EntryKey=?");
			ps.setString(1, EntryKey);
			rs = ps.executeQuery();
			rs.first();
			String t1 = rs.getString(5);
			String t2 = rs.getString(7);
			if(t1.length()<4){
				if(t2.length()<4){
					ready = true;
				}else{
					ready = false;
				}
			}else{
				ready = false;
			}
			
			if(ready == true){
				if(Integer.valueOf(Score1) > Integer.valueOf(Score2))
				{
					winteam = TeamKey1;	
					loseteam = TeamKey2;
				}
				else
				{
					winteam = TeamKey2;	
					loseteam = TeamKey1;
				}
				/*
				out.println("Score1 = " + Score1 + "////");
				out.println("Score2 = " + Score2 + "////");
				out.println("EntryKey = " + EntryKey + "////");
				out.println("TeamKey1 = " + TeamKey1 + "////");
				out.println("TeamKey2 = " + TeamKey2 + "////");
				out.println("winteam = " + winteam + "////");
				out.println("loseteam = " + loseteam + "////");
				out.println("Result = " + Result + "////");
				*/
				
				
				ps = conn.prepareStatement("select * from gaeinentry where EntryKey=?");
				ps.setString(1, EntryKey);
				rs = ps.executeQuery();
				while(rs.next())
				{
					RoundNum = rs.getString(2);
					BoxNum = rs.getString(3);
				}
				
				int rcnt = 0;
				ps = conn.prepareStatement("select * from gaeinentry where Round=?");
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
					//본선 대진이 종료.
					ps = conn.prepareStatement("update gaeinentry set Team1Score=? where EntryKey=?");
					ps.setString(1, Score1);
					ps.setString(2, EntryKey);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinentry set Team2Score=? where EntryKey=?");
					ps.setString(1, Score2);
					ps.setString(2, EntryKey);
					ps.executeUpdate();	
					
					ps = conn.prepareStatement("update gaeinentry set Result=? where EntryKey=?");
					ps.setString(1, "경기끝");
					ps.setString(2, EntryKey);
					ps.executeUpdate();	
					
					ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
					ps.setString(1, RoundNum+"R"+BoxNum+"B"+"L");
					ps.setString(2, loseteam);
					ps.executeUpdate();	
					
					if(Group.equals("청년부A")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "CAW");
						ps.setString(2, winteam);
						ps.executeUpdate();	
					}else if(Group.equals("청년부B1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "CBB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();	
					}else if(Group.equals("청년부B2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "CBB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("청년부B3")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "CBB3W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("청년부B4")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "CBB4W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부A1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IAB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부A2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IAB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부B1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IBB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부B2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IBB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부B3")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IBB3W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("일반부B4")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "IBB4W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("장년부A1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "JAB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("장년부A2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "JAB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("장년부B1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "JBB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("장년부B2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "JBB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("노년부A")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "NAW");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("노년부B1")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "NBB1W");
						ps.setString(2, winteam);
						ps.executeUpdate();
					}else if(Group.equals("노년부B2")){
						ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
						ps.setString(1, "NBB2W");
						ps.setString(2, winteam);
						ps.executeUpdate();
						
						%>	
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
							document.comeback.action="GaeinEntry2.jsp?&GroupName=<%=Group%>&placekey=<%=placekey%>";  
							document.comeback.submit();
						</script><%
					}
					

				}else{
					ps = conn.prepareStatement("update place set onplaying=? where placekey=?");
					ps.setString(1, "empty");
					ps.setString(2, placekey);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinentry set Team1Score=? where EntryKey=?");
					ps.setString(1, Score1);
					ps.setString(2, EntryKey);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinentry set Team2Score=? where EntryKey=?");
					ps.setString(1, Score2);
					ps.setString(2, EntryKey);
					ps.executeUpdate();	
					
					ps = conn.prepareStatement("update gaeinentry set Result=? where EntryKey=?");
					ps.setString(1, "경기끝");
					ps.setString(2, EntryKey);
					ps.executeUpdate();	
					
					ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
					ps.setString(1, RoundNum+"R"+BoxNum+"B"+"W");
					ps.setString(2, winteam);
					ps.executeUpdate();	
					
					ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
					ps.setString(1, RoundNum+"R"+BoxNum+"B"+"L");
					ps.setString(2, loseteam);
					ps.executeUpdate();	
					
					
				}
				conn.close();
				%>	
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="GaeinEntry2.jsp?&GroupName=<%=Group%>&placekey=<%=placekey%>";  
					document.comeback.submit();
				</script><%
			}else if(ready == false){
				conn.close();
				%>
				<script type="text/javascript">
					alert("아직 대진이 확정되지 않았습니다.");
				</script>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="Admin_main_Entry.jsp?GroupName=<%=Group%>";  
					document.comeback.submit();
				</script><%
			
		}
		
		
		}
		
		
		
	%>
	
	<form type = "hidden" method="post" name="comeback"></form>
		<script type="text/javascript">
			document.comeback.action="GaeinEntry2.jsp?&GroupName=<%=Group%>&placekey=<%=placekey%>";  
			document.comeback.submit();
		</script>

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