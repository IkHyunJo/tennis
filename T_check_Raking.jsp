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

<div id="my_frame">
<div id="rolling_box" class="rolling_box">
					<div id="R1">
					
					
		<%
			request.setCharacterEncoding("UTF-8");
		
			String DB_URL = "jdbc:mysql://localhost:3306/db";
			String DB_USER = "root";
			String DB_PASSWORD= "knuvrlab";
			
			Connection conn; //
			PreparedStatement ps = null; 
			ResultSet rs = null;
			
			PreparedStatement ps2 = null; 
			ResultSet rs2 = null;
			
			PreparedStatement ps3 = null; 
			ResultSet rs3 = null;
			
			ArrayList<String> M1Name = new ArrayList<String>();
			ArrayList<String> RsGroup = new ArrayList<String>();
			ArrayList<String> TeamKey = new ArrayList<String>();
			ArrayList<String> MatchTeamKey = new ArrayList<String>();
			ArrayList<String> MatchTeamKey1 = new ArrayList<String>();
			ArrayList<String> MatchTeamKey2 = new ArrayList<String>();
			ArrayList<String> T1Score = new ArrayList<String>();
			ArrayList<String> T2Score = new ArrayList<String>();
			ArrayList<String> Result = new ArrayList<String>();


	   		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			int addNum=1;
			int minusNum=-1;
			int j=0;
			int i=0;
			int nCount =0;
			int LoopCount=0;
			String MGroup = "";

			String Group = request.getParameter("GroupName");
			String Jo_Number = request.getParameter("Jo_Number");
			
			
			%><div id="Entryh5"><%=Group%> <%=Jo_Number%>조 경기 결과 수동입력</div>
			<%
			try{
				    ps = conn.prepareStatement("select * from teamteam where Jo=?");
					ps.setString(1, Jo_Number);
					rs = ps.executeQuery();
						while(rs.next()){		
								String trsGroup = rs.getString(12);
								if(trsGroup.equals(Group))
								{
									M1Name.add(rs.getString(2));
									MatchTeamKey.add(rs.getString(1));
									MatchTeamKey1.add(rs.getString(2));
									MatchTeamKey2.add(rs.getString(4));
									Result.add(rs.getString(6));									
									nCount++;
								}
							} // 넘어온 조와 그룹의 Teamkey, 이름, 대학을 받음
						
						
						out.println(nCount);

				    while(nCount>0)
				    {
						rs.beforeFirst();
					    ps = conn.prepareStatement("select * from teammatch where MatcKey=?");
						ps.setString(1, MatchTeamKey.get(j));
						rs = ps.executeQuery();
						while(rs.next())
						{
							T1Score.add(rs.getString(3));
							T2Score.add(rs.getString(5));
							nCount--;
							j++;
							LoopCount++;
						}
				    }
				    out.println(nCount);
				    int Lcount=0;
				    %>
   					<form action="T_Set_Result.jsp?Group=<%=Group%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=MatchTeamKey.get(0)%>&TeamKey2=<%=MatchTeamKey.get(1)%>&TeamKey3=<%=MatchTeamKey.get(2)%>" method="post">			    
				    <table class="EntryBox" width="350px">
				    <tr><th>번호</th><th>이름</th><th>결과</th></tr><%
				    for(Lcount=0; Lcount < LoopCount ; Lcount++)
				    {
				    	if(LoopCount == 3)
					    {
					    	if(Lcount==0)
					    	{
						    	%><tr><td><%=Lcount+1%></td><td><%=M1Name.get(Lcount)%></td>
						    	<td>
						    	<select size = "1" name="Rank_1" style ="width:100px;">
						    	<option><%=Jo_Number%>조1위</option>
						    	<option><%=Jo_Number%>조2위</option>
						    	<option><%=Jo_Number%>조3위</option>
						    	</select>
						    	</td></tr>
						    	<%
					    	}
					    	if(Lcount==1)
					    	{
						    	%><tr><td><%=Lcount+1%></td><td><%=M1Name.get(Lcount)%></td>
						    	<td>
						    	<select size = "1" name="Rank_2" style ="width:100px;">
						    	<option><%=Jo_Number%>조1위</option>
						    	<option><%=Jo_Number%>조2위</option>
						    	<option><%=Jo_Number%>조3위</option>
						    	</select>
						    	</td></tr>
						    	<%
					    	}
					    	if(Lcount==2)
					    	{
						    	%><tr><td><%=Lcount+1%></td><td><%=M1Name.get(Lcount)%></td>
						    	<td>
						    	<select size = "1" name="Rank_3" style ="width:100px;">
						    	<option><%=Jo_Number%>조1위</option>
						    	<option><%=Jo_Number%>조2위</option>
						    	<option><%=Jo_Number%>조3위</option>
						    	</select>
						    	</td></tr>
						    	<%
					    	}
				    	}
				    }
				    
				    %>
				    <tr>
						<td colspan="3"><input type="submit" style="width:300px;" value="Submit"></td>
						</tr>
				    </table></form><%
				    conn.close();
			}		catch(Exception e){	e.printStackTrace();}
			
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