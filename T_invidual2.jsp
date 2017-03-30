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
			
			

			ArrayList<String> MatchKey = new ArrayList<String>();
			ArrayList<String> T1Key = new ArrayList<String>();
			ArrayList<String> T2Key = new ArrayList<String>();
			ArrayList<String> T1Score = new ArrayList<String>();
			ArrayList<String> T2Score = new ArrayList<String>();
			ArrayList<String> Ranking = new ArrayList<String>();
			ArrayList<String> TName = new ArrayList<String>();
			ArrayList<String> RsGroup = new ArrayList<String>();
			ArrayList<String> Result = new ArrayList<String>();
			
	   		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			String Group = request.getParameter("GroupName");
			String Jo_Number = request.getParameter("Jo_Number");
			
			int KeyCount=0;
			int KeyCount2=0;
			    ps = conn.prepareStatement("select * from teammatch where Jo=?");
				ps.setString(1, Jo_Number);
				rs = ps.executeQuery();
					while(rs.next())
					{
						String matchGroup = rs.getString(7);
						if(Group.equals(matchGroup))
						{
							MatchKey.add(rs.getString(1));
							T1Key.add(rs.getString(2));
							T2Key.add(rs.getString(4));
							T1Score.add(rs.getString(3));
							T2Score.add(rs.getString(5));
							KeyCount2++;
						}
					}
						rs.beforeFirst();
					    ps = conn.prepareStatement("select * from teamteam where Jo=?");
						ps.setString(1, Jo_Number);
						rs = ps.executeQuery();
							while(rs.next())
							{
								String cvGroup = rs.getString(12);
								if(Group.equals(cvGroup))
								{
									TName.add(rs.getString(2));
									Ranking.add(rs.getString(14));
									RsGroup.add(rs.getString(12));//7
									KeyCount++;
								}
							} 
