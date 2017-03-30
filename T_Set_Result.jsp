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
			
			String Jo_Number = request.getParameter("Jo_Number");
			String Group = request.getParameter("Group");
			String MatchNum = request.getParameter("MatchNum");
			String TeamKey1 = request.getParameter("TeamKey1");
			String TeamKey2 = request.getParameter("TeamKey2");
			String TeamKey3 = request.getParameter("TeamKey3");
			String Rank1 = request.getParameter("Rank_1");
			String Rank2 = request.getParameter("Rank_2");
			String Rank3 = request.getParameter("Rank_3");
			String placekey = request.getParameter("placekey");
			
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			ps = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
			ps.setString(1, Rank1);
			ps.setString(2, TeamKey1);
			ps.executeUpdate();
			
			ps = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
			ps.setString(1, Rank2);
			ps.setString(2, TeamKey2);
			ps.executeUpdate();
			
			ps = conn.prepareStatement("update teamteam set Ranking=? where TeamKey=?");
			ps.setString(1, Rank3);
			ps.setString(2, TeamKey3);
			ps.executeUpdate();
			
			conn.close();
			
			%> <form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="T_Entry.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
				document.comeback.submit();
			</script> 
			

</body>
</html>