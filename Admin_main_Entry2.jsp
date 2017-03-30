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
					<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
				  </ul>
				
				  <section class="top-bar-section">
					<ul class="right" id="menu">
					  <li><h5>
						<form action="SearchResult.jsp?name=name">
						<input type="text" class="FLeft"><input type="submit" value = "SEARCH" name="name"class="FLeft">
						</form></h5></li>
					</ul>
				  </section>
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

Connection conn; //
PreparedStatement ps = null; 
ResultSet rs = null;
conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String Group = request.getParameter("GroupName");

ArrayList<String> TeamKey1 = new ArrayList<String>();
ArrayList<String> TeamKey2 = new ArrayList<String>();
ArrayList<String> TeamName1 = new ArrayList<String>();
ArrayList<String> TeamName2 = new ArrayList<String>();
ArrayList<String> Univ = new ArrayList<String>();
ArrayList<String> Round = new ArrayList<String>();
ArrayList<String> RoundBox = new ArrayList<String>();
ArrayList<String> Result = new ArrayList<String>();
ArrayList<String> EntryKey = new ArrayList<String>();
ArrayList<String> Score1 = new ArrayList<String>();
ArrayList<String> Score2 = new ArrayList<String>();

int nCount = 0;
int RoundCount = 0;
int rCount =1;
int Vsize =0;
int vCount = 1;
int KeyCount =0;
ps = conn.prepareStatement("select * from gaeinentry");
rs = ps.executeQuery();
while(rs.next())
	{
		String rsGroup = rs.getString(4);
		if(rsGroup.equals(Group))
		{
			RoundBox.add(rs.getString(2));
			nCount++;
		}
	}
for(int i =0 ; i < nCount; i++){
	if(Vsize > Integer.valueOf(RoundBox.get(i)))
	{
	}
	else
	{
		Vsize = Integer.valueOf(RoundBox.get(i));
	}
}


	
%>

<div id="my_frame">
<div class="rolling_box">
	<section class="promotion">
		<div class="slidings"> 
			 <div style="width:230px; height: 150px; position: relative; margin-top:40px;" id="promotionBanner" class="wrap" elementposition="0"> 
				<%for(int j = 0 ; j < Vsize ; j++){
					ps = conn.prepareStatement("select * from gaeinentry where Round = ?");
					ps.setString(1, String.valueOf(vCount));
					rs = ps.executeQuery();
					rs.beforeFirst();
					while(rs.next())
					{
						String rsGroup = rs.getString(4);
						if(rsGroup.equals(Group))
						{
							TeamKey1.add(rs.getString(5));
							TeamKey2.add(rs.getString(7));
							Score1.add(rs.getString(6));
							Score2.add(rs.getString(8));
							Result.add(rs.getString(9));
							EntryKey.add(rs.getString(1));
							RoundCount++;
						}
					}
					for(int i =0 ; i < RoundCount ; i++)
					{
						ps = conn.prepareStatement("select * from gaeinteam where Ranking=? or Ranking=?");
						ps.setString(1, TeamKey1.get(i));
						ps.setString(2, TeamKey2.get(i));
						rs = ps.executeQuery();
						rs.beforeFirst();
						while(rs.next())
						{
							TeamName1.add(rs.getString(2));
							TeamName2.add(rs.getString(4));
							Univ.add(rs.getString(6));
						}
					}
					%>
				<figure style="left:0; width:230px; position: absolute;" elementindex="<%=j%>" elementposition="">
				<form action="pass_entry.jsp?EntryKey=<%=EntryKey.get(0)%>&TeamKey1=<%=TeamKey1.get(0)%>&TeamKey2=<%=TeamKey2.get(0)%>&GroupName=<%=Group%>" method="post">
				<table class="Table">
				<tr>
				<th><%=j+1%>-ROUND</th>
				</tr>
				</table>
					<%for(int i =0 ; i < RoundCount ; i++)
					{ %>
					<table class="Entry_Table">
					<tr>
					<th>이름</th><th>SCORE</th>
					</tr>
					<tr>
					<%if((TeamKey1.get(i)).length() >= 4)
						{%>
						<td><%=TeamKey1.get(i)%></td><td><%=Score1.get(i)%></td>
						<%} 
						else if((TeamKey1.get(i)).length() <=  2)
						{
							rs.beforeFirst();
							ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
							ps.setString(1, TeamKey1.get(i));
							rs = ps.executeQuery();
							while(rs.next())
							{
								String Name1 = rs.getString(2);
								String Name2 = rs.getString(4);
								String rsUniv = rs.getString(6);
								%><td><%=Name1%>, <%=Name2%>(<%=rsUniv%>)</td><td><%=Score1.get(i)%></td><td>
								<select name = "Score1">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								</select>
								</td><%
	 						}
						}
						%>
					</tr>
					<tr>
						<%if((TeamKey2.get(i)).length() >= 4)
						{%>
						<td><%=TeamKey2.get(i)%></td><td><%=Score2.get(i)%></td>
						<%} 
						else if((TeamKey2.get(i)).length() <=  2)
						{
							rs.beforeFirst();
							ps = conn.prepareStatement("select * from gaeinteam where TeamKey=?");
							ps.setString(1, TeamKey2.get(i));
							rs = ps.executeQuery();
							while(rs.next())
							{
								String Name1 = rs.getString(2);
								String Name2 = rs.getString(4);
								String rsUniv = rs.getString(6);
								%><td><%=Name1%>, <%=Name2%>(<%=rsUniv%>)</td><td><%=Score2.get(i)%></td><td>
								<select name = "Score2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								</select>
								</td><%
	 						}
						}
						%>
					</tr>
					<%
					if(Result.get(0).equals("경기중"))
	                  {
	                   %><tr>
	                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
	                  </tr>
	                  </form></table><%
	                  }
	                  else
	                  {
	                  %></table></form><%
	                  }
					 }
					vCount++;
					RoundCount = 0;
					TeamKey2.clear();
					Score1.clear();
					Score2.clear();
					TeamKey1.clear();
					EntryKey.clear();
					%>
				<figcaption></figcaption>
					</figure> 
					<%} %>
				
				
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