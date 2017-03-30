<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if IE 8]><html class="lt-ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <title>TENNIS</title>

  <link rel="stylesheet" href="css/normalize.css" />
  <link rel="stylesheet" href="css/foundation.min.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/ie.css" />
  <link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Cabin+Condensed:600' rel='stylesheet' type='text/css'>
  <link rel="apple-touch-icon" href="icon.png" />
  <link rel="shortcut icon" href="icon.png" />
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
  <script src="js/vendor/custom.modernizr.js"></script>
</head>

<%

	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:mysql://localhost:3306/database";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	ps = conn.prepareStatement("insert into example_default_now values(default,'check',default)");
	ps.executeUpdate();
	
	conn.close();

%>

<body>
<div id="wrap">
	<h1>제45회<br>
	전국교수테니스대회<br>
	경기홈페이지</h1>
	<h2>2016. 5. 27 ~ 28<br><br>
	경북대학교</h2>
	
	<div id="dualtype">
	<hr>
	<a href="llist.jsp"><img src="./img/individual.png"></a>
	<hr>
	<a href="T_llist.jsp"><img src="./img/team.png"></a>
    <hr>	
	 <h3>
    <a href="http://kuptf.org/?page_id=70">대회 공지사항</a>
    </h3>
	<hr>
	<h3>
	<a href="info.jsp">사용안내</a>
    </h3>
    <hr>
	<h3>
	<a href="total.jsp">예선진행률</a> 
    </h3>
	<hr>
	<h2>
        <a href="LoginForm.jsp">관리자</a>
    </h2>
	<hr>
	</div>
	<h2>(C)KNUVRLAB</h2>

</div>
</body>
</html>