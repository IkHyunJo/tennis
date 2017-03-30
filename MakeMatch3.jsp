<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="java.util.ArrayList"  %>
    
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
	String placekey = request.getParameter("placekey");
	String GroupName = request.getParameter("GroupName");
	
	String group ="";
	String result = "";
	String entrykey = "";
	String tm1key ="";
	String tm2key ="";
	
	boolean bon = false;
	
	ArrayList<String> Jo = new ArrayList<String>();
	ArrayList<String> mJo = new ArrayList<String>();
	ArrayList<String> Match = new ArrayList<String>();
	ArrayList<String> Woo = new ArrayList<String>();
	ArrayList<String> Result = new ArrayList<String>();
	ArrayList<String> Group = new ArrayList<String>();
	
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
	
	try {
		//해당 그룹의 조 크기 구하기.
		int Jocnt = 0;
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select * from gaeinjo where Place1=? or Place2=? or Place3=? or Place4=? or Place5=?");
			ps.setString(1,placekey);
			ps.setString(2,placekey);
			ps.setString(3,placekey);
			ps.setString(4,placekey);
			ps.setString(5,placekey);
		rs = ps.executeQuery();
		while(rs.next()){//해당 경기장에서 경기를 가질 수 있는 조를 모드 가져옴.
			Jo.add(rs.getString(2));
			Jocnt++;
		}//
		
		int Matcnt = 0;
		for (int i =0; i < Jocnt; i++){//해당 경기장에서 경기가 가능한 모든 매치를 수집.
			//out.println(Jo.get(i));
			ps2 = conn.prepareStatement("select * from gaeinmatch where Jo=?");
				ps2.setString(1, Jo.get(i));
			rs2 = ps2.executeQuery();
			while(rs2.next()){
				Match.add(rs2.getString(1));
				Result.add(rs2.getString(6));
				mJo.add(rs2.getString(9));
				Woo.add(rs2.getString(10));
				Group.add(rs2.getString(8));
				Matcnt++;
			}
		}
		
		breakOut:
		for(int cnt=1; cnt<4; cnt++){
			for (int j=0; j < Matcnt; j++){
				
				
				if(Woo.get(j).equals(String.valueOf(cnt))){
					if(!(Result.get(j).equals("경기전"))){
						if(GroupName.equals(Group.get(j))){
							out.println("팀키 : " + Match.get(j) +",");
							out.println(" 조 : " + mJo.get(j)+",");
							out.println(" 우선순위 : " + Woo.get(j)+",");
							out.println(" 결과 : " + Result.get(j));%><br><%
							bon = true;
						}	
					}else{
						if(GroupName.equals(Group.get(j))){
							out.println("다음경기발견 " + Match.get(j));
							ps3 = conn.prepareStatement("update gaeinmatch set placekey=? where Matckey=?");
							ps3.setString(1, placekey);
							ps3.setString(2, Match.get(j));
							ps3.executeUpdate();
							
							ps4 = conn.prepareStatement("update gaeinmatch set Result=? where Matckey=?");
							ps4.setString(1, "경기중");
							ps4.setString(2, Match.get(j));
							ps4.executeUpdate();
							
							ps = conn.prepareStatement("update place set onplaying=? where placekey=?");
							ps.setString(1, "onplaying");
							ps.setString(2, placekey);
							ps.executeUpdate();
							
							bon = false;

							break breakOut;
						}else{
							bon = true;
							out.println("다른 그룹의 경기");%><br><%
						}
						
					}			
				}
			}%><br><%
		}
		
		if(bon == true){
			//out.println("본선경기");
			ps4 = conn.prepareStatement("select * from gaeinentry");
			rs4 = ps4.executeQuery();
			breakOut:
			while(rs4.next()){
				entrykey = rs4.getString(1);
				group = rs4.getString(4);
				result = rs4.getString(9);
				tm1key = rs4.getString(5);
				tm2key = rs4.getString(7);
				if(group.equals(GroupName)){
					if(result.equals("경기전")){
						if(tm1key.length()<4){
							if(tm2key.length()<4){
								out.println(entrykey);
								ps5 = conn.prepareStatement("update gaeinentry set placekey=? where entrykey=?");
									ps5.setString(1, placekey);
									ps5.setString(2, entrykey);
								ps5.executeUpdate();
								ps5 = conn.prepareStatement("update gaeinentry set Result=? where entrykey=?");
									ps5.setString(1, "경기중");
									ps5.setString(2, entrykey);
								ps5.executeUpdate();
								ps = conn.prepareStatement("update place set onplaying=? where placekey=?");
								ps.setString(1, "onplaying");
								ps.setString(2, placekey);
								ps.executeUpdate();
								break breakOut;
							}
						}
					}
				}
			}
			
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="PlaceCheck.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>";  
				document.comeback.submit();
			</script>
			<%
			
		}else if(bon == false){
			//out.println("예선경기");
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
				document.comeback.action="admin_invidual.jsp?Jo_Number=<%=Jo_Number%>&GroupName=<%=GroupName%>&placekey=<%=placekey%>";  
				document.comeback.submit();
			</script>
			<%
		}

		conn.close();
		

		
		

		}catch(Exception e){
			e.printStackTrace();
		}
%>

</body>
</html>