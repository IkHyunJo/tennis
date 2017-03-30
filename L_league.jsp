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
<%String Group = request.getParameter("GroupName");%>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <title><%=Group%></title>
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


		<table class="EntryBox marginauto" width="350px"><tr class="tColor"><th>여성부</th></tr></table>
		<table class="EntryBox marginauto" width="350px"><tr class="tColor"><th>1조</th><th>팀1</th><th>팀2</th><th>팀3</th><th>팀4</th></tr>
		<tr onclick="javascript:window.location='L_invidual_T.jsp'"><th>1</th><th>김현주<br>홍영희</th><th>박소령<br>이사찌코</th><th>정환청<br>박수자</th><th>손정주<br>김희숙</th></tr>
		<tr onclick="javascript:window.location='L2_invidual.jsp?GroupName=여성부&Jo_Number=2'"><th>2</th><th>최유리<br>한민주</th><th>임효선<br>정경아</th><th>마은경<br>이춘혜</th><th></th></tr>

						
			</table>	
			<hr>	
				<div id="leaguefooter">
				<table class="iconbox marginauto">
				<tr>
				<td><a href="llist.jsp"><img src="./img/goback.png" class="imgSize"></a></td>
				<td><a href="main_Entry.jsp?GroupName=<%=Group%>"><img src="./img/mainentry.png" class="imgSize"></a></td>
				</tr>
				</table>
				</div>
			<hr>
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