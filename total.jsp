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
  <title></title>
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
				   <li class="name logo" width="350px">
					  <a href="./index.jsp"><img src="img/logo2.png"  alt=""></a>
					</li>
				  </ul>
				  
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
Connection conn;
PreparedStatement ps = null; 
ResultSet rs = null;

int CA_cnt = 0; int CA_done = 0;
int CB1_cnt = 0; int CB1_done = 0;
int CB2_cnt = 0; int CB2_done = 0;
int CB3_cnt = 0; int CB3_done = 0;
int CB4_cnt = 0; int CB4_done = 0;

conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

ps = conn.prepareStatement("select * from teammatch");
rs = ps.executeQuery();

while(rs.next()){
	String Group = rs.getString(7);
	String Result = rs.getString(6);
	if(Group.equals("단체전A")){
		CA_cnt++;
		if(Result.length()>4){
			CA_done++;
		}
	}else if(Group.equals("단체전B1")){
		CB1_cnt++;
		if(Result.length()>4){
			CB1_done++;
		}
	}else if(Group.equals("단체전B2")){
		CB2_cnt++;
		if(Result.length()>4){
			CB2_done++;
		}
	}else if(Group.equals("단체전B3")){
		CB3_cnt++;
		if(Result.length()>4){
			CB3_done++;
		}
	}else if(Group.equals("단체전B4")){
		CB4_cnt++;
		if(Result.length()>4){
			CB4_done++;
		}
	}
}

%>



​
<div id="my_frame">

<div id="rolling_box" class="rolling_box">
		<div id="R1">
			<table class="listBox marginauto" width="350px">
			<tr class="tColor">
				<th colspan="2" >개인전</th>
			</tr>
			<tr class="tColor">
				<th>종목</th><th>예선 진행 상황</th>
			</tr>
			<tr>
				<td>단체전A</td><th><%=CA_done%>경기 / <%=CA_cnt%>경기</th>
			</tr>
			<tr>
				<td>단체전B1</td><th><%=CB1_done%>경기 / <%=CB1_cnt%>경기</th>
			</tr>
			<tr>
				<td>단체전B2</td><th><%=CB2_done%>경기 / <%=CB2_cnt%>경기</th>
			</tr>
			<tr>
				<td>단체전B3</td><th><%=CB3_done%>경기 / <%=CB3_cnt%>경기</th>
			</tr>
			<tr>
				<td>단체전B4</td><th><%=CB4_done%>경기 / <%=CB4_cnt%>경기</th>
			</tr>

			</table>	
			<table class="iconbox"><tr><td><font color="black"></font></td></tr></table>
		</div>
</div>
</div>
	
</body>
</html>