<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.ArrayList"%>
​
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
​
​
  <link rel="stylesheet" href="css/normalize.css" />
  <link rel="stylesheet" href="css/foundation.min.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/ie.css" />
  <link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Cabin+Condensed:600' rel='stylesheet' type='text/css'>
<!--	<script src="//code.jquery.com/jquery-latest.min.js"></script>-->
  <script src="js/vendor/custom.modernizr.js"></script>
​
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
$("#m_btn").click(function(){
      $(".mainmenu-ul").slideToggle();
});
});

</script>
​
​
<link rel="stylesheet" type="text/css" href="main01.css" media="screen, projection"/>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.touchSwipe-1.2.5.js"></script>
<script type="text/javascript" src="jquery.baramangSwipe-1.0.js"></script>
<script type="text/javascript" src="baramangSwipeTemplate.js"></script>
​
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
​
</header>
​
<div id="my_frame">
<!--
<div id="Roundnavi">
	<div class="headnavi">
			<div id="Roundbar" class="mainmenu margintop20">
				<h4 class="floatL">LEAGUE</h4>
				<h4 class="floatL">|</h4>
				<h4 id="m_btn"> SELECT LEAGUE </h4>
				<br>
				<div id="viewLeague">
				<h4>개인전 예선 종목</h4>
				</div>
				<ul class="mainmenu-ul">
					<a href="teamleague.jsp"><li class="mainmenu-li"><h4>청년부A</h4></a>
					</li>
					<li class="mainmenu-li"><h4>청년부B-1</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>청년부B-2</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>청년부B-3</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>청년부B-4</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>일반부A</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>일반부B-1</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>일반부B-2</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>일반부B-3</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>일반부B-4</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>장년부A</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>노년부A</h4><a href="#"></a>
					</li>
					<li class="mainmenu-li"><h4>여성부</h4><a href="#"></a>
					</li>
				</ul>
			</div>
	</div>
</div>
-->
<div id="rolling_box" class="rolling_box">
		<div id="R1">
			<table class="table">
			<th colspan="5">출력</th>
			<%
				request.setCharacterEncoding("UTF-8");
			
				String DB_URL = "jdbc:mysql://localhost:3306/database";
				String DB_USER = "root";
				String DB_PASSWORD= "knuvrlab";
			
				Connection conn;
				PreparedStatement ps = null;
				ResultSet rs = null;
				String sql = "select * from indiv_team";
				try {
					conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					ArrayList<String> IT_N = new ArrayList<String>();
					ArrayList<String> Team_N = new ArrayList<String>();
					ArrayList<String> JoSoonw = new ArrayList<String>();
					ArrayList<String> Jo_N = new ArrayList<String>();
					String nCount = "1";
					int i =1;
					while(rs.next()){
						IT_N.add(rs.getString(1));
						Team_N.add(rs.getString(2));
						JoSoonw.add(rs.getString(3));
						Jo_N.add(rs.getString(4));
					}

					while(rs.next())
					{
						i=1;
						%><td><%= i%></td><%
						out.println(i);		
						i++;
					}
			%>
		<%
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
​
			</table>		
		</div>
</div>
</div>
	
</body>
</html>