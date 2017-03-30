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
					<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
				  </ul>
				
				  <section class="top-bar-section">
					<ul class="right" id="menu">
					  <li data-magellan-arrival="product"><a href="#product">MYPAGE</a></li>
					  <li data-magellan-arrival="product"><a href="./app-landing-page.jsp" traget="header">ENTRY</a></li>
					  <li data-magellan-arrival="pricing"><a href="#pricing-table">SEARCH</a></li>
					  <!--<li data-magellan-arrival="contact"><a href="#contact">Contact Us</a></li> -->
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
			
			PreparedStatement ps2 = null; 
			ResultSet rs2 = null;
			
			PreparedStatement ps3 = null; 
			ResultSet rs3 = null;
			
			ArrayList<String> M1Name = new ArrayList<String>();
			ArrayList<String> M2Name = new ArrayList<String>();
			ArrayList<String> RsUniv = new ArrayList<String>();
			ArrayList<String> RsGroup = new ArrayList<String>();
			ArrayList<String> TeamKey = new ArrayList<String>();
			ArrayList<String> GetTeamKey1 = new ArrayList<String>();
			ArrayList<String> GetTeamKey2 = new ArrayList<String>();
			ArrayList<String> GetTeamKey3 = new ArrayList<String>();
			ArrayList<String> Rs1Score1 = new ArrayList<String>();
			ArrayList<String> Rs2Score1 = new ArrayList<String>();
			ArrayList<String> Rs1Score2 = new ArrayList<String>();
			ArrayList<String> Rs2Score2 = new ArrayList<String>();
			ArrayList<String> Rs1Score3 = new ArrayList<String>();
			ArrayList<String> Rs2Score3 = new ArrayList<String>();
			ArrayList<String> Score = new ArrayList<String>(); 
	   		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			int addNum=1;
			int minusNum=-1;
			int nCount2 = 2;
			int value = 0;
			int bCount =0;
			int gCount =0;
			int fCount=20;
			int tCount =1;
			int nCount =0;
			String Group = new String(request.getParameter("GroupName").getBytes("8859_1"), "EUC-KR");
			String Jo_Number = request.getParameter("Jo_Number");
			
			
			%><div id="Entryh5"><%=Group%> <%=Jo_Number%>조 경기</div>
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
									String Member1 = rs.getString(2);
									M1Name.add(rs.getString(2));
									String Member2 = rs.getString(4);
									M2Name.add(rs.getString(4));
									String Univ = rs.getString(6);
									RsUniv.add(rs.getString(6));
									String rsGroup = rs.getString(7);
									RsGroup.add(rs.getString(7));
									nCount++;
								}
							}
			}		catch(Exception e){	e.printStackTrace();}

			try{
						%><!-- 1번팀 스코어 입력받기 시작 --><%
						//1번Table
					    ps = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
						ps.setString(1, TeamKey.get(0));
						ps.setString(2, TeamKey.get(1));
						rs = ps.executeQuery();
						rs.beforeFirst();
						while(rs.next())
						{
							GetTeamKey1.add(rs.getString(1)); // 1번 Match NUmber
							if(GetTeamKey1.get(0) == null)
							{
								Rs1Score1.add(null);
								Rs2Score1.add(null);
							}
							else
							{
							    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
								ps.setString(1, GetTeamKey1.get(0));
								rs = ps.executeQuery();
								rs.beforeFirst();
								while(rs.next()) // 1번 Match NUmber의 SCORE
								{
									Rs1Score1.add(rs.getString(3));
									Rs2Score1.add(rs.getString(5));
								}
							}
						}
					    ps = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
						ps.setString(1, TeamKey.get(1));
						ps.setString(2, TeamKey.get(0));
						rs = ps.executeQuery();
						rs.beforeFirst();
						while(rs.next())
						{
							GetTeamKey1.add(rs.getString(1)); // 1번 Match NUmber
							if(GetTeamKey1.get(0) == null)
							{
							    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
								ps.setString(1, GetTeamKey1.get(0));
								rs = ps.executeQuery();
								rs.beforeFirst();
								while(rs.next()) // 1번 Match NUmber의 SCORE
								{
									Rs1Score1.add(rs.getString(3));
									Rs2Score1.add(rs.getString(5));
								}
							}
						}
			} catch(Exception e){	e.printStackTrace();}
						%><!-- 1번팀 스코어 입력받기 끝 --><%
						
						
						
						%><!-- 2번팀 스코어 입력받기 시작 --><%
			try{
						//2번Table
					    ps2 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
						ps2.setString(1, TeamKey.get(0));
						ps2.setString(2, TeamKey.get(2));
						rs2 = ps2.executeQuery();
						rs2.beforeFirst();
						while(rs2.next())
						{
							GetTeamKey2.add(rs2.getString(1)); // 2번 Match NUmber
							if(GetTeamKey2.get(0) == null)
							{
								Rs1Score2.add(null);
								Rs2Score2.add(null);
							}
							else
							{
								// 2번 테이블 출력하는 곳
							    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
								ps.setString(1, GetTeamKey2.get(0));
								rs = ps.executeQuery();
								String TeamKey1 = TeamKey.get(0);
								String TeamKey2 = TeamKey.get(2);
								rs.beforeFirst();
								while(rs.next()) // 2번 Match NUmber의 SCORE
								{
									Rs1Score2.add(rs.getString(3));
									Rs2Score2.add(rs.getString(5));
								}
							}
						}
					    ps2 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
						ps2.setString(1, TeamKey.get(2));
						ps2.setString(2, TeamKey.get(0));
						rs2 = ps2.executeQuery();
						rs2.beforeFirst();
						while(rs2.next())
						{
							GetTeamKey2.add(rs2.getString(1)); // 2번 Match NUmber
							if(GetTeamKey2.get(0) == null)
							{
								Rs1Score2.add(null);
								Rs2Score2.add(null);
							}
							else
							{
								// 2번 테이블 출력하는 곳
							    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
								ps.setString(1, GetTeamKey2.get(0));
								rs = ps.executeQuery();
								String TeamKey1 = TeamKey.get(2);
								String TeamKey2 = TeamKey.get(0);
								rs.beforeFirst();
								while(rs.next()) // 2번 Match NUmber의 SCORE
								{
									Rs1Score2.add(rs.getString(3));
									Rs2Score2.add(rs.getString(5));
								}
							}
						}

						

			}		catch(Exception e){	e.printStackTrace();}

					%><!-- 2번팀 스코어 입력받기 끝 --><%

					%><!-- 3번팀 스코어 입력받기 시작 --><%
					try{
						
					ps3 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
					ps3.setString(1, TeamKey.get(1));
					ps3.setString(2, TeamKey.get(2));
					rs3 = ps3.executeQuery();
					rs3.beforeFirst();
					while(rs3.next())
					{
						GetTeamKey3.add(rs3.getString(1)); // 3번 Match NUmber
						if(GetTeamKey3.get(0) == null)
						{
							Rs1Score3.add(null);
							Rs2Score3.add(null);
						}
						else
						{
						    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
							ps.setString(1, GetTeamKey3.get(0));
							rs = ps.executeQuery();
							rs.beforeFirst();
							while(rs.next()) // 3번 Match NUmber의 SCORE
							{
								Rs1Score3.add(rs.getString(3));
								Rs2Score3.add(rs.getString(5));
							}
						}
					}
				    ps3 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
					ps3.setString(1, TeamKey.get(2));
					ps3.setString(2, TeamKey.get(1));
					rs3 = ps3.executeQuery();
					rs3.beforeFirst();
					while(rs3.next())
					{
						GetTeamKey3.add(rs3.getString(1)); // 3번 Match NUmber
						if(GetTeamKey3.get(0) == null)
						{
							Rs1Score3.add(null);
							Rs2Score3.add(null);
						}
						else
						{
						    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
							ps.setString(1, GetTeamKey3.get(0));
							rs = ps.executeQuery();
							rs.beforeFirst();
							while(rs.next()) // 3번 Match NUmber의 SCORE
							{
								Rs1Score3.add(rs.getString(3));
								Rs2Score3.add(rs.getString(5));
							}
						}
					}
					%><!-- 3번팀 스코어 입력받기 끝 --><%
			}			catch(Exception e){	e.printStackTrace();}

			try
			{
				%><table class="table"><tr><th>번</th><th>이름</th><%
						for(int i =0 ; i < nCount;i++)
						{
							%><th><%=i+1%></th><%
						}
						%><th>결과</th></tr><%
					for(int i = 0 ; i < nCount ; i++)
					{
							if(i == 0)
							{
									%><tr><td><%=i+1%></td>
									<td><%=M1Name.get(i)%><br>
									<%=M2Name.get(i)%><br>
									(<%=RsUniv.get(i)%>)</td><td bgcolor="black"></td><td><%=Rs1Score1.get(0)%>vs<%=Rs2Score1.get(0)%></td><td><%=Rs1Score2.get(0)%>vs<%=Rs2Score2.get(0)%></td></tr><%
							}
							else if(i == 1)
							{
								%><tr><td><%=i+1%></td>
									<td><%=M1Name.get(i)%><br>
									<%=M2Name.get(i)%><br>
									(<%=RsUniv.get(i)%>)</td><td><%=Rs2Score1.get(0)%>vs<%=Rs1Score1.get(0)%></td><td bgcolor="black"></td><td><%=Rs1Score3.get(0)%>vs<%=Rs2Score3.get(0)%></td></tr><%
							}
							else if(i==2)
							{
									%><tr><td><%=i+1%></td>
									<td><%=M1Name.get(i)%><br>
									<%=M2Name.get(i)%><br>
									(<%=RsUniv.get(i)%>)</td><td><%=Rs2Score2.get(0)%>vs<%=Rs1Score2.get(0)%></td><td><%=Rs2Score3.get(0)%>vs<%=Rs1Score3.get(0)%></td><td bgcolor="black"></td></tr><%
							}
					}
						%></table><%

			}
			catch(Exception e){	e.printStackTrace();}

		try
		{				
					//1번Table
				    ps = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
					ps.setString(1, TeamKey.get(0));
					ps.setString(2, TeamKey.get(1));
					rs = ps.executeQuery();
					rs.beforeFirst();
					while(rs.next())
					{
						GetTeamKey1.add(rs.getString(1)); // 1번 Match NUmber
					}

				    ps = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
					ps.setString(1, TeamKey.get(1));
					ps.setString(2, TeamKey.get(0));
					rs = ps.executeQuery();
					rs.beforeFirst();
					while(rs.next())
					{
						GetTeamKey1.add(rs.getString(1)); // 1번 Match NUmber
					}
					if(GetTeamKey1.get(0) != null)
					{
					    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
						ps.setString(1, GetTeamKey1.get(0));
						rs = ps.executeQuery();
						
						rs.beforeFirst();
						while(rs.next()) // 1번 Match NUmber의 SCORE
						{
							Rs1Score1.add(rs.getString(3));
							Rs2Score1.add(rs.getString(5));
						}
							String TeamKey2="";
							String TeamKey1="";
							if(Integer.valueOf(TeamKey.get(0)) > Integer.valueOf(TeamKey.get(1)))
							{
								TeamKey1 = TeamKey.get(0);
								TeamKey2 = TeamKey.get(1);
							}
							else
							{
								TeamKey2 = TeamKey.get(0);
								TeamKey1 = TeamKey.get(1);
							}
						// 1번 테이블 출력하는 곳
						%><table class="table"><tr><td>번</td><td>이름</td><td colspan="2">Score</td><td>결과</td></tr><%
							int j1 = 0;
							int j2 = 0;
								for(int j =0 ; j < nCount2 ; j++)
								{
									if(Group.equals(RsGroup.get(j)))
									{
										if(j == 0){
										%><tr><td><%=j+1 %></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs1Score1.get(0) %></td>
										<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey1.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'">
							<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey1.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'"></td><td rowspan="2">Result</td></tr><%
										j1 = j+1;
										}
										else{
										%><tr><td><%=j+1 %></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs2Score1.get(0) %></td>
										<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey1.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'">
							<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey1.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'"></td></tr><%
										j2 = j+1;
										}
									}
								}
						%><tr><td colspan = "2"><form action="pass.jsp?Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=TeamKey2%>&TeamKey2=<%=TeamKey1%>" method="post">
						<%=j1%>번팀<input type="radio" name="value" value="1"></td><td></td><td colspan="2"><%=j2%>번팀<input type="radio" name="value" value="2"></td><td></td></tr><tr><td  colspan="5"><input type="submit" style="width:300px;" value="Submit"></td></tr></form></table><%
						value = 0;
					}
		}			catch(Exception e){	e.printStackTrace();}

		try
		{
							//2번Table
						    ps2 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
							ps2.setString(1, TeamKey.get(0));
							ps2.setString(2, TeamKey.get(2));
							rs2 = ps2.executeQuery();
							rs2.beforeFirst();
							while(rs2.next())
							{
								GetTeamKey2.add(rs2.getString(1)); // 2번 Match NUmber
							}
							    ps2 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
								ps2.setString(1, TeamKey.get(2));
								ps2.setString(2, TeamKey.get(0));
								rs2 = ps2.executeQuery();
								rs2.beforeFirst();
								while(rs2.next())
								{
									GetTeamKey2.add(rs2.getString(1)); // 2번 Match NUmber
								}
									rs.beforeFirst();
									
				// 2번 테이블 출력하는 곳
				if(GetTeamKey2.get(0) != null)
				{
					    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
						ps.setString(1, GetTeamKey2.get(0));
						rs = ps.executeQuery();
						String TeamKey1 = TeamKey.get(2);
						String TeamKey2 = TeamKey.get(0);
						rs.beforeFirst();
						String TeamKey3="";
						String TeamKey4="";
						if(Integer.valueOf(TeamKey.get(0)) > Integer.valueOf(TeamKey.get(2)))
						{
							TeamKey3 = TeamKey.get(0);
							TeamKey4 = TeamKey.get(2);
						}
						else
						{
							TeamKey4 = TeamKey.get(0);
							TeamKey3 = TeamKey.get(2);
						}
						while(rs.next()) // 2번 Match NUmber의 SCORE
						{
							Rs1Score2.add(rs.getString(3));
							Rs2Score2.add(rs.getString(5));
						}
						int j1=0;
						int j2=0;
						%><table class="table"><tr><td>번</td><td>이름</td><td colspan="2">Score</td><td>결과</td></tr><%
							for(int j = 0 ; j < nCount2+1 ; j++)
							{
								if(Group.equals(RsGroup.get(j)))
								{
									if(j == 0){
									%><tr><td><%=j+1 %></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs1Score2.get(0) %></td>
									<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey2.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'">
						<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey2.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'"></td><td rowspan="2">test</td></tr><%
									j1=j+1;
									}
									else if(j==1)
									{
									}
									else{
									%><tr><td><%=j+1 %></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs2Score2.get(0) %></td>
									<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey2.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'">
						<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey2.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'"></td></tr><%
									j2=j+1;
									}
								}
							}
						%><tr><td colspan="2"><form action="pass.jsp?Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=TeamKey4%>&TeamKey2=<%=TeamKey3%>" method="post">
					<%=j1%>번팀<input type="radio" name="value" value="1"></td><td></td><td colspan="2"><%=j2%>번팀<input type="radio" name="value" value="2"></td><td></td></tr><tr><td  colspan="5"><input type="submit" style="width:300px;" value="Submit"></td></tr></form></table>
					<%				}
		} 			catch(Exception e){	e.printStackTrace();}

		try
		{
				
				
				//3번Table
				ps3 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
				ps3.setString(1, TeamKey.get(1));
				ps3.setString(2, TeamKey.get(2));
				rs3 = ps3.executeQuery();
				rs3.beforeFirst();
				while(rs3.next())
				{
					GetTeamKey3.add(rs3.getString(1)); // 3번 Match NUmber
				}
					    ps3 = conn.prepareStatement("select * from gaeinmatch where TeamKey=? and TeamKey2=?");
						ps3.setString(1, TeamKey.get(2));
						ps3.setString(2, TeamKey.get(1));
						rs3 = ps3.executeQuery();
						rs3.beforeFirst();
						while(rs3.next())
						{
							GetTeamKey3.add(rs3.getString(1)); // 3번 Match NUmber
						}
						rs.beforeFirst();
						if(GetTeamKey3.get(0) != null)
						{
							    ps = conn.prepareStatement("select * from gaeinmatch where Matckey=?");
								ps.setString(1, GetTeamKey3.get(0));
								rs = ps.executeQuery();
								rs.beforeFirst();
								String TeamKey5="";
								String TeamKey6="";
								if(Integer.valueOf(TeamKey.get(2)) > Integer.valueOf(TeamKey.get(1)))
								{
									TeamKey5 = TeamKey.get(2);
									TeamKey6 = TeamKey.get(1);
								}
								else
								{
									TeamKey6 = TeamKey.get(2);
									TeamKey5 = TeamKey.get(1);
								}
								while(rs.next()) // 3번 Match NUmber의 SCORE
								{
									Rs1Score3.add(rs.getString(3));
									Rs2Score3.add(rs.getString(5));
								}
								int j1=0;
								int j2=0;
								%><table class="table"><tr><td>번</td><td>이름</td><td colspan="2">Score</td><td>결과</td></tr><%
									for(int j =1 ; j < nCount2+1 ; j++)
									{
										if(Group.equals(RsGroup.get(j)))
										{
											if(j == 1){
											%><tr><td><%=j+1%></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs1Score3.get(0) %></td>
											<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey3.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'">
								<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey3.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=0'"></td><td rowspan="2">test</td></tr><%
											j1=j+1;
											}
											else{
											%><tr><td><%=j+1%></td><td><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td><%=Rs2Score3.get(0) %></td>
											<td><input type="submit" value="▲" onclick ="javascript:window.location.href='Set_Score.jsp?addNum=<%=addNum%>&MatchNum=<%=GetTeamKey3.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'">
								<input type="submit" value="▼" onclick ="javascript:window.location.href='Set_Score.jsp?minusNum=<%=minusNum%>&MatchNum=<%=GetTeamKey3.get(0)%>&Jo_Number=<%=Jo_Number%>&Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&TeamNum=1'"></td></tr><%
											j2=j+1;
											}
										}
									}
								%><tr><td colspan="2"><form action="pass.jsp?Group=<%=URLEncoder.encode(Group, "EUC-KR")%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=TeamKey6%>&TeamKey2=<%=TeamKey5%>" method="post">
								<%=j1%>번팀<input type="radio" name="value" value="1"></td><td></td><td colspan="2"><%=j2%>번팀<input type="radio" name="value" value="2"></td><td></td></tr><tr><td  colspan="5"><input type="submit" style="width:300px;" value="Submit"></td></tr></form></table>
						<%
					}						
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