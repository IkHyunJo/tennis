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
<!-- 버튼  -->
<!-- 버튼 종료 -->
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
<div id="my_frame">
<div id="rolling_box" class="rolling_box">
					<div id="R1">
					
					
		<%
			request.setCharacterEncoding("UTF-8");
		
			String DB_URL = "jdbc:mysql://localhost:3306/db";
			String DB_USER = "root";
			String DB_PASSWORD= "knuvrlab";
			
			Connection conn; //
			PreparedStatement ps = null; 
			ResultSet rs = null;
			
			String Jo_Number = request.getParameter("Jo_Number");
			String Group = request.getParameter("Group");
			String MatchNum = request.getParameter("MatchNum");
			String addNum = request.getParameter("addNum");
			String minusNum = request.getParameter("minusNum");
			String TeamNum2 = request.getParameter("TeamNum");
			ArrayList<String> SSum = new ArrayList<String>(); 
			
			
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select * from gaeinmatch where MatcKey=?");
			ps.setString(1, MatchNum);
		rs = ps.executeQuery();

		
		if(TeamNum2.equals("0")) 
		{
			while(rs.next())
			{
				SSum.add(rs.getString(3));
			}
			if(SSum.get(0).equals("경기전")) // 경기전을 0 으로 업데이트
			{
				ps = conn.prepareStatement("update gaeinmatch set Team1Score=? where Matckey=?");
				ps.setString(1, "0");
				ps.setString(2, MatchNum);
				ps.executeUpdate();

				%>
					<form type = "hidden" method="post" name="comeback"></form>
					<script type="text/javascript">
					document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
					document.comeback.submit();
					</script>
				<%
			}
			else
			{
				if(minusNum==null) // 값을 플러스 할때
				{

					int intSum = Integer.valueOf(SSum.get(0));
					if(intSum == 7)
					{
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						alert("7보다 큰 값입니다.");
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
						intSum = 6;
					}
					else
					{
						intSum = intSum + Integer.valueOf(addNum);
						ps = conn.prepareStatement("update gaeinmatch set Team1Score=? where Matckey=?");
							ps.setString(1, String.valueOf(intSum));
							ps.setString(2, MatchNum);
						ps.executeUpdate();
						%>
							<form type = "hidden" method="post" name="comeback"></form>
							<script type="text/javascript">
							document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
							document.comeback.submit();
							</script>
						<%		
					}
				}
				else if(addNum==null) // 값을 마이너스 할때
				{
					int intSum = Integer.valueOf(SSum.get(0));
					if(intSum <= 0)
					{
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						alert("0보다 작은 값입니다.");
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
						intSum = 0;
						out.println(intSum);
					}
					else
					{
						intSum = intSum + Integer.valueOf(minusNum);
						ps = conn.prepareStatement("update gaeinmatch set Team1Score=? where Matckey=?");
						ps.setString(1, String.valueOf(intSum));
						ps.setString(2, MatchNum);
						ps.executeUpdate();
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
					}
				}
			}			
		}
			


		if(TeamNum2.equals("1"))
		{
			ps = conn.prepareStatement("select * from gaeinmatch where MatcKey=?");
			ps.setString(1, MatchNum);
			rs = ps.executeQuery();
			while(rs.next())
			{
				SSum.add(rs.getString(5));
			}
			
			if(SSum.get(0).equals("경기전")) // 경기전을 0 으로 업데이트
			{
				ps = conn.prepareStatement("update gaeinmatch set Team2Score=? where Matckey=?");
				ps.setString(1, "0");
				ps.setString(2, MatchNum);
				ps.executeUpdate();
				%>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
				document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
				document.comeback.submit();
				</script>
				<%
			}
			else // 값을 플러스 할때
			{
				
				if(minusNum==null)
				{
					int Sum3 = Integer.valueOf(SSum.get(0));
					if(Sum3 == 7)
					{
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						alert("7보다 큰 값입니다.");
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
						Sum3 = 6;
					}
					else
					{
						Sum3 = Sum3 + Integer.valueOf(addNum);
						ps = conn.prepareStatement("update gaeinmatch set Team2Score=? where Matckey=?");
						ps.setString(1, String.valueOf(Sum3));
						ps.setString(2, MatchNum);
						ps.executeUpdate();
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%				
					}
				}
				else if(addNum==null)
				{
					int Sum3 = Integer.valueOf(SSum.get(0)); 
					if(Sum3 <= 0)
					{
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						alert("0보다 작은 값입니다.");
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
						Sum3 = 0;
					}
					else // 값을 마이너스 할때
					{
						Sum3 = Sum3 + Integer.valueOf(minusNum);
						ps = conn.prepareStatement("update gaeinmatch set Team2Score=? where Matckey=?");
						ps.setString(1, String.valueOf(Sum3));
						ps.setString(2, MatchNum);
						ps.executeUpdate();
						%>
						<form type = "hidden" method="post" name="comeback"></form>
						<script type="text/javascript">
						document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>";  
						document.comeback.submit();
						</script>
						<%
					}
				}
			}
		}
			%>
		</table>
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