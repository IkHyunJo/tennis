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
               <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
              </ul>
            
				  <section class="top-bar-section">
					<ul class="right" id="menu">
					  <li><h5>
						<form action="SearchResult.jsp?name=name">
						<input type="text" name="name" class="FLeft"><input type="submit" value = "SEARCH" class="FLeft">
						</form></h5></li>
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
         
         PreparedStatement ps2 = null; 
         ResultSet rs2 = null;
         
         PreparedStatement ps3 = null; 
         ResultSet rs3 = null;
         
         ArrayList<String> M1Name = new ArrayList<String>();
         ArrayList<String> M2Name = new ArrayList<String>();
         ArrayList<String> RsUniv = new ArrayList<String>();
         ArrayList<String> RsGroup = new ArrayList<String>();
         ArrayList<String> TeamKey = new ArrayList<String>();
         ArrayList<String> MatchTeamKey = new ArrayList<String>();
         ArrayList<String> MatchTeamKey1 = new ArrayList<String>();
         ArrayList<String> MatchTeamKey2 = new ArrayList<String>();
         ArrayList<String> T1Score = new ArrayList<String>();
         ArrayList<String> T2Score = new ArrayList<String>();
         ArrayList<String> Result = new ArrayList<String>();
         ArrayList<String> PlaceKey = new ArrayList<String>();
         ArrayList<String> Ranking = new ArrayList<String>();
         ArrayList<String> placekey = new ArrayList<String>();
         ArrayList<String> PlaceName = new ArrayList<String>();
         ArrayList<String> CourtNum = new ArrayList<String>();
         ArrayList<String> MatchCourtN = new ArrayList<String>();
         ArrayList<String> MatchPlaceN = new ArrayList<String>();

			
		

         conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
         int addNum=1;
         int minusNum=-1;
         int i=0;
         int nCount =0;
         int CourtCount =0;
         int LoopCount=0;
         String Group = request.getParameter("GroupName");
         String Jo_Number = request.getParameter("Jo_Number");
         String rsvGroup = "";
         String rsvPlaceKey ="";
	     	int JoNum=0;
	     	
	     	int JoNum2=0;
	    	if(Group.equals("청년부B2")){	JoNum=10;}
	    	if(Group.equals("청년부B3")){	JoNum=20;}
	    	if(Group.equals("청년부B4")){	JoNum=30;}
	    	if(Group.equals("일반부A2")){	JoNum=10;}
	    	if(Group.equals("일반부B2")){	JoNum=16;}
	    	if(Group.equals("일반부B3")){	JoNum=32;}
	    	if(Group.equals("일반부B4")){	JoNum=48;}
	    	if(Group.equals("장년부A2")){	JoNum=10;}
	    	if(Group.equals("장년부B2")){	JoNum=12;}
	    	if(Group.equals("노년부B2")){	JoNum=10;}
			
	    	JoNum2 = Integer.valueOf(Jo_Number) + JoNum;
         
			%><table class="EntryBox marginauto margintop20" width="350px"><tr class="tColor"><th><%=Group%></th></tr><tr><th><%=JoNum2%>조 경기</th></tr></table>
			<%
         try{
            

                ps = conn.prepareStatement("select * from gaeinteam where Jo=?");
               ps.setString(1, Jo_Number);
               rs = ps.executeQuery();
                  while(rs.next()){      
                        String trsGroup = rs.getString(7);
                        if(trsGroup.equals(Group))
                        {
                           TeamKey.add(rs.getString(1));
                           String Member1 = rs.getString(2);
                           M1Name.add(rs.getString(2));
                           String Member2 = rs.getString(4);
                           M2Name.add(rs.getString(4));
                           String Univ = rs.getString(6);
                           RsUniv.add(rs.getString(6));
                           String rsGroup = rs.getString(7);
                           RsGroup.add(rs.getString(7));
                           Ranking.add(rs.getString(9));
                           nCount++;
                        }
                     } // 넘어온 조와 그룹의 Teamkey, 이름, 대학을 받음
               rs.beforeFirst();
                ps = conn.prepareStatement("select * from gaeinmatch where Jo=?");
               ps.setString(1, Jo_Number);
               rs = ps.executeQuery();
               
               while(rs.next())
               {
                  String MGroup = rs.getString(8);
                  if(MGroup.equals(Group))
                  {
                     MatchTeamKey.add(rs.getString(1));
                     MatchTeamKey1.add(rs.getString(2));
                     MatchTeamKey2.add(rs.getString(4));
                     Result.add(rs.getString(6));
                     i++;
                  }
               }
               rs.beforeFirst();
               int j=0;
                ps = conn.prepareStatement("select * from gaeinmatch where MatcKey=?");
                while(i>0)
                {
                  ps.setString(1, MatchTeamKey.get(j));
                  rs = ps.executeQuery();
                  while(rs.next())
                  {
                     T1Score.add(rs.getString(3));
                     T2Score.add(rs.getString(5));
                     Result.add(rs.getString(6)); 
                     PlaceKey.add(rs.getString(7));
                     i--;
                     j++;
                     LoopCount++;
                  }
                }
                rs.beforeFirst();
                for(int CCount=0; CCount < j;CCount++)
                {
                    ps = conn.prepareStatement("select * from place where Placekey=?");
                    ps.setString(1, PlaceKey.get(CCount));
                    rs = ps.executeQuery();
                    rs.beforeFirst();
                    while(rs.next())
                    {
                    	MatchCourtN.add(rs.getString(3));
                    	MatchPlaceN.add(rs.getString(2));
                    }
                }
///////////////////////배정된 경기장///////////////
			    ps = conn.prepareStatement("select * from gaeinjo where Jo=?");
				ps.setString(1, Jo_Number);
				rs = ps.executeQuery();

				while(rs.next())
				{
					for(int T =3; T < 8 ; T++)
					{
						rsvPlaceKey = rs.getString(T);
							if(!(rsvPlaceKey.equals("")))
							{
								rsvGroup = rs.getString(1);
								if(Group.equals(rsvGroup))
								{
									placekey.add(rs.getString(T));
									CourtCount++;
								}
							}
					}
				}
				int PlCount =0;
				for(int CourtNUM =0; CourtNUM < CourtCount ; CourtNUM++)
				{
				    ps = conn.prepareStatement("select * from place where PlaceKey=?");
					ps.setString(1, placekey.get(CourtNUM));
					rs = ps.executeQuery();
					rs.beforeFirst();
						while(rs.next())
						{	
							PlaceName.add(rs.getString(2));
							CourtNum.add(rs.getString(3));
							PlCount++;
						}
				}
                int Lcount=0;
                %><table class="EntryBox marginauto margintop20">
					<tr><th colspan="2">경기장</th><th colspan="4"><%=PlaceName.get(0)%></th></tr>
				    <tr><th colspan="2">코트 </th><th colspan="4"><%
				    for(int CCN = 0 ; CCN < PlCount ; CCN++)
				    {
				    		%><%=CourtNum.get(CCN)%>  <%
				    }
				    %>
					    번 </th></tr>                
				    <tr class="tColor"><th width="20px">번</th><th class="borderl" width="110px">이름</th><th th class="borderl" width="50px">1</th><th th class="borderl" width="50px">2</th><th th class="borderl" width="50px">3</th><th th class="borderl" width="60px">결과</th></tr><%
                for(Lcount=0;Lcount < nCount ; Lcount++)
                {
                   if(nCount == 2)
                   {
                      if(Lcount==0)
                      {
                         %><tr><td><%=Lcount+1%></td><td th class="borderl"><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
						    	<td th class="borderl"></td><td th class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td th class="borderl"></td><td th class="borderl"><%=Ranking.get(Lcount)%></td></tr>
						    	<%
                      }
                      if(Lcount==1)
                      {
                         %><tr><td><%=Lcount+1%></td><td th class="borderl"><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
				    	<td th class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td th class="borderl"></td><td th class="borderl"></td><td th class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                   }
                   if(nCount == 3)
                   {
                      if(Lcount==0)
                      {
                         %><tr class=""><td><%=Lcount+1%></td><td><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
				    	<td class="borderl"></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount)%></span></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                      if(Lcount==1)
                      {
                         %><tr class="tColor borderb"><td><%=Lcount+1%></td><td class="borderl"><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
				    	<td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class="borderl"></td><td class="borderl backslash"><span class="Fr"><%=T2Score.get(Lcount+1)%></span><br><br><span class="Fl"><%=T1Score.get(Lcount+1)%></span></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                      if(Lcount==2)
                      {
                         %><tr ><td><%=Lcount+1%></td><td class="borderl"><%=M1Name.get(Lcount)%><br><%=M2Name.get(Lcount)%><br>(<%=RsUniv.get(Lcount)%>)</td>
				    	<td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount-1)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount-1)%></span></td><td class="borderl backslash"><span class="Fr"><%=T1Score.get(Lcount)%></span><br><br><span class="Fl"><%=T2Score.get(Lcount)%></span></td><td class="borderl"></td><td class="borderl"><%=Ranking.get(Lcount)%></td></tr>
				    	<%
                      }
                   }
                }
                %></table><%
         }      catch(Exception e){   e.printStackTrace();}
         
         int BoxCount =0;
         for(BoxCount =0 ; BoxCount < LoopCount ; BoxCount++)
         {
            if(BoxCount==0)
            {
               try
               {               
                  %><table class="EntryBox marginauto margintop20">
                  <form action="pass.jsp?Group=<%=Group%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=MatchTeamKey1.get(0)%>&TeamKey2=<%=MatchTeamKey2.get(0)%>&MatchKey=<%=MatchTeamKey.get(0)%>&placekey=<%=PlaceKey.get(0)%>&pass=0" method="post">

				<tr class="borderb tColor"><th width="40px">번</th><th class="borderl" width="150px">이름</th><th class="borderl" width="90px" colspan="2">Score</th><th class="borderl" width="70px">결과</th></tr><%
                  for(int j =0 ; j < 2 ; j++)
                  {
                     if(Group.equals(RsGroup.get(j)))
                     {
                        if(j == 0){
                        %><tr class=" borderb"><td><%=j+1 %></td><td class="borderl"><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class="borderl"><%=T1Score.get(0) %></td>
                        <td><select size = "1" name="Score1" style ="width:55px;">
                           <option name="Score1" vlaue ="0">0</option>
                           <option name="Score1" vlaue ="1">1</option>
                           <option name="Score1" vlaue ="2">2</option>
                           <option name="Score1" vlaue ="3">3</option>
                           <option name="Score1" vlaue ="4">4</option>
                           <option name="Score1" vlaue ="5">5</option>
                           <option name="Score1" vlaue ="6">6</option>
                           <option name="Score2" vlaue ="7">7</option>
                           
                           </select>
                        </td><td rowspan="2" class="borderl"><%=Result.get(0)%></td></tr><%
                        }
                        else{
                        %><tr><td><%=j+1 %></td><td class="borderl"><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class="borderl"><%=T2Score.get(0) %></td>
                        <td><select size = "1" name="Score2" style ="width:55px;">
                           <option name="Score2" vlaue ="0">0</option>
                           <option name="Score2" vlaue ="1">1</option>
                           <option name="Score2" vlaue ="2">2</option>
                           <option name="Score2" vlaue ="3">3</option>
                           <option name="Score2" vlaue ="4">4</option>
                           <option name="Score2" vlaue ="5">5</option>
                           <option name="Score2" vlaue ="6">6</option>
                           <option name="Score2" vlaue ="7">7</option>
                           
                           </select>
                        </td></tr><%
                        }
                     }
                  }

                   %><tr>
                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
                  </tr>
                  </form></table><%

               }      catch(Exception e){   e.printStackTrace();}
            }
            if(BoxCount == 1)
            {
               try
               {
               %>
                  <form action="pass.jsp?Group=<%=Group%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=MatchTeamKey1.get(1)%>&TeamKey2=<%=MatchTeamKey2.get(1)%>&MatchKey=<%=MatchTeamKey.get(1)%>&placekey=<%=PlaceKey.get(1)%>&pass=1" method="post">
               <table class="EntryBox marginauto margintop20">
               </tr>
               <tr class="tColor" ><th width="40px">번</th><th class="borderl" width="150px">이름</th><th class="borderl" width="90px" colspan="2">Score</th><th class="borderl" width="70px">결과</th></tr>	<%
                  for(int j = 0 ; j < 3 ; j++)
                  {
                     if(Group.equals(RsGroup.get(j)))
                     {
                        if(j == 0)
                        {
                           if(MatchTeamKey1.get(1).equals("WinTeam"))
                           {
                           %><tr class=" borderb"><td >-</td><td class="borderl">1VS2<br>WinTeam</td><td colspan="3" class="borderl">경기전</td><%
                           }
                           else
                           {
                        	   if(MatchTeamKey1.get(1).equals(MatchTeamKey1.get(0)))
	                        	{
	   							%><tr class=""><td><%=j+1 %></td><td class=""><%=M1Name.get(0)%><br><%=M2Name.get(0)%><br>(<%=RsUniv.get(0)%>)</td><td class=""><%=T1Score.get(1)%></td>
    							<td><select size = "1" name="Score1" style ="width:55px;">
                                  <option name="Score1" vlaue ="0">0</option>
                                  <option name="Score1" vlaue ="1">1</option>
                                  <option name="Score1" vlaue ="2">2</option>
                                  <option name="Score1" vlaue ="3">3</option>
                                  <option name="Score1" vlaue ="4">4</option>
                                  <option name="Score1" vlaue ="5">5</option>
                                  <option name="Score1" vlaue ="6">6</option>
                      			  <option name="Score2" vlaue ="7">7</option>
                                  
                              	 </select></td>
	   							<td rowspan="2" class=""><%=Result.get(1)%></td></tr><%
	   							}
                        	   else
                               {
    								%><tr class=""><td><%=j+2 %></td><td class=""><%=M1Name.get(1)%><br><%=M2Name.get(1)%><br>(<%=RsUniv.get(1)%>)</td><td class=""><%=T1Score.get(1)%></td>
    							<td><select size = "1" name="Score1" style ="width:55px;">
                                  <option name="Score1" vlaue ="0">0</option>
                                  <option name="Score1" vlaue ="1">1</option>
                                  <option name="Score1" vlaue ="2">2</option>
                                  <option name="Score1" vlaue ="3">3</option>
                                  <option name="Score1" vlaue ="4">4</option>
                                  <option name="Score1" vlaue ="5">5</option>
                                  <option name="Score1" vlaue ="6">6</option>
			                        <option name="Score2" vlaue ="7">7</option>
                                  
                              	 </select></td>
                               <td rowspan="2" class="borderl"><%=Result.get(1)%></td></tr><%
                               }
                           }
                        }
                        else if(j==1)
                        {
                        }
                        else
                        {
                        %><tr><td><%=j+1 %></td><td class="borderl"><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class="borderl"><%=T2Score.get(1) %></td>
                        <td><select size = "1" name="Score2" style ="width:55px;">
                        <option name="Score2" vlaue ="0">0</option>
                        <option name="Score2" vlaue ="1">1</option>
                        <option name="Score2" vlaue ="2">2</option>
                        <option name="Score2" vlaue ="3">3</option>
                        <option name="Score2" vlaue ="4">4</option>
                        <option name="Score2" vlaue ="5">5</option>
                        <option name="Score2" vlaue ="6">6</option>
                        <option name="Score2" vlaue ="7">7</option>
                        
                        </select></td></tr><%
                        }
                     }
                  }

                   %><tr>
                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
                  </tr>
                  </form></table><%
                  
               }      catch(Exception e){   e.printStackTrace();}
            }
            if(BoxCount==2)
            {
                  try
                  {
                  %>
                  <form action="pass.jsp?Group=<%=Group%>&Jo_Number=<%=Jo_Number%>&TeamKey1=<%=MatchTeamKey1.get(2)%>&TeamKey2=<%=MatchTeamKey2.get(2)%>&MatchKey=<%=MatchTeamKey.get(2)%>&placekey=<%=PlaceKey.get(2)%>&pass=2" method="post">
                  <table class="EntryBox marginauto margintop20">
                  
               	<tr class="tColor" ><th width="40px">번</th><th class="borderl" width="150px">이름</th><th class="borderl" width="90px" colspan="2">Score</th><th class="borderl" width="70px">결과</th></tr>	<%
                  for(int j =1 ; j < 3 ; j++)
                  {
                     if(Group.equals(RsGroup.get(j)))
                     {
                        if(j == 1){
                           if(MatchTeamKey1.get(2).equals("LoseTeam"))
                           {
                           %><tr><td>-</td><td class="borderl">1VS2<br>LoseTeam</td><td colspan="3" class="borderl">경기전</td><%
                           }
                           else
                           {
								if(MatchTeamKey1.get(2).equals(MatchTeamKey1.get(0)))
								{
									%><tr class=""><td><%=j%></td><td class=""><%=M1Name.get(0)%><br><%=M2Name.get(0)%><br>(<%=RsUniv.get(0)%>)</td><td class=""><%=T1Score.get(2)%></td>
    							<td><select size = "1" name="Score1" style ="width:55px;">
                                  <option name="Score1" vlaue ="0">0</option>
                                  <option name="Score1" vlaue ="1">1</option>
                                  <option name="Score1" vlaue ="2">2</option>
                                  <option name="Score1" vlaue ="3">3</option>
                                  <option name="Score1" vlaue ="4">4</option>
                                  <option name="Score1" vlaue ="5">5</option>
                                  <option name="Score1" vlaue ="6">6</option>
                      			  <option name="Score2" vlaue ="7">7</option>
                                  
                              	 </select></td>									
									<td rowspan="2" class=""><%=Result.get(2)%></td></tr><%
								}
								else
								{
									%><tr class=""><td><%=j+1 %></td><td class=""><%=M1Name.get(1)%><br><%=M2Name.get(1)%><br>(<%=RsUniv.get(1)%>)</td><td class=""><%=T1Score.get(2)%></td>
    							<td><select size = "1" name="Score1" style ="width:55px;">
                                  <option name="Score1" vlaue ="0">0</option>
                                  <option name="Score1" vlaue ="1">1</option>
                                  <option name="Score1" vlaue ="2">2</option>
                                  <option name="Score1" vlaue ="3">3</option>
                                  <option name="Score1" vlaue ="4">4</option>
                                  <option name="Score1" vlaue ="5">5</option>
                                  <option name="Score1" vlaue ="6">6</option>
                                  <option name="Score1" vlaue ="7">7</option>
                                  
                              	 </select></td>
									<td rowspan="2" class=""><%=Result.get(2)%></td></tr><%
								}
                           }
                        }
                        else{
                        %><tr><td><%=j+1%></td><td class="borderl"><%=M1Name.get(j)%><br><%=M2Name.get(j)%><br>(<%=RsUniv.get(j)%>)</td><td class="borderl"><%=T2Score.get(2)%></td>
                        <td><select size = "1" name="Score2" style ="width:55px;">
                              <option name="Score2" vlaue ="0">0</option>
                              <option name="Score2" vlaue ="1">1</option>
                              <option name="Score2" vlaue ="2">2</option>
                              <option name="Score2" vlaue ="3">3</option>
                              <option name="Score2" vlaue ="4">4</option>
                              <option name="Score2" vlaue ="5">5</option>
                              <option name="Score2" vlaue ="6">6</option>
                              <option name="Score2" vlaue ="7">7</option>
                              
                           </select>
                           </td></tr><%
                        }
                     }
                  }
                  
                   %><tr>
                  <td colspan="5"><input type="submit" style="width:300px;" value="Submit"></td>
                  </tr>
                  </form></table><%
                  
                  conn.close();
                  }      catch(Exception e){   e.printStackTrace();}
            }
         }
         
            


      %>
		<hr>
			<div id="leaguefooter">
			<table class="iconbox marginauto">
			<tr>
			<td><a href="admin_league.jsp?GroupName=<%=Group%>"><img src="./img/goback.png" class="imgSize"></a></td>
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