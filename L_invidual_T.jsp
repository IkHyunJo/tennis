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
<!--   <script src="//code.jquery.com/jquery-latest.min.js"></script>-->
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
<div id="rolling_box" class="rolling_box">
<div id="R1">
               
 
	     	
<table class="EntryBox marginauto margintop20" width="350px"><tr class="tColor"><th>여성부</th></tr><tr><th>1조 경기</th></tr></table>
<table class="EntryBox marginauto margintop20">
<tr class="tColor"><th width="20px">번</th><th width="110px">이름</th><th width="50px">1</th><th width="50px">2</th><th width="50px">3</th><th width="50px">4</th><th width="60px">결과</th></tr>
<tr class=""><td>1</td><td>김현주<br>홍영희</td>
<td class=""></td><td class="backslash"><span class="Fr">1</span><br><br><span class="Fl">6</span></td><td class="backslash"><span class="Fr">2</span><br><br><span class="Fl">6</span></td><td class=" backslash"><span class="Fr">4</span><br><br><span class="Fl">1</span></td><td class="">-</td></tr>
<tr class="tColor"><td>2</td><td>박소령<br>이사찌코</td>
<td class=" backslash"><span class="Fr">6</span><br><br><span class="Fl">1</span></td><td class=""></td><td class=" backslash"><span class="Fr">5</span><br><br><span class="Fl">6</span></td><td class=" backslash"><span class="Fr">-</span><br><br><span class="Fl">-</span></td><td class="">-</td></tr>
<tr><td>3</td><td class="">정환청<br>박수자</td>
<td class=" backslash"><span class="Fr">6</span><br><br><span class="Fl">2</span></td><td class=" backslash"><span class="Fr">6</span><br><br><span class="Fl">5</span></td><td></td><td class=" backslash"><span class="Fr">1</span><br><br><span class="Fl">6</span></td><td class="">-</td></tr>
<tr><td>4</td><td class="">손정주<br>김희숙</td>
<td class="backslash"><span class="Fr">1</span><br><br><span class="Fl">4</span></td><td class=" backslash"><span class="Fr">-</span><br><br><span class="Fl">-</span></td><td class=" backslash"><span class="Fr">6</span><br><br><span class="Fl">1</span></td></td><td></td><td>-</td>
</table>
        <table class="EntryBox marginauto margintop20">
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>1</td><td>김현주<br>홍영희</td><td>6</td><td rowspan="2">홍연희<br>김현주<br>(승)</td>
        </tr>
        <tr>
        	<td>4</td><td>손정주<br>김희숙</td><td>0</td>
        </tr>
        </table>
        
        
        <table class="EntryBox marginauto margintop20" >
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>2</td><td>박소령<br>이사찌코</td><td>6</td><td rowspan="2">박소령<br>이사찌코<br>(승)</td>
        </tr>
        <tr>
        	<td>3</td><td>정환청<br>박수자</td><td>5</td>
        </tr>
        </table>
        
        <table class="EntryBox marginauto margintop20">
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>1</td><td>김현주<br>홍영희</td><td>6</td><td rowspan="2">김현주<br>홍영희<br>(승)</td>
        </tr>
        <tr>
        	<td>3</td><td>정환청<br>박수자</td><td>2</td>
        </tr>
        </table>
        
        <table class="EntryBox marginauto margintop20">
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>2</td><td>박소령<br>이사찌코</td><td>6</td><td rowspan="2">박소령<br>이사찌코<br>(승)</td>
        </tr>
        <tr>
        	<td>4</td><td>손정주<br>김희숙</td><td>1</td>
        </tr>
        </table>
        
        <table class="EntryBox marginauto margintop20">
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>1</td><td>김현주<br>홍영희</td><td>6</td><td rowspan="2">김현주<br>홍영희<br>(승)</td>
        </tr>
        <tr>
        	<td>2</td><td>박소령<br>이사찌코</td><td>1</td>
        </tr>
        </table>
            
        <table class="EntryBox marginauto margintop20">
        <tr>
        	<th width="20px">번</th><th  width="150px">이름</th><th width="100px">점수</th><th  width="80px">결과</th>
        </tr>
        <tr>
        	<td>3</td><td>정환청<br>박수자</td><td>-</td><td rowspan="2">-</td>
        </tr>
        <tr>
        	<td>4</td><td>손정주<br>김희숙</td><td>-</td>
        </tr>
        </table>


		<hr>
			<div id="leaguefooter">
			<table class="iconbox marginauto" >
			<tr>
			<td><a href="league.jsp?GroupName=여성부A"><img src="./img/goback.png" class="imgSize"></a></td>
			</tr>
			</table>
			</div>
		<hr>
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