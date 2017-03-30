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
					  <li><h5>
						<form action="SearchResult.jsp?name=name">
						<input type="text" class="FLeft"><input type="submit" value = "SEARCH" name="name"class="FLeft">
						</form></h5></li>
					</ul>
				  </section>
				</nav>
			</div>
		</div>
	</div>
</div>


<%
	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	Connection conn; //
	PreparedStatement ps = null; 
	ResultSet rs = null;
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	
	
	ArrayList<String> TeamKey1 = new ArrayList<String>();
	ArrayList<String> TeamKey2 = new ArrayList<String>();
	ArrayList<String> TeamName1 = new ArrayList<String>();
	ArrayList<String> TeamName2 = new ArrayList<String>();
	ArrayList<String> Univ = new ArrayList<String>();
	ArrayList<String> Round = new ArrayList<String>();
	ArrayList<String> RoundBox = new ArrayList<String>();
	ArrayList<String> Result = new ArrayList<String>();
	ArrayList<String> EntryKey = new ArrayList<String>();
	ArrayList<String> Score1 = new ArrayList<String>();
	ArrayList<String> Score2 = new ArrayList<String>();
	
	
	String Group = request.getParameter("GroupName");
	int PlusRoundCount=0;
	int ResultCount=0;
	int nCount = 0;
	int RoundCount = 0;
	int Vsize =0;
	int vCount = 0;
	int NameCount=0;
	int PlusNameCount=0;
	ps = conn.prepareStatement("select * from gaeinentry");
	rs = ps.executeQuery();
	while(rs.next())
		{
			String rsGroup = rs.getString(4);
			if(rsGroup.equals(Group))
			{
				RoundBox.add(rs.getString(2));
				nCount++;
			}
		}
	for(int i =0 ; i < nCount; i++) // 라운드 갯수 계산
	{
		if(Vsize > Integer.valueOf(RoundBox.get(i)))
		{
		}
		else
		{
			Vsize = Integer.valueOf(RoundBox.get(i));
		}
	}

%>

