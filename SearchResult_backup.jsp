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
						<input type="text" name="name" class="FLeft"><input type="submit" value = "SEARCH" class="FLeft">
						</form></h5></li>
					  <!--<li data-magellan-arrival="contact"><a href="#contact">Contact Us</a></li> -->
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
			<table class="table">
			

<%
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	Connection conn; 
	PreparedStatement ps = null; 
	ResultSet rs = null;
    int NameCount=0;
	ArrayList<String> Univ = new ArrayList<String>();
	
	String Name = "이병인";// request.getParameter("name");
	
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    ps = conn.prepareStatement("select * from gaeinteam where Member1=? or Member2=?");
	ps.setString(1, Name);
	ps.setString(2, Name);
    rs = ps.executeQuery();
    
    %><tr><td colspan="2">[<%=Name %>] 검색 결과</td></tr><%
    while(rs.next())
    {
    	Univ.add(rs.getString(6));
    	NameCount++;
    }
    if(NameCount == 0)
    {
    	NameCount = 0;
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        ps = conn.prepareStatement("select * from gaeinteam where Member2=?");
    	ps.setString(1, Name);
        rs = ps.executeQuery();
        while(rs.next())
        {
        	Univ.add(rs.getString(6));
        	NameCount++;
        }
        if(NameCount==0)
        {
	    %><tr>
	        <td>일치하는 이름이 없습니다.</td>
	    </tr><%
        }
        else
        {
        	for(int i=0 ; i < NameCount ; i++)
    	    {
    	    %><tr>
    	        <td onclick="javascript:window.location='SearchMatch.jsp?Name=<%=Name%>&Univ=<%=Univ.get(i)%>'"><%=Name%></td><td><%=Univ.get(i)%> </td>
    	    </tr><%
    	    }
        }
    }
    else
    {
    	NameCount=0;
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        ps = conn.prepareStatement("select * from gaeinteam where Member1=?");
    	ps.setString(1, Name);
        rs = ps.executeQuery();
        while(rs.next())
        {
        	Univ.add(rs.getString(6));
        	NameCount++;
        }
        if(NameCount==0)
        {
	    %><tr>
	        <td>일치하는 이름이 없습니다.</td>
	    </tr><%
        }
        else
        {
		    for(int i=0 ; i < NameCount ; i++)
		    {
			    %><tr>
			        <td onclick="javascript:window.location='SearchMatch.jsp?Name=<%=Name%>&Univ=<%=Univ.get(i)%>'"><%=Name%></td><td><%=Univ.get(i)%> </td>
			    </tr><%
		    }
        }
    }


	
%>
</tr>
</table>		
				<div id="leaguefooter">
					<hr>
						<a href="main.jsp"><img src="./img/goback.png"></a>
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