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
  <title>TENNIS ENTRY</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
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
			<table class="EntryBox marginauto" width="350px">
			<tr class="borderb">
				<th>개인전</th>
			</tr>
			<tr class="borderb">
				<th>종목</th>
			</tr>
			<!-- <tr class="tColor borderb" onclick="javascript:window.location='admin_league.jsp?GroupName=청년부A'">
				<td>청년부A</td>
			</tr>
			<tr class="borderb" onclick="javascript:window.location='admin_llist_CB.jsp?GroupName=청년부B'">
				<td>청년부B</td>
			</tr>
			<tr class="tColor borderb" onclick="javascript:window.location='admin_llist_IA.jsp?GroupName=일반부A'">
				<td>일반부A</td>
			</tr>
			<tr class="borderb" onclick="javascript:window.location='admin_llist_IB.jsp?GroupName=일반부B'">
				<td>일반부B</td>
			</tr>
			<tr class="tColor borderb" onclick="javascript:window.location='admin_llist_JA.jsp?GroupName=장년부A'">
				<td>장년부A</td>
			</tr>
			<tr class="borderb" onclick="javascript:window.location='admin_llist_JB.jsp?GroupName=장년부B'">
				<td>장년부B</td>
			</tr>
			<tr class="tColor borderb" onclick="javascript:window.location='admin_league.jsp?GroupName=노년부A'">
				<td>노년부A</td>
			</tr>
			<tr onclick="javascript:window.location='admin_llist_NB.jsp?GroupName=노년부B'">
				<td>노년부B</td>
			</tr> -->
			<tr class="tColor borderb" onclick="javascript:window.location='admin_T_league.jsp?GroupName=단체전A'">
				<td>단체전A</td>
			</tr>
			<tr onclick="javascript:window.location='admin_llist_DB.jsp?GroupName=단체전B'">
				<td>단체전B</td>
			</tr>
			</table>		
			
		</div>
</div>
</div>
	
</body>
</html>