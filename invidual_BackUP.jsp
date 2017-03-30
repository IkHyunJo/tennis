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
					<li class="toggle-topbar menu-icon"><a href="#"><span>SEARCH</span></a></li>
				  </ul>
				  <section class="top-bar-section">
					<ul class="right" id="menu">
					  <li><h5>
						<form action="SearchResult.jsp?name=name">
						<table border="0px" class="marginauto"><tr><td><input type="text" name="name"></td>
						<td><input type="submit" value = "SEARCH"></td>
						</tr></table></h5></li></form>
					</ul>
				  </section>
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
			
			int i=0;
			int nCount =0;
			int LoopCount=0;
			int matchplaceC=0;
			int CourtCount =0;
			int MatchPlaceKeyCount =0;

			ArrayList<String> M1Name = new ArrayList<String>();
			ArrayList<String> M2Name = new ArrayList<String>();
			ArrayList<String> RsUniv = new ArrayList<String>();
			ArrayList<String> RsGroup = new ArrayList<String>();
			ArrayList<String> TeamKey = new ArrayList<String>();
			ArrayList<String> MatchTeamKey = new ArrayList<String>();
			ArrayList<String> MatchTeamKey1 = new ArrayList<String>();
			ArrayList<String> MatchTeamKey2 = new ArrayList<String>();
			ArrayList<String> T1Score = new ArrayList<String>();
			ArrayList<String> T2Score = new ArrayList<String>();
			ArrayList<String> Result = new ArrayList<String>();
			ArrayList<String> Ranking = new ArrayList<String>();
			ArrayList<String> placekey = new ArrayList<String>();
			ArrayList<String> PlaceName = new ArrayList<String>();
			ArrayList<String> CourtNum = new ArrayList<String>();
			ArrayList<String> MatchPlaceKey = new ArrayList<String>();
			ArrayList<String> GaeinCourtNum = new ArrayList<String>();
			ArrayList<String> GaeinPlaceName = new ArrayList<String>();
			ArrayList<String> CourtNum1 = new ArrayList<String>();
			ArrayList<String> PlaceNum1 = new ArrayList<String>();
			ArrayList<String> PlaceName1 = new ArrayList<String>();
			String rsvGroup = "";
			String rsvPlaceKey ="";
	   		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			String Group = request.getParameter("GroupName");
			String Jo_Number = request.getParameter("Jo_Number");
			
			%><table class="EntryBox marginauto " width="350px"><tr class="tColor"><th><%=Group%></th></tr><tr><th><%=Jo_Number%>조 경기</th></tr></table>
			<%
			try{
				    ps = conn.prepareStatement("select * from gaeinteam where Jo=?");
					ps.setString(1, Jo_Number);
					rs = ps.executeQuery();
						while(rs.next()){		
								String trsGroup = rs.getString(7);
								if(trsGroup.equals(Group))
								{
									TeamKey.add(rs.getString(1));
									M1Name.add(rs.getString(2));
									M2Name.add(rs.getString(4));
									RsUniv.add(rs.getString(6));
									RsGroup.add(rs.getString(7));
									Ranking.add(rs.getString(9));
									nCount++;
								}
							} // 넘어온 조와 그룹의 Teamkey, 이름, 대학을 받음
					rs.beforeFirst();
				    ps = conn.prepareStatement("select * from gaeinmatch where Jo=?");
					ps.setString(1, Jo_Number);
					rs = ps.executeQuery();
					
					while(rs.next())
					{
						String MGroup = rs.getString(8);
						if(MGroup.equals(Group))
						{
							MatchTeamKey.add(rs.getString(1));
							MatchTeamKey1.add(rs.getString(2));
							MatchTeamKey2.add(rs.getString(4));
							MatchPlaceKey.add(rs.getString(7));
							i++;
							MatchPlaceKeyCount++;
						}
					}
					for(int j = 0 ; j < MatchPlaceKeyCount; j++)
					{
					    ps = conn.prepareStatement("select * from place where Placekey=?");
						ps.setString(1, MatchPlaceKey.get(j));
						rs = ps.executeQuery();
						rs.beforeFirst();
						while(rs.next())
						{
							GaeinCourtNum.add(rs.getString(3));
							GaeinPlaceName.add(rs.getString(2));
						}
					}
					
					///////////////////////배정된 경기장///////////////
				    ps = conn.prepareStatement("select * from gaeinjo where Jo=?");
					ps.setString(1, Jo_Number);
					rs = ps.executeQuery();
					while(rs.next())
					{
						for(int T =3; T < 8 ; T++)
						{
							rsvPlaceKey = rs.getString(T);
								if(!(rsvPlaceKey.equals("")))
								{
									rsvGroup = rs.getString(1);
									if(Group.equals(rsvGroup)){
										placekey.add(rs.getString(T));
										CourtCount++;
									}
									
								}
						}
					}
					for(int CourtNUM =0; CourtNUM < CourtCount ; CourtNUM++)
					{
					    ps = conn.prepareStatement("select * from place where PlaceKey=?");
						ps.setString(1, placekey.get(CourtNUM));
						rs = ps.executeQuery();
						rs.beforeFirst();
							while(rs.next())
							{	
								PlaceName.add(rs.getString(2));
								CourtNum.add(rs.getString(3));
							}
					}
					
					int j=0;
				    ps = conn.prepareStatement("select * from gaeinmatch where MatcKey=?");
				    while(i>0)
				    {
						ps.setString(1, MatchTeamKey.get(j));
						rs = ps.executeQuery();
						rs.beforeFirst();
						while(rs.next())
						{
							T1Score.add(rs.getString(3));
							T2Score.add(rs.getString(5));
							Result.add(rs.getString(6));
							Ranking.add(rs.getString(10));
							i--;
							j++;
							LoopCount++;
						}
				    }
				    int Lcount=0;

				    %><table class="EntryBox marginauto margintop20">
				    <!-- 
				    <tr><th colspan="2">경기장</th><th colspan="4">-</th></tr>
				    <tr><th colspan="2">코트 </th><th colspan="4">  <%
				    for(int CCN = 0 ; CCN < 1 ; CCN++)
				    {
				    	%>-<%
				    }
				    %>
					    번 </th></tr> -->
				    <tr class="tColor"><th width="20px">번</th><th class="" width="110px">이름</th><th th class="" width="50px">1</th><th th class="" width="50px">2</th><th th class="" width="50px">3</th><th th class="" width="60px">결과</th></tr><%
				    for(Lcount=0;Lcount < nCount ; Lcount++)
				    {
				    	if(nCount == 2)
				    	{
					    	if(Lcount==0)
					    	{
						    	%><tr class=" "><td><%=Lcount+1%></td><td th class=""><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td th class=""></td><td th class=" backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td th class=""></td><td th class=""><%=Ranking.get(Lcount)%></td></tr>
						    	<%
					    	}
					    	if(Lcount==1)
					    	{
						    	%><tr><td><%=Lcount+1%></td><td th class=""><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td th class=" backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td th class=""></td><td th class=""></td><td th class=""><%=Ranking.get(Lcount)%></td></tr>
						    	<%
					    	}
				    	}
				    	if(nCount == 3)
					    {
					    	if(Lcount==0)
					    	{
						    	%><tr class=""><td><%=Lcount+1%></td><td class=""><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td class=""></td><td class=" backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td class=" backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class=""><%=Ranking.get(Lcount)%></td></tr>
						    	<%
					    	}
					    	if(Lcount==1)
					    	{
						    	%><tr class=" "><td><%=Lcount+1%></td><td class=""><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td class=" backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class=""></td><td class=" backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class=""><%=Ranking.get(Lcount)%></td></tr>
						    	<%
					    	}
					    	if(Lcount==2)
					    	{
						    	%><tr ><td><%=Lcount+1%></td><td class=""><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td class=" backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class=" backslash"><span class="Fr"><%=T1Score.get(Lcount)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount)%></span></td><td class=""></td><td class=""><%=Ranking.get(Lcount)%></td></tr>
						    	<%
					    	}
				    	}
				    }
				    %></table><%
			}		catch(Exception e){	e.printStackTrace();}
			
			
			
