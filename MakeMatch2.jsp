<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String DB_URL = "jdbc:mysql://localhost:3306/db";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";
	
	String Jo_Number = request.getParameter("Jo_Number");
	String Group = request.getParameter("GroupName");
	String winteamkey = request.getParameter("winteam");
	String loseteamkey = request.getParameter("loseteam");
	String placekey = request.getParameter("placekey");
	
	String sRanking1 = "";
	String sRanking2 = "";
	int iRanking1 = 0;
	int iRanking2 = 0;

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	PreparedStatement ps2 = null;
	ResultSet rs2 = null;
	PreparedStatement ps3 = null;
	ResultSet rs3 = null;
	PreparedStatement ps4 = null;
	ResultSet rs4 = null;
	PreparedStatement ps5 = null;
	ResultSet rs5 = null;
	
	String teamkey1 = "";
	String Ranking1 = "";
	String teamkey2 = "";
	String Ranking2 = "";
	String teamkey3 = "";
	String Ranking3 = "";
	String teamkey4 = "";
	String Ranking4 = "";
	
	String Cal1 = "";
	String Cal2 = "";
	String Cal3 = "";
	
	
	try {
		//db에 연결
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				
		//------
		ps = conn.prepareStatement("select * from gaeinteam where Jo=?");
			ps.setString(1, String.valueOf(Jo_Number));
		rs = ps.executeQuery();
		rs.last(); int teamnum = rs.getRow(); rs.first();
		
		int cnt = 0;
		int cnt2 = 0;
		while(cnt<teamnum){//각 팀에서 팀의 랭킹과 팀키를 받아온다. cnt2에는 조에 속한 팀의 수가 저장된다.
			cnt++;
			String a = rs.getString(7);
			String s = rs.getString(2);
			String d = rs.getString(4);
			//out.println(a);
			if(a.equals(Group)){
				cnt2++;
				if(cnt2==1){
					teamkey1=rs.getString(1);
					Cal1 = rs.getString(10);
					//out.println("1팀의 선수는 "+s+" "+d +Cal1);%><br><%
				}else if(cnt2==2){
					teamkey2=rs.getString(1);
					Cal2 = rs.getString(10);
					//out.println("2팀의 선수는 "+s+" "+d +Cal2);%><br><%
				}else if(cnt2==3){
					teamkey3=rs.getString(1);
					Cal3 = rs.getString(10);
					//out.println("3팀의 선수는 "+s+" "+d +Cal3);%><br><%
				}//out.println("1팀의 선수는 "+s+" "+d + teamkey4+Ranking4);%><br><%
			}
			rs.next();
		}
		
		if(cnt2==2){//팀이 두개일 경우 결과출력.
			String win = Jo_Number + "조" + "1위";
			ps2 = conn.prepareStatement("update gaeinteam set Ranking=? where TeamKey=?");
				ps2.setString(1, win);
				ps2.setString(2, winteamkey);
			ps2.executeUpdate();
			
			String lose = Jo_Number + "조" + "2위";
			ps3 = conn.prepareStatement("update gaeinteam set Ranking=? where TeamKey=?");
				ps3.setString(1, lose);
				ps3.setString(2, loseteamkey);
			ps3.executeUpdate();
			
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="GaeinEntry1.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&placekey=<%=placekey%>";  
				document.comeback.submit();
			</script>
			<%
			
		}else if(cnt2==3){//팀이 세개일 경우.
			int cal1 = Integer.parseInt(Cal1);
			int cal2 = Integer.parseInt(Cal2);
			int cal3 = Integer.parseInt(Cal3);
			
			if(cal1+cal2+cal3>599){
				//out.println("랭킹업데이트");
				%>
				<form type = "hidden" method="post" name="comeback"></form>
				<script type="text/javascript">
					document.comeback.action="UpdateRanking.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&placekey=<%=placekey%>";  
					document.comeback.submit();
				</script>
				<%
			}else{
				//1조인 매치들을 가지고옴.
				ps2 = conn.prepareStatement("select * from gaeinmatch where Jo=?");
					ps2.setString(1, String.valueOf(Jo_Number));
				rs2 = ps2.executeQuery();
				rs2.last(); int matchcnt = rs2.getRow(); rs2.beforeFirst();
				int mcnt=0;
				while(mcnt<matchcnt){//찾은 조의 수만큼 반복
					rs2.next();
					out.println(mcnt);
					String getGroup = rs2.getString(8);
					if(getGroup.equals(Group)){//받아온 그룹과 조가 일치하면
						String Team1Key = rs2.getString(2);
						if(Team1Key.equals("WinTeam")){
							String Matckey = rs2.getString(1);
							ps3 = conn.prepareStatement("update gaeinmatch set Team1Key=? where Matckey=?");
								ps3.setString(1, winteamkey);
								ps3.setString(2, Matckey);
							ps3.executeUpdate();
						}else if(Team1Key.equals("LoseTeam")){
							String Matckey = rs2.getString(1);
							ps3 = conn.prepareStatement("update gaeinmatch set Team1Key=? where Matckey=?");
								ps3.setString(1, loseteamkey);
								ps3.setString(2, Matckey);
							ps3.executeUpdate();
						}
					}
					mcnt++;
				}
			}
			
		}else if(cnt2==4){//팀이 네개일 경우 매치 생성.
			
		}
		
		conn.close();
		
		%>
		<form type = "hidden" method="post" name="comeback"></form>
		<script type="text/javascript">
			document.comeback.action="MakeMatch3.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=Group%>&placekey=<%=placekey%>";  
			document.comeback.submit();
		</script>
		<%		
		
		}catch(Exception e){
			e.printStackTrace();
		}
%>


</body>
</html>