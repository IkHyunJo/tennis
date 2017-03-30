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
<%	String Name = request.getParameter("Name"); %>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <title><%=Name%></title>
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
						<table border="0px" class="marginauto "><tr><td><input type="text" name="name"></td>
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

<div id="rolling_box">
		<div id="R1">
			<table class="EntryBox marginauto" width="340px">
			

<%
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	Connection conn; 
	PreparedStatement ps = null; 
	ResultSet rs = null;

	String Univ = request.getParameter("Univ");
	ArrayList<String> TeamKey = new ArrayList<String>();
	ArrayList<String> GteamGroup = new ArrayList<String>();
	ArrayList<String> GteamJoNumber = new ArrayList<String>();
	ArrayList<String> GteamName1 = new ArrayList<String>();
	ArrayList<String> GteamName2 = new ArrayList<String>();
	ArrayList<String> Score1 = new ArrayList<String>();
	ArrayList<String> Score2 = new ArrayList<String>();
	ArrayList<String> MatchKey = new ArrayList<String>();
	ArrayList<String> getTeamKey = new ArrayList<String>();
	ArrayList<String> getTeamKey1 = new ArrayList<String>();
	ArrayList<String> getTeamKey2 = new ArrayList<String>();
	ArrayList<String> Result = new ArrayList<String>();
	ArrayList<String> Name2 = new ArrayList<String>();
	ArrayList<String> Name1 = new ArrayList<String>();
	ArrayList<String> mTeamKey1 = new ArrayList<String>();
	ArrayList<String> mTeamKey2 = new ArrayList<String>();
	ArrayList<String> mUniv = new ArrayList<String>();
	ArrayList<String> eTeamKey1 = new ArrayList<String>();
	ArrayList<String> eTeamKey2 = new ArrayList<String>();
	ArrayList<String> eName1 = new ArrayList<String>();
	ArrayList<String> eName2 = new ArrayList<String>();
	ArrayList<String> eScore1 = new ArrayList<String>();
	ArrayList<String> eScore2 = new ArrayList<String>();
	ArrayList<String> eUniv = new ArrayList<String>();
	ArrayList<String> eResult = new ArrayList<String>();
	ArrayList<String> eTeamKey = new ArrayList<String>();
	ArrayList<String> eGroup = new ArrayList<String>();
	ArrayList<String> eBox = new ArrayList<String>();
	ArrayList<String> eRound = new ArrayList<String>();
	ArrayList<String> eTK1 = new ArrayList<String>();
	ArrayList<String> eTK2 = new ArrayList<String>();
	ArrayList<String> teName1 = new ArrayList<String>();
	ArrayList<String> teName2 = new ArrayList<String>();
	ArrayList<String> teUniv = new ArrayList<String>();
	ArrayList<String> ReturnG = new ArrayList<String>();
	ArrayList<String> ReturnJ = new ArrayList<String>();


    int rCount=0;
	int bCount=0;
	int eCount=0;

    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    %><tr class="tColor"><td colspan="4">[<%=Univ%>][<%=Name%>] 검색 결과</td></tr></table>    <%

    ps = conn.prepareStatement("select * from gaeinteam where Member1=? or Member2=?");
	ps.setString(1, Name);
	ps.setString(2, Name);
    rs = ps.executeQuery();
    while(rs.next())
    {
    	String rsUniv = rs.getString(6);
    	if(rsUniv.equals(Univ))
    	{
	    	TeamKey.add(rs.getString(1));
	    	GteamGroup.add(rs.getString(7));
	    	GteamJoNumber.add(rs.getString(8));
	    	rCount++;
    	}
    } //팀키 18, 청년부A, 1조, 김성진, 주백석
    //rCount == 0 이면 NODATA
    if(rCount == 0)
    {
    	%><table class="EntryBox marginauto" width="340px"><tr><td><h4>DATA가 없습니다.</h4></td></tr></table><%
    }
    else
    {
        rs.beforeFirst();
        ps = conn.prepareStatement("select * from gaeinmatch where Team1Key=? or Team2Key=?");
    	ps.setString(1, TeamKey.get(0));
    	ps.setString(2, TeamKey.get(0));
        rs = ps.executeQuery();
        while(rs.next())
        {
        	String rsGroup = rs.getString(8);
        	String rsJo = rs.getString(9);
        	if(GteamGroup.get(0).equals(rsGroup))
        	{
        		if(GteamJoNumber.get(0).equals(rsJo))
        		{
		        	Score1.add(rs.getString(3)); // Team1Key Score
		        	Score2.add(rs.getString(5)); // Team2Key Score
		        	getTeamKey.add(rs.getString(2));
		        	getTeamKey.add(rs.getString(4));
		        	Result.add(rs.getString(6));
		        	bCount++; // bCount == 1 이면
        		}
        	}
        }


        if(bCount == 1)
        {
	        rs.beforeFirst();
	        ps = conn.prepareStatement("select * from gaeinteam where TeamKey=? or TeamKey=?");
	    	ps.setString(1, getTeamKey.get(0));
	    	ps.setString(2, getTeamKey.get(1));
	        rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	GteamName1.add(rs.getString(2));
	        	GteamName2.add(rs.getString(4));
	        	mUniv.add(rs.getString(6));
	        }
	        %><table class="EntryBox marginauto margintop20" width="340px"><tr class="tColor"><th>이름</th><th>점수</th><th>결과</th></tr><%
	        %><tr><td><%=GteamName1.get(0)%><br><%=GteamName2.get(0)%><br>(<%=mUniv.get(0)%>)</td><td><%=Score1.get(0)%></td><td rowspan="2"><%=Result.get(0)%></td></tr><%
	        %><tr><td><%=GteamName1.get(1)%><br><%=GteamName2.get(1)%><br>(<%=mUniv.get(1)%>)</td><td><%=Score2.get(0)%></td></tr></table><%
        }
        
        if(bCount == 2)
        {
	        rs.beforeFirst();
	        ps = conn.prepareStatement("select * from gaeinteam where TeamKey=? or  TeamKey=? or  TeamKey=? or  TeamKey=?");
	    	ps.setString(1, getTeamKey.get(0));
	    	ps.setString(2, getTeamKey.get(1));
	    	ps.setString(3, getTeamKey.get(2));
	    	ps.setString(4, getTeamKey.get(3));
	        rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	GteamName1.add(rs.getString(2));
	        	GteamName2.add(rs.getString(4));
	        	mUniv.add(rs.getString(6));
	        }
	        if(getTeamKey.get(0).equals("WinTeam"))
	           {
	              %><table class="EntryBox marginauto margintop20"  width="340px"><tr class="tColor"><th width="200px">이름</th><th width="70px">점수</th><th width="70px">결과</th></tr><%
	                  %><tr><td>WinTeam</td><td>경기 배정중</td></tr><%
	                  %><tr><td><%=GteamName1.get(0)%><br><%=GteamName2.get(0)%><br>(<%=mUniv.get(0)%>)</td><td><%=Score2.get(0)%></td></tr></table><%

	           }
	           if(getTeamKey.get(2).equals("LoseTeam"))
	           {
	              %><table class="EntryBox marginauto margintop20"  width="340px"><tr class="tColor"><th width="200px">이름</th><th width="70px">점수</th><th width="70px">결과</th></tr><%
	                %><tr><td>LoseTeam</td><td>경기 배정중</td></tr><%
	                %><tr><td><%=GteamName1.get(0)%><br><%=GteamName2.get(0)%><br>(<%=mUniv.get(0)%>)</td><td><%=Score2.get(0)%></td></tr></table><%

	           }else{
	   	        %><table class="EntryBox marginauto margintop20" width="340px"><tr class="tColor"><th width="200px">이름</th><th width="70px">점수</th><th width="70px">결과</th></tr><%
	   	 	        %><tr><td><%=GteamName1.get(0)%><br><%=GteamName2.get(0)%><br>(<%=mUniv.get(0)%>)</td><td><%=Score1.get(0)%></td><td rowspan="2"><%=Result.get(0)%></td></tr><%
	   	 	        %><tr><td><%=GteamName1.get(1)%><br><%=GteamName2.get(1)%><br>(<%=mUniv.get(1)%>)</td><td><%=Score2.get(0)%></td></tr></table><%
	   	 	        
	   	 	        %><table class="EntryBox marginauto margintop20" width="340px"><tr class="tColor"><th width="200px">이름</th><th width="70px">점수</th><th width="70px">결과</th></tr><%
	   	 	        %><tr><td><%=GteamName1.get(0)%><br><%=GteamName2.get(0)%><br>(<%=mUniv.get(0)%>)</td><td><%=Score1.get(1)%></td><td rowspan="2"><%=Result.get(1)%></td></tr><%
	   	 	        %><tr><td><%=GteamName1.get(2)%><br><%=GteamName2.get(2)%><br>(<%=mUniv.get(2)%>)</td><td><%=Score2.get(1)%></td></tr>
	   	 	       <%
	   	 	        
	           }

        }
    }

%>
</table>
				<div id="leaguefooter">
					<hr>
						<a href="league.jsp?GroupName=<%=GteamGroup.get(0)%>"><img src="./img/goback.png"></a>
					<hr>
				</div>
		</div>
</div>
			<p id="promotionBannerPagination" class="pagination" title="프로모션 순서">
				<span class="active"></span><span></span><span></span><span></span>
			</p>
	</section>
<script type="text/javascript">
BaramangSwipe.template.promotionBanner("#promotionBanner", "p#promotionBannerPagination").load();
</script>
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