///////////////////////////////아래 테이블//////////////////////////////////////			
			
			int BoxCount =0;
			for(BoxCount =0 ; BoxCount < LoopCount ; BoxCount++)
			{
				if(BoxCount==0)
				{
					try
					{	
						%><table class="EntryBox marginauto margintop20"><tr><%
						for(int j =0 ; j < 2 ; j++)
						{
							if(Group.equals(RsGroup.get(j)))
							{
								if(j == 0)
								{
									if(MatchPlaceKey.get(BoxCount) == null)
									{
										%><th colspan="5" class="">미배정</th><%
									}
									else
									{
									%><th colspan="3" class=" "><%=GaeinPlaceName.get(BoxCount)%></th><th class=""><%=GaeinCourtNum.get(BoxCount)%> 코트</th><%
									}
								 %>
								</tr>
								<tr class="tColor"><th width="40px">번</th><th class="" width="150px">이름</th><th class="" width="90px">Score</th><th class="" width="70px">결과</th></tr><%
								%><tr class=""><td><%=j+1 %></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T1Score.get(0) %></td><td rowspan="2" class=""><%=Result.get(0)%></td></tr><%
								}
								else
								{
								%><tr><td><%=j+1 %></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T2Score.get(0) %></td>
								</tr><%
								}
							}
						}
					    %></table><%
					    %><%
					}		catch(Exception e){	e.printStackTrace();}
				}
				if(BoxCount == 1)
				{
					try
					{
					%><table class="EntryBox marginauto margintop20"><tr><%
					if(MatchPlaceKey.get(BoxCount) == null)
					{
						%><th colspan="5" class="">미배정</th><%
					}
					else
					{
						%><th colspan="3" class=""><%=GaeinPlaceName.get(BoxCount)%></th><th><%=GaeinCourtNum.get(BoxCount)%> 코트</th><%
					}
					%></tr><tr class="tColor" ><th width="40px">번</th><th class="" width="150px">이름</th><th class="" width="90px">Score</th><th class="" width="70px">결과</th></tr>	<%
						for(int j = 0 ; j < 3 ; j++)
						{
							if(Group.equals(RsGroup.get(j)))
							{
								
								if(j == 0)
								{
										if(MatchTeamKey1.get(1).equals("WinTeam"))
										{
										%><tr class=""><td>-</td><td class="">1VS2<br>WinTeam</td><td colspan="3" class="">경기전</td></tr><%
										}
										else
										{
											%><tr class=""><td><%=j+1 %></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T1Score.get(1)%></td><td rowspan="2" class=""><%=Result.get(1)%></td>
										</tr><%
										}
								}
								else if(j==1)
								{
								}
								else
								{
								%><tr><td><%=j+1 %></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T2Score.get(1) %></td>
								</tr><%
								}
							}
						}
					    %></table><%
					}		catch(Exception e){	e.printStackTrace();}
				}
				if(BoxCount==2)
				{
						try
						{
						%><table class="EntryBox marginauto margintop20"><tr><%
						if(MatchPlaceKey.get(BoxCount) == null)
						{
							%><th colspan="5" class="">미배정</th><%
						}
						else
						{
							%><th colspan="3" class=""><%=GaeinPlaceName.get(BoxCount)%></th><th><%=GaeinCourtNum.get(BoxCount)%> 코트</th><%
						}
						%></tr><tr class="tColor" ><th width="40px">번</th><th class="" width="150px">이름</th><th class="" width="90px">Score</th><th class="" width="70px">결과</th></tr>	<%
						for(int j =1 ; j < 3 ; j++)
						{
							if(Group.equals(RsGroup.get(j)))
							{
								if(j == 1)
								{
									if(MatchTeamKey1.get(2).equals("LoseTeam"))
									{
									%><tr class=""><td>-</td><td class="">1VS2<br>LoseTeam</td><td colspan="3" class="">경기전</td><%
									}
									else
									{
								%><tr class=""><td><%=j+1%></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T1Score.get(2)%></td><td rowspan="2" class=""><%=Result.get(2)%></td>
								</tr><%
									}
								}
								else{
								%><tr ><td><%=j+1%></td><td class=""><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class=""><%=T2Score.get(2)%></td>
								</tr><%
								}
							}
						}
				    %></table><%		
						}		catch(Exception e){	e.printStackTrace();}
				}
			}
				


		%>
		<div id="leaguefooter">
		<hr>
			<div id="leaguefooter">
			<table class="iconbox marginauto" border="0px">
			<tr>
			<td><a href="llist.jsp"><img src="./img/goback.png" class="imgSize"></a></td>
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