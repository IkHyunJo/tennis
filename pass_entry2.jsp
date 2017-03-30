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
			
		String Score1 = request.getParameter("Score1");
		String Score2 = request.getParameter("Score2");
		String EntryKey = request.getParameter("EntryKey");
		String TeamKey1 = request.getParameter("TeamKey1");
		String TeamKey2 = request.getParameter("TeamKey2");
		String winteam = "";
		String loseteam = "";
		String BoxNum ="";
		String RoundNum ="";
		String GroupName = request.getParameter("GroupName");
		
		
		
		out.println(TeamKey1);
		out.println(TeamKey2);
		
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

		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		
		ps = conn.prepareStatement("select * from gaeinentry where EntryKey=?");
		ps.setString(1, EntryKey);
		rs = ps.executeQuery();
		while(rs.next())
		{
			RoundNum = rs.getString(2);
			BoxNum = rs.getString(3);
		}
		
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
		ps.setString(1, "R"+RoundNum+"B"+BoxNum+"W");
		ps.setString(2, winteam);
		ps.executeUpdate();	
		
		ps = conn.prepareStatement("update gaeinteam set Cal=? where TeamKey=?");
		ps.setString(1, "R"+RoundNum+"B"+BoxNum+"L");
		ps.setString(2, loseteam);
		ps.executeUpdate();	
		
		%>
		<form type = "hidden" method="post" name="comeback"></form>
		<script type="text/javascript">
			document.comeback.action="GaeinEntry2.jsp?&GroupName=<%=GroupName%>";  
			document.comeback.submit();
		</script>
		<%
		
		%>

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