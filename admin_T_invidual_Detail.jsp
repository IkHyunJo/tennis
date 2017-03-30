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
<div id="inviwrap">
	<div id="top"  data-magellan-expedition="fixed">
		<div class="row">
			<div> <!--class="large-12 columns"-->
				<nav class="top-bar">
				  <ul class="title-area">
				   <li class="name logo">
					  <a href="./index.jsp"><img src="img/logo2.png"  alt=""></a>
					</li>
				</nav>
			</div>
		</div>
	</div>
</div>

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
			
			
			ArrayList<String> M1Name = new ArrayList<String>();
			ArrayList<String> M2Name = new ArrayList<String>();
			ArrayList<String> T1Name = new ArrayList<String>();
			ArrayList<String> T2Name = new ArrayList<String>();
			ArrayList<String> Result = new ArrayList<String>();
			ArrayList<String> T1Score = new ArrayList<String>();
			ArrayList<String> T2Score = new ArrayList<String>();
			ArrayList<String> m1t1s = new ArrayList<String>();
			ArrayList<String> m1t2s = new ArrayList<String>();
			ArrayList<String> m2t1s = new ArrayList<String>();
			ArrayList<String> m2t2s = new ArrayList<String>();
			ArrayList<String> m3t1s = new ArrayList<String>();
			ArrayList<String> m3t2s = new ArrayList<String>();
			ArrayList<String> WinTeam = new ArrayList<String>();

	   		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			String Group = request.getParameter("GroupName");
			String Jo_Number = request.getParameter("Jo_Number");
			String TeamKey1 = request.getParameter("TeamKey1");
			String TeamKey2 = request.getParameter("TeamKey2");
			String MatchKey = request.getParameter("MatchKey");
			
			
			try
			{
			    ps = conn.prepareStatement("select * from teamteam where TeamKey=?");
				ps.setString(1, TeamKey1);
				rs = ps.executeQuery();
					while(rs.next())
					{		
						T1Name.add(rs.getString(2));
						M1Name.add(rs.getString(3));
						M1Name.add(rs.getString(4));
						M1Name.add(rs.getString(5));
						M1Name.add(rs.getString(6));
						M1Name.add(rs.getString(7));
						M1Name.add(rs.getString(9));
						M1Name.add(rs.getString(10));
						M1Name.add(rs.getString(11));
						M1Name.add(rs.getString(12));
					} 
					
					rs.beforeFirst();
			    ps = conn.prepareStatement("select * from teamteam where TeamKey=?");
				ps.setString(1, TeamKey2);
				rs = ps.executeQuery();
					while(rs.next())
					{		
						T2Name.add(rs.getString(2));
						M2Name.add(rs.getString(3));
						M2Name.add(rs.getString(4));
						M2Name.add(rs.getString(5));
						M2Name.add(rs.getString(6));
						M2Name.add(rs.getString(7));
						M2Name.add(rs.getString(9));
						M2Name.add(rs.getString(10));
						M2Name.add(rs.getString(11));
						M2Name.add(rs.getString(12));
					} 
					
				rs.beforeFirst();
			    ps = conn.prepareStatement("select * from teammatch where Matckey=?");
				ps.setString(1, MatchKey);
				rs = ps.executeQuery();
					while(rs.next())
					{		
						T1Score.add(rs.getString(3));
						T2Score.add(rs.getString(5));
						Result.add(rs.getString(6));
						m1t1s.add(rs.getString(10));
						m1t2s.add(rs.getString(11));
						m2t1s.add(rs.getString(12));
						m2t2s.add(rs.getString(13));
						m3t1s.add(rs.getString(14));
						m3t2s.add(rs.getString(15));
					}
					
					if(m1t1s.get(0).equals("-"))
					{
						WinTeam.add("-");
					}
					else
					{
						if(Integer.valueOf(m1t1s.get(0)) > Integer.valueOf(m1t2s.get(0)))
						{
							WinTeam.add(T1Name.get(0));
						}
						else
						{
							WinTeam.add(T2Name.get(0));
						}
					}
					if(m2t1s.get(0).equals("-"))
					{
						WinTeam.add("-");
					}
					else
					{
						if(Integer.valueOf(m2t1s.get(0)) > Integer.valueOf(m2t2s.get(0)))
						{
							WinTeam.add(T1Name.get(0));
						}
						else
						{
							WinTeam.add(T2Name.get(0));
						}
					}
					
					if(m3t1s.get(0).equals("-"))
					{
						WinTeam.add("-");
					}
					else
					{
						if(Integer.valueOf(m3t1s.get(0)) > Integer.valueOf(m3t2s.get(0)))
						{
							WinTeam.add(T1Name.get(0));
						}
						else
						{
							WinTeam.add(T2Name.get(0));
						}
					}
			
					
					
					%><table class="EntryBox marginauto" width="350px"><tr class="tColor"><th><%=T1Name.get(0)%> VS <%=T2Name.get(0)%></th></tr></table>
					<br><br>
					<%
						
							////////////////////////UP Table///////////////////
							
							%>
							
					<table class="EntryBox marginauto">
                     <form action="T_pass.jsp?TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&MatchKey=<%=MatchKey%>&GroupName=<%=Group%>&Jo_Number=<%=Jo_Number%>" method="post">
                     <tr class="tColor">
                        <th  width="150px">팀</th><th width="80px">SCORE</th><th width="120px">RESULT</th>
                     </tr>
                     <tr>
                        <th><%=T1Name.get(0)%></th><th><%=T1Score.get(0)%></th><th rowspan="2"><%=Result.get(0)%></th>
                     </tr>
                     <tr>
                        <th><%=T2Name.get(0)%></th><th><%=T2Score.get(0)%></th>
                     </tr>
                     <tr>
                     <td colspan="5"><input type="submit" style="width:300px;" value="3복 경기 종료"></td>
                     </tr>
                     </form>
                     </table>
							<%
							
							/////////////////////DOWN 1 TABLE//////////////////
							

							int MemberCount=0;
							%>
							<br><br>
							<table class="EntryBox marginauto">
							<form action="T_pass_detail.jsp?i=0&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&MatchKey=<%=MatchKey%>&GroupName=<%=Group%>&Jo_Number=<%=Jo_Number%>" method="post">
							<tr class="tColor">
								<th  width="150px">팀</th><th width="80px" colspan="2">SCORE</th><th width="120px">RESULT</th>
							</tr>
							<tr>
								<td><%=T1Name.get(0)%></td><td><%=m1t1s.get(0)%></td><td>
								<select name="Score1">
								<option value="0">0</option>
								<option >1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>
								</td><td rowspan="2"><%=WinTeam.get(0)%></td>
							</tr>
							<tr>
								<td><%=T2Name.get(0)%></td><td><%=m1t2s.get(0)%></td><td>
								<select name="Score2">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>								
								</td>
							</tr>
							<tr>
			                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
			                  </tr>
							</form>
							</table>
							
							<%
								MemberCount = MemberCount + 3;
							%>
							<%/////////////////////DOWN 2 TABLE////////////////// %>
							<br><br>
							<table class="EntryBox marginauto">
							<form action="T_pass_detail.jsp?i=1&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&MatchKey=<%=MatchKey%>&GroupName=<%=Group%>&Jo_Number=<%=Jo_Number%>" method="post">
							<tr class="tColor">
								<th  width="150px">팀</th><th width="80px" colspan="2">SCORE</th><th width="120px">RESULT</th>
							</tr>
							<tr>
								<td><%=T1Name.get(0)%></td><td><%=m2t1s.get(0)%></td><td>
								<select name="Score1">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>
								</td><td rowspan="2"><%=WinTeam.get(1)%></td>
							</tr>
							<tr>
								<td><%=T2Name.get(0)%></td><td><%=m2t2s.get(0)%></td><td>
								<select name="Score2">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>								
								</td>
							</tr>
							<tr>
			                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
			                  </tr>
							</form>
							</table>
							<%
								MemberCount = MemberCount + 3;
							%>
							
							<%/////////////////////DOWN 3 TABLE////////////////// %>
							<br><br>
							<table class="EntryBox marginauto">
							<form action="T_pass_detail.jsp?i=2&TeamKey1=<%=TeamKey1%>&TeamKey2=<%=TeamKey2%>&MatchKey=<%=MatchKey%>&GroupName=<%=Group%>&Jo_Number=<%=Jo_Number%>" method="post">
							<tr class="tColor">
								<th width="150px">팀</th><th width="80px" colspan="2">SCORE</th><th width="120px">RESULT</th>
							</tr>
							<tr>
								<td><%=T1Name.get(0)%></td><td><%=m3t1s.get(0)%></td><td>
								<select name="Score1">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>
								</td><td rowspan="2"><%=WinTeam.get(2)%></td>
							</tr>
							<tr>
								<td><%=T2Name.get(0)%></td><td><%=m3t2s.get(0)%></td><td>
								<select name="Score2">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								</select>								
								</td>
							</tr>
							<tr>
			                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
			                  </tr>
							</form>
							</table>
							<%
			} catch(Exception e){   e.printStackTrace();}
			 %>


		<div id="leaguefooter">
		<hr>
			<div id="leaguefooter">
			<table class="iconbox marginauto" border="0px">
			<tr>
			<td><a href="admin_T_invidual.jsp?GroupName=<%=Group%>&Jo_Number=<%=Jo_Number%>"><img src="./img/goback.png" class="imgSize"></a></td>
			</tr>
			</table>
			</div>
		<hr>
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