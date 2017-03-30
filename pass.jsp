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
		
		request.setCharacterEncoding("UTF-8");
		
		String DB_URL = "jdbc:mysql://localhost:3306/db";
		String DB_USER = "root";
		String DB_PASSWORD= "knuvrlab";
		
		Connection conn; //
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement ps = null; 
		ResultSet rs = null;
			
			String Jo_Number = request.getParameter("Jo_Number");
			String Group = request.getParameter("Group");
			String TeamKey1 = request.getParameter("TeamKey1");
			String TeamKey2 = request.getParameter("TeamKey2");
			String Score1 = request.getParameter("Score1");
			String Score2 = request.getParameter("Score2");
			String MatchKey = request.getParameter("MatchKey");
			String winteam ="";
			String loseteam ="";
			String ViewWinteam="";
			String placekey = request.getParameter("placekey");
			ArrayList<String> PlaceKey = new ArrayList<String>();
			ArrayList<String> WinteamName = new ArrayList<String>();
			ArrayList<String> WinteamUniv = new ArrayList<String>();
			ArrayList<String> WinCal = new ArrayList<String>();
			ArrayList<String> LoseCal = new ArrayList<String>();

			String pass = request.getParameter("pass");
			
			boolean done = false;
			
			
			int SetTeamKey1Score = Integer.valueOf(Score1);
			int SetTeamKey2Score = Integer.valueOf(Score2);
			
			int PlayPoint = 100;
			int Winner = 6;
			int LosePoint = 0;
			int WinPoint = 0;
			
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
					document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
					document.comeback.submit();
				</script><%
				
			}else{

				if(pass.equals("0")){
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey1);
					rs = ps.executeQuery();
					rs.first();
					int cal1 = Integer.parseInt(rs.getString(10));
					
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey2);
					rs = ps.executeQuery();
					rs.first();
					int cal2 = Integer.parseInt(rs.getString(10));
					
					if(cal1+cal2 > 150){
						done = true;
					}
					
				}else if(pass.equals("1")){
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey1);
					rs = ps.executeQuery();
					rs.first();
					int cal1 = Integer.parseInt(rs.getString(10));
					
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey2);
					rs = ps.executeQuery();
					rs.first();
					int cal2 = Integer.parseInt(rs.getString(10));
					
					if(cal1+cal2 > 250){
						done = true;
					}
				}else if(pass.equals("2")){
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey1);
					rs = ps.executeQuery();
					rs.first();
					int cal1 = Integer.parseInt(rs.getString(10));
					
					ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
					ps.setString(1, TeamKey2);
					rs = ps.executeQuery();
					rs.first();
					int cal2 = Integer.parseInt(rs.getString(10));
					
					if(cal1+cal2 > 250){
						done = true;
					}
				}
				
				if(done == true){
					conn.close();
					%>
					<script type="text/javascript">
						alert("이미 종료된 경기입니다.");
					</script>
					<form type = "hidden" method="post" name="comeback"></form>
					<script type="text/javascript">
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
					</script><%
				}else if(done == false){
					if(SetTeamKey1Score > SetTeamKey2Score)
					{
						winteam = TeamKey1;
						loseteam = TeamKey2;
						LosePoint = SetTeamKey2Score-6;
					}
					else
					{
						winteam = TeamKey2;
						loseteam = TeamKey1;
						LosePoint = SetTeamKey1Score-6;
					}
					
					
					
					ps = conn.prepareStatement("update place set onplaying=? where placekey=?");
					ps.setString(1, "empty");
					ps.setString(2, placekey);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinmatch set Team1Score=? where MatcKey=?");
					ps.setString(1, Score1);
					ps.setString(2, MatchKey);
					
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinmatch set Team2Score=? where MatcKey=?");
					ps.setString(1, Score2);
					ps.setString(2, MatchKey);
					ps.executeUpdate();
					
				    ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
						ps.setString(1, winteam);
						rs = ps.executeQuery();
					while(rs.next())
					{
						WinteamName.add(rs.getString(2));
						WinteamName.add(rs.getString(4));
						WinteamUniv.add(rs.getString(6));
						WinCal.add(rs.getString(10));
					}
					
				    ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
						ps.setString(1, loseteam);
						rs = ps.executeQuery();
					while(rs.next())
					{
						LoseCal.add(rs.getString(10));
					}
					
					ps = conn.prepareStatement("update gaeinteam set Cal=? where Teamkey=?");
					ps.setString(1, String.valueOf(Integer.valueOf(WinCal.get(0)) + Winner+PlayPoint));
					ps.setString(2, winteam);
					ps.executeUpdate();
					
					ps = conn.prepareStatement("update gaeinteam set Cal=? where Teamkey=?");
					ps.setString(1, String.valueOf(Integer.valueOf(LoseCal.get(0)) + LosePoint+PlayPoint));
					ps.setString(2, loseteam);
					ps.executeUpdate();

					ps = conn.prepareStatement("update gaeinmatch set Result=? where MatcKey=?");
					ps.setString(1, WinteamName.get(0) + "<br>" + WinteamName.get(1) + "<br>" + "(" + WinteamUniv.get(0) + ")<br><br><승>");
					ps.setString(2, MatchKey);
					ps.executeUpdate();
					
					conn.close();
				
				
			}
			
			}
			

			%><form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="MakeMatch2.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&winteam=<%=winteam%>&loseteam=<%=loseteam%>&placekey=<%=placekey%>";  
					document.comeback.submit();
				</script>
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