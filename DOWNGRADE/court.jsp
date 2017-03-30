<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
</header>

<div id="my_frame">
<!--
<div id="Roundnavi">
	<div class="headnavi">
			<div id="Roundbar" class="mainmenu margintop20">
				<h4 class="floatL">ROUND</h4>
				<h4 class="floatL">|</h4>
				<h4 id="m_btn" class="floatL"> SELECT EVENT </h4>
				<script>
				function open_in_frame(div) {
				   $('#my_frame').attr('src', div);
				}
				</script>
					<div id ="numBtn">
							<h4 class="floatL2"><button onclick="location.href=#R1">01</button></h4>
							<h4 class="floatL2"><button onclick='open_in_frame("#R2")'>02</button></h4>
							<h4 class="floatL2"><button onclick='open_in_frame("https://docs.google.com/spreadsheets/d/1vc6HYjRw3KZaUt71exjG8PnWHyGDQrFpjwcBoAg6SOs/gviz/tq?tqx=out:jsp&tq=SELECT+B,C,D,E+WHERE+A+CONTAINS+3&gid=0")'>03</button></h4>
							<h4 class="floatL2"><button onclick='open_in_frame("https://docs.google.com/spreadsheets/d/1vc6HYjRw3KZaUt71exjG8PnWHyGDQrFpjwcBoAg6SOs/gviz/tq?tqx=out:jsp&tq=SELECT+B,C,D,E+WHERE+A+CONTAINS+3&gid=0")'>04</button></h4>
							<h4 class="floatL2"><button onclick='open_in_frame("https://docs.google.com/spreadsheets/d/1vc6HYjRw3KZaUt71exjG8PnWHyGDQrFpjwcBoAg6SOs/gviz/tq?tqx=out:jsp&tq=SELECT+B,C,D,E+WHERE+A+CONTAINS+3&gid=0")'>05</button></h4>
					</div>
				<ul class="mainmenu-ul">
				<li class="mainmenu-li"><h4>û���A</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>û���B-1</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>û���B-2</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>û���B-3</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>û���B-4</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>�Ϲݺ�A</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>�Ϲݺ�B-1</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>�Ϲݺ�B-2</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>�Ϲݺ�B-3</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>�Ϲݺ�B-4</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>����A</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>����A</h4><a href="#"></a>
				</li>
				<li class="mainmenu-li"><h4>������</h4><a href="#"></a>
				</li>
				</ul>
			</div>
	</div>
</div>
-->
<div id="rolling_box" class="rolling_box">
	<section class="promotion">
		<div class="slidings"> 
			<div style="width:230px; height: 150px; position: relative; margin-top:40px;" id="promotionBanner" class="wrap" elementposition="0">
				<figure style="left:0; width:230px; position: absolute;" elementindex="0" elementposition="">
		<div id="R1">
		<div id="Entryh5">û���A [court : ��ϴ��б�]</div>
			<table class="table">
				<tr>
					<th>�׷�</th>
					<th>��ȣ</th>
					<th>�̸�</th>
					<th>SCORE</th>
					<th>���</th>				
				</tr>
				<tr>
					<td rowspan="3">1</td>
					<td>1</td>
					<td>��⿭<br>
					������<br>
					(��ϴ�)</td>
					<td>6</td>
					<td>��</td>
				</tr>
				<tr>
					<td>2</td>
					<td>��⿭<br>
					������<br>
					(��ϴ�)</td>
					<td>2</td>					
					<td>��</td>
				</tr>
			</table>					
		</div>
		<div id="R2">
		<div id="Entryh5">û���B-1 [court : ��ϴ��б�]</div>
			<table class="table">
				<tr>
					<th>�׷�</th>
					<th>��ȣ</th>
					<th>�̸�</th>
					<th>SCORE</th>
					<th>���</th>				
				</tr>
				<tr>
					<td rowspan="3">1</td>
					<td>1</td>
					<td>��⿭<br>
					������<br>
					(��ϴ�)</td>
					<td>6</td>
					<td>��</td>
				</tr>
				<tr>
					<td>2</td>
					<td>��⿭<br>
					������<br>
					(��ϴ�)</td>
					<td>2</td>					
					<td>��</td>
				</tr>
			</table>					
		</div>		
				</figure>
			</div>
		</div>
			<p id="promotionBannerPagination" class="pagination" title="���θ�� ����">
				<span class="active"></span><span></span><span></span><span></span>
			</p>
	</section>
<script type="text/javascript">
BaramangSwipe.template.promotionBanner("#promotionBanner", "p#promotionBannerPagination").load();
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