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
		
		String Jo_Number = request.getParameter("Jo_Number");
		String Group = request.getParameter("GroupName");
		String MatchKey = request.getParameter("MatchKey");
		String TeamKey1 = request.getParameter("TeamKey1");
		String TeamKey2 = request.getParameter("TeamKey2");
		
		String Score1 = "";
		String Score2 = "";
		String winteam = "";
		String loseteam = "";
		String winteamname = "";
		
		boolean done = false;
		boolean yet = false;
		
		ps = conn.prepareStatement("select * from teammatch where matckey=?");
		ps.setString(1, MatchKey);
		rs = ps.executeQuery();
		rs.first();
		String s1 = rs.getString(3);
		String s2 = rs.getString(5);
		String t1 = rs.getString(2);
		String t2 = rs.getString(4);
		String r = rs.getString(6);
		
		if((Integer.parseInt(s1)<2)){
			if(Integer.parseInt(s2)<2){
				yet = true;
			}
		}else if(Integer.parseInt(s2)<2){
			if(Integer.parseInt(s1)<2){
				yet = true;
			}
		}
		
		if(r.equals("경기전")){
			done = false;
		}else{
			done = true;
		}
		
		if( yet == true ){
			
			conn.close();
			
			%>
			<script type="text/javascript">
					alert("각각의 경기에 점수를 입력하고 다시 시도하여 주십시오.");
				</script>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="admin_T_invidual_Detail.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&MatchKey=<%=MatchKey%>";  
				document.comeback.submit();
			</script><%
			
		}else if ( yet == false ){
			
			if( done == true ){
				conn.close();
				%>
				<script type="text/javascript">
					alert("이미 종료된 경기입니다.");
				</script>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="admin_T_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
					document.comeback.submit();
				</script><%
			}else if( done == false ){
				if(Integer.parseInt(s1) > Integer.parseInt(s2)){
					winteam = t1;
					loseteam = t2;
				}else if(Integer.parseInt(s2) > Integer.parseInt(s1)){
					winteam = t2;
					loseteam = t1;
				}

				ps = conn.prepareStatement("select * from teamteam where teamkey=?");
				ps.setString(1, winteam);
				rs = ps.executeQuery();
				rs.first();
				winteamname = rs.getString(2);
				String wincal = rs.getString(15);
				
				ps = conn.prepareStatement("update teammatch set Result=? where matckey=?");
				ps.setString(1, winteamname + "<br><br><승>");
				ps.setString(2, MatchKey);
				ps.executeUpdate();
				
				ps = conn.prepareStatement("select * from teamteam where teamkey=?");
				ps.setString(1, loseteam);
				rs = ps.executeQuery();
				rs.first();
				String losecal = rs.getString(15);
				
				int Wincal = Integer.parseInt(wincal)+101;
				int Losecal = Integer.parseInt(losecal)+100;
				wincal = String.valueOf(Wincal);
				losecal = String.valueOf(Losecal);
				
				ps = conn.prepareStatement("update teamteam set cal=? where teamkey=?");
				ps.setString(1, wincal);
				ps.setString(2, winteam);
				ps.executeUpdate();
				
				ps = conn.prepareStatement("update teamteam set cal=? where teamkey=?");
				ps.setString(1, losecal);
				ps.setString(2, loseteam);
				ps.executeUpdate();
				
				conn.close();
				
				%>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="T_pass_2.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&winteam=<%=winteam%>&loseteam=<%=loseteam%>";  
					document.comeback.submit();
				</script><%
			}
			
		}
		
		
		
		

		
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