<div id="my_frame">
<div class="rolling_box">
 	<section class="promotion">
		<div class="slidings"> 
			 <div style="width:350px; height: 150px; position: relative; margin-top:40px;" id="promotionBanner" class="wrap" elementposition="0"> 
				<%for(int j = 1 ; j < Vsize+1 ; j++, vCount++) // 라운드 박스 만큼 FOR문 생성, 자바스크립트 실행(가로값)
				{
					ps = conn.prepareStatement("select * from gaeinentry where Round=?"); 
					ps.setString(1, String.valueOf(j)); // 라운드값 1부터 찾기
					rs = ps.executeQuery();
					rs.beforeFirst();
					while(rs.next())
					{
						String rsGroup = rs.getString(4);
						if(rsGroup.equals(Group))
						{
							EntryKey.add(rs.getString(1)); // 1 , 3
							TeamKey1.add(rs.getString(5)); // 1 , 4
							Score1.add(rs.getString(6));  // 4 3
							TeamKey2.add(rs.getString(7)); // 8 , 5
							Score2.add(rs.getString(8)); // 6 6
							Result.add(rs.getString(9));
							RoundCount++;  // 라운드 박스 갯수(세로 2개)
						}
					}
					%><figure style="left:0; width:350px; position: absolute;" elementindex="<%=j-1%>" elementposition=""> 
					<table class="EntryBox marginauto" width="340px">
					<tr class="tColor">
					<th><%=j%>-ROUND</th>
					</tr>
					</table>
					<%

					for(int i =0 ; i < RoundCount; i++) // ROUNDBOX 생성 반복문
					{

						if((i % 2) == 0)
						{
							%><div id="dummy"></div><%
						}
							if(TeamKey1.get(i+PlusRoundCount).length() >= 4 && TeamKey2.get(i+PlusRoundCount).length() >= 4) // TeamKey1이 미정이면
							{
								%><table class="EntryBox marginauto margintop20"><tr class="tColor"><th width="40px">R</th><th width="160px">이름</th><th width="140px" class="borderl">점수</th></tr>
								<tr class=" borderb"><td rowspan="2"><%=j%></td><td><%=TeamKey1.get(i+PlusRoundCount)%></td><td class="borderl"><%=Score1.get(i+PlusRoundCount)%></td></tr><%
								%><tr><td><%=TeamKey2.get(i+PlusRoundCount)%></td><td class="borderl"><%=Score2.get(i+PlusRoundCount)%></td></tr></table><%
							}
							else if(TeamKey1.get(i+PlusRoundCount).length() <= 3 && TeamKey2.get(i+PlusRoundCount).length() <= 3)///둘다 문자열이 아닐때
							{
								%><table class="EntryBox marginauto margintop20">
								<tr class="tColor"><th width="40px">R</th><th width="160px">이름</th><th width="140px" class="borderl">점수</th></tr><%
								ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
								ps.setString(1, TeamKey1.get(i+PlusRoundCount));
								rs = ps.executeQuery();
								rs.beforeFirst();
									while(rs.next())
									{
										TeamName1.add(rs.getString(2));
										TeamName2.add(rs.getString(4));
										Univ.add(rs.getString(6));
									}
									%><tr class="borderb"><td rowspan="2"><%=j%></td><td><%=TeamName1.get(NameCount)%><%=TeamName2.get(NameCount)%>(<%=Univ.get(NameCount)%>)</td><td class="borderl"><%=Score1.get(i+PlusRoundCount)%></td></tr><%
									NameCount++;
									PlusNameCount = PlusNameCount + NameCount;
											
								ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
								ps.setString(1, TeamKey2.get(i+PlusRoundCount));
								rs = ps.executeQuery();
								rs.beforeFirst();
									while(rs.next())
									{
										TeamName1.add(rs.getString(2));
										TeamName2.add(rs.getString(4));
										Univ.add(rs.getString(6));
									}
									%><tr><td><%=TeamName1.get(NameCount)%><%=TeamName2.get(NameCount)%>(<%=Univ.get(NameCount)%>)</td><td class="borderl"><%=Score2.get(i+PlusRoundCount)%></td></tr><%
									NameCount++;
									PlusNameCount = PlusNameCount + NameCount;
									%></table><%
							}
							else
							{
								if(TeamKey1.get(i+PlusRoundCount).length() >= 4)
								{
								%><table class="EntryBox marginauto margintop20">
								<tr class="tColor"><th width="40px">R</th><th width="160px">이름</th><th width="140px" class="borderl">점수</th></tr>
								<tr class=" borderb"><td rowspan="2"><%=j%></td><td><%=TeamKey1.get(i+PlusRoundCount)%></td><td class="borderl"><%=Score1.get(i+PlusRoundCount)%></td></tr><%
								ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
								ps.setString(1, TeamKey2.get(i+PlusRoundCount));
								rs = ps.executeQuery();
								rs.beforeFirst();
									while(rs.next())
									{
										String TeamKey = rs.getString(1);
										String Name1 = rs.getString(2);
										String Name2 = rs.getString(4);
										String rsUniv = rs.getString(6);
										%>
										<tr><td><%=Name1%><%=Name2%>(<%=rsUniv%>)</td><td class="borderl"><%=Score2.get(i+PlusRoundCount)%></td></tr>
										<%
									}
									%></table><%
								}
								else
								{
									if(TeamKey2.get(i+PlusRoundCount).length() >= 4) // TeamKey 2도 미정일때
									{
										%><table class="EntryBox marginauto margintop20">
										<tr class="tColor"><th width="40px">R</th><th width="160px">이름</th><th width="140px" class="borderl">점수</th></tr>
										<tr class=" borderb"><td rowspan="2"><%=j%></td><td><%=TeamKey2.get(i+PlusRoundCount)%></td><td><%=Score2.get(i+PlusRoundCount)%></td></tr><%
												
										ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
										ps.setString(1, TeamKey1.get(i+PlusRoundCount));
										rs = ps.executeQuery();
										rs.beforeFirst();
											while(rs.next())
											{
												String Name1 = rs.getString(2);
												String Name2 = rs.getString(4);
												String rsUniv = rs.getString(6);
												%>
												<tr><td><%=Name1%><%=Name2%>(<%=rsUniv%>)</td><td><%=Score1.get(i+PlusRoundCount)%></td></tr>
												<%
											}
											%></table><%
									}
								}
							}
					}
					PlusRoundCount = PlusRoundCount + RoundCount;
					RoundCount=0;
					
					%><figcaption></figcaption>
					</figure><%
				}
				conn.close();
				%>
				</div>
			</div>
			<p id="promotionBannerPagination" class="pagination" title="프로모션 순서">
				<span class="active"></span><span></span><span></span><span></span>
			</section>  
			<script type="text/javascript">BaramangSwipe.template.promotionBanner("#promotionBanner", "p#promotionBannerPagination").load();
			</script>
	</div> 
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