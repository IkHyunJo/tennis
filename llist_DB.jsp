<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
​<%@ page import="java.net.URLEncoder" %>
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
  <title>단체전B</title>
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
				</nav>
			</div>
		</div>
	</div>
</div>
​
</header>
​
<div id="my_frame">

<div id="rolling_box" class="rolling_box">
		<div id="R1">
			<table class="listBox marginauto" width="350px">
			<tr class="tColor">
				<th colspan="2">단체전</th>
			</tr>
			<tr class="tColor">
				<th colspan="2">종목</th>
			</tr>
			<tr class=" " onclick="javascript:window.location='T_league.jsp?GroupName=단체전B1'">
				<td colspan="2">단체전B1</td>
			</tr>
			<tr class="tColor" onclick="javascript:window.location='T_league.jsp?GroupName=단체전B2'">
				<td colspan="2">단체전B2</td>
			</tr>
			<tr class=" " onclick="javascript:window.location='T_league.jsp?GroupName=단체전B3'">
				<td colspan="2">단체전B3</td>
			</tr>
			<tr class="tColor" onclick="javascript:window.location='T_league.jsp?GroupName=단체전B4'">
				<td colspan="2">단체전B4</td>
			</tr>
			</table>		
			<hr>	
				<div id="leaguefooter">
				<table class="iconbox marginauto">
				<tr>
				<td><a href="T_llist.jsp"><img src="./img/goback.png" class="imgSize"></a></td>
				<td><a href="T_main_Entry.jsp?GroupName=단체전B"><img src="./img/mainentry.png" class="imgSize"></a></td>
				</tr>
				</table>
				</div>
			<hr>			
		</div>
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