///////////////////////////////////////////////////////////테이블출력///////////////////////////////////////////////////////////////////////////
				%>
				<table class="EntryBox marginauto" width="365px">
				<tr class="tColor">
					<th><%=Group%> <%=Jo_Number%>조 경기</th>
				</tr>
				</table>
				
               <% int Lcount=0; %>
                <table class="EntryBox marginauto margintop20">
				    <tr><th width="20px">번</th><th width="110px">이름</th><th width="50px">1</th><th width="50px">2</th><th width="50px">3</th><th width="60px">결과</th></tr><%
                for(Lcount=0;Lcount < KeyCount ; Lcount++)
                {
                   if(KeyCount == 2)
                   {
                      if(Lcount==0)
                      {
                         %><tr class="tColor "><td><%=Lcount+1%></td><td><%=TName.get(Lcount)%></td>
						    	<td></td><td class="backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td></td><td><%=Ranking.get(Lcount)%></td></tr>
						    	<%
                      }
                      if(Lcount==1)
                      {
                         %><tr><td><%=Lcount+1%></td><td><%=TName.get(1)%></td>
				    	<td class="backslash"><span class="Fr"><%=T1Score.get(0)%></span><br><br><span class="Fl"><%=T2Score.get(0)%></span></td><td></td><td></td><td><%=Ranking.get(0)%></td></tr>
				    	<%
                      }
                   }
                   if(KeyCount == 3)
                   {
                      if(Lcount==0)
                      {
                         %><tr class="borderb"><td><%=Lcount+1%></td><td class="borderl"><%=TName.get(Lcount)%></td>
				    	<td class="borderl"></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                      if(Lcount==1)
                      {
                         %><tr class="tColor borderb"><td><%=Lcount+1%></td><td class="borderl"><%=TName.get(Lcount)%></td>
				    	<td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class="borderl"></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                      if(Lcount==2)
                      {
                         %><tr ><td><%=Lcount+1%></td><td class="borderl"><%=TName.get(Lcount)%></td>
				    	<td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount)%></span></td><td class="borderl"></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                   }
                }
                %></table><%
					
			int BoxCount =0;
			for(BoxCount =0 ; BoxCount < KeyCount ; BoxCount++)
			{
				if(BoxCount==0)
				{
					try
					{
						%><table class="EntryBox marginauto margintop20"><tr><%
						%><form action = "T_invidual_Detail.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&MatchKey=<%=MatchKey.get(0)%>&TeamKey1=<%=T1Key.get(0)%>&TeamKey2=<%=T2Key.get(0)%>" method = "post">
								</tr><%
						for(int j =0 ; j < 2 ; j++)
						{
							if(Group.equals(RsGroup.get(j)))
							{
								if(j == 0)
								{
								 %>
								<tr class="tColor"><th width="40px">번</th><th width="165px">이름</th><th width="90px">Score</th><th width="70px">결과</th></tr><%
								%><tr><td><%=j+1%></td><td><%=TName.get(j)%></td><td><%=T1Score.get(0) %></td><td rowspan="2"><%=Result.get(0)%></td></tr><%
								}
								else
								{
								%><tr><td><%=j+1%></td><td><%=TName.get(j)%></td><td><%=T2Score.get(0)%></td></tr><%
								}
							}
						}
						%><tr>
						<td colspan="4"><input type="submit" style="width:300px;" value="DETAIL"></td>						
						</tr></form><%
					    %></table><%
					    %><%
					}catch(Exception e){   e.printStackTrace();}
				}
				if(BoxCount == 1)
				{
					try
					{
					%><table class="EntryBox marginauto margintop20"><%
					%><form action = "T_invidual_Detail.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&MatchKey=<%=MatchKey.get(1)%>&TeamKey1=<%=T1Key.get(1)%>&TeamKey2=<%=T2Key.get(1)%>" method="post"><%
					%><tr class="tColor" ><th width="40px">번</th><th width="165px">이름</th><th width="90px">Score</th><th width="70px">결과</th></tr><%
						for(int j = 0 ; j < 3 ; j++)
						{
							if(Group.equals(RsGroup.get(j)))
							{
								if(j == 0)
								{
										if(T1Key.get(1).equals("WinTeam"))
										{
										%><tr><td>-</td><td>1VS2<br>WinTeam</td><td colspan="3">경기전</td></tr><%
										}
										else
										{
										%><tr><td><%=j+1 %></td><td><%=TName.get(j)%></td><td><%=T1Score.get(1)%></td><td rowspan="2"><%=Result.get(0)%></td></tr><%
										}
								}
								else if(j==1)
								{
								}
								else
								{
								%><tr><td><%=j+1 %></td><td><%=TName.get(j)%></td><td><%=T2Score.get(1) %></td>
								</tr><%
								}
							}
						}
						%><tr>
						<td colspan="4"><input type="submit" style="width:300px;" value="DETAIL"></td>						
						</tr></form><%
					    %></table><%
					}catch(Exception e){   e.printStackTrace();}
				}
				if(BoxCount==2)
				{
					try
					{
							%><table class="EntryBox marginauto margintop20"><tr><%
							%><form action = "T_invidual_Detail.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&MatchKey=<%=MatchKey.get(2)%>&TeamKey1=<%=T1Key.get(2)%>&TeamKey2=<%=T2Key.get(2)%>" method="post"><%									
							%></tr><tr class="tColor" ><th width="40px">번</th><th class="" width="165px">이름</th><th width="90px">Score</th><th width="70px">결과</th></tr><%
							for(int j =1 ; j < 3 ; j++)
							{
								if(Group.equals(RsGroup.get(j)))
								{
									if(j == 1)
									{
										if(T1Key.get(2).equals("LoseTeam"))
										{
										%><tr><td>-</td><td class="">1VS2<br>LoseTeam</td><td colspan="3" class="">경기전</td><%
										}
										else
										{
									%><tr><td><%=j+1%></td><td class=""><%=TName.get(j)%></td><td class=""><%=T1Score.get(2)%></td><td rowspan="2" class=""><%=Result.get(2)%></td>
									</tr><%
										}
									}
									else{
									%><tr ><td><%=j+1%></td><td class=""><%=TName.get(j)%></td><td class=""><%=T2Score.get(2)%></td>
									</tr><%
									}
								}
							}
							
							%><tr>
							<td colspan="4"><input type="submit" style="width:300px;" value="DETAIL"></td>						
							</tr></form><%
				    %></table><%
					}catch(Exception e){   e.printStackTrace();}
                 }
             }
  
                  
%>

		
			<div id="leaguefooter">
			<hr>
			<table class="iconbox marginauto">
			<tr>
			<td><a href="T_league.jsp?GroupName=<%=Group%>"><img src="./img/goback.png" class="imgSize"></a></td>
			</tr>
			</table>
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