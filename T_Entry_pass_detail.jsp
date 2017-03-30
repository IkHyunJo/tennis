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
			String Score1 = request.getParameter("Score1");
			String Score2 = request.getParameter("Score2");
			String entrykey = request.getParameter("entrykey");
			String TeamKey1 = request.getParameter("TeamKey1");
			String TeamKey2 = request.getParameter("TeamKey2");
			String i = request.getParameter("i");
			
			boolean done = false;
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
					document.comeback.action="admin_T_main_Entry_Detail.jsp?GroupName=<%=Group%>&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&entrykey=<%=entrykey%>";  
					document.comeback.submit();
				</script><%
				
			}else{
				
				if(i.equals("0")){
					ps = conn.prepareStatement("select * from teamentry where entrykey=?");
					ps.setString(1, entrykey);
					rs = ps.executeQuery();
					rs.first();
					String result1 = rs.getString(10);
					String result2 = rs.getString(11);
					if(result1.equals("-")){
						done = false;
					}else{
						done = true;
					}
					
				}else if(i.equals("1")){
					ps = conn.prepareStatement("select * from teamentry where entrykey=?");
					ps.setString(1, entrykey);
					rs = ps.executeQuery();
					rs.first();
					String result1 = rs.getString(12);
					String result2 = rs.getString(13);
					System.out.println(result1+result2);
					if(result1.equals("-")){
						done = false;
					}else{
						done = true;
					}
					
				}else if(i.equals("2")){
					ps = conn.prepareStatement("select * from teamentry where entrykey=?");
					ps.setString(1, entrykey);
					rs = ps.executeQuery();
					rs.first();
					String result1 = rs.getString(14);
					String result2 = rs.getString(15);
					if(result1.equals("-")){
						done = false;
					}else{
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
						document.comeback.action="admin_T_main_Entry_Detail.jsp?GroupName=<%=Group%>&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&entrykey=<%=entrykey%>";  
						document.comeback.submit();
					</script><%
				}else if(done == false){
					
					ps = conn.prepareStatement("select * from teamentry where entrykey=?");
					ps.setString(1, entrykey);
					rs = ps.executeQuery();
					rs.first();
					String t1s = rs.getString(6);
					String t2s = rs.getString(8);
					int T1s = Integer.parseInt(t1s);
					int T2s = Integer.parseInt(t2s);
					
					if(Integer.parseInt(Score1) > Integer.parseInt(Score2)){
						T1s = T1s+1;
						ps = conn.prepareStatement("update teamentry set Team1Score=? where entrykey=?");
						ps.setString(1, String.valueOf(T1s));
						ps.setString(2, entrykey);
						ps.executeUpdate();
					}else if(Integer.parseInt(Score2) > Integer.parseInt(Score1)){
						T2s = T2s+1;
						ps = conn.prepareStatement("update teamentry set Team2Score=? where entrykey=?");
						ps.setString(1, String.valueOf(T2s));
						ps.setString(2, entrykey);
						ps.executeUpdate();
					}
					
					if(i.equals("0")){
						
						ps = conn.prepareStatement("update teamentry set m1t1s=? where entrykey=?");
						ps.setString(1, Score1);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
						ps = conn.prepareStatement("update teamentry set m1t2s=? where entrykey=?");
						ps.setString(1, Score2);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
					}else if(i.equals("1")){
						
						ps = conn.prepareStatement("update teamentry set m2t1s=? where entrykey=?");
						ps.setString(1, Score1);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
						ps = conn.prepareStatement("update teamentry set m2t2s=? where entrykey=?");
						ps.setString(1, Score2);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
					}else if(i.equals("2")){
						
						ps = conn.prepareStatement("update teamentry set m3t1s=? where entrykey=?");
						ps.setString(1, Score1);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
						ps = conn.prepareStatement("update teamentry set m3t2s=? where entrykey=?");
						ps.setString(1, Score2);
						ps.setString(2, entrykey);
						ps.executeUpdate();
						
					}
					
					conn.close();
					%>
					<form type = "hidden" method="post" name="comeback"></form>
					<script type="text/javascript">
						document.comeback.action="admin_T_main_Entry_Detail.jsp?GroupName=<%=Group%>&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&entrykey=<%=entrykey%>";  
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