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

​
</header>
​
<div id="my_frame">

	<div class="rolling_box marginauto">
		<section class="promotion marginauto">
			<div class="slidings marginauto"> 
				<div style="width:340px; height: 200px; position: relative; margin-top:40px;" id="promotionBanner" class="wrap marginauto" elementposition="0">
					<figure style="left:0; width:230px; position: absolute;" elementindex="0" elementposition="" class="marginauto">
						<img src="./ccc/ccc1.png" width="250" height="143"  alt="이벤트" class="marginauto">
						<figcaption></figcaption>
					</figure>
					<figure style="left:230px; width:230px; position: absolute;" elementindex="1" elementposition="">
						<img src="./ccc/ccc2.png" width="250" height="143" alt="이벤트" class="marginauto">
						<figcaption></figcaption>
					</figure>
					<figure style="left: 460px; width:230px; position: absolute;" elementindex="2" elementposition="">
						<img src="./ccc/ccc3.png" width="250" height="143" alt="이벤트" class="marginauto">
						<figcaption></figcaption>
					</figure>
					<figure style="left: 460px; width:230px; position: absolute;" elementindex="3" elementposition="">
						<img src="./ccc/ccc4.png" width="250" height="143" alt="이벤트" class="marginauto">
						<figcaption></figcaption>
					</figure>
					<figure style="left: 460px; width:230px; position: absolute;" elementindex="4" elementposition="">
						<img src="./ccc/ccc5.png" width="250" height="143" alt="이벤트" class="marginauto">
						<figcaption></figcaption>
					</figure>
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
		<hr>
			<div id="leaguefooter">
			<table class="iconbox marginauto">
			<tr>
			<td><a href="info.jsp"><img src="./img/goback.png" class="imgSize"></a></td>
			</tr>
			</table>
			</div>
		<hr>
</div>

</body>
</html>