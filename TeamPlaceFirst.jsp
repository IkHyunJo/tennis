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
	int placecnt = 10; //경기장 수를 설정해 주기.
	while(placecnt<1 + 28){
		request.setCharacterEncoding("UTF-8");

		String DB_URL = "jdbc:mysql://localhost:3306/db";
		String DB_USER = "root";
		String DB_PASSWORD= "knuvrlab";
		
		//String Jo_Number = "1"; //request.getParameter("Jo_Number");
		String Placekey = String.valueOf(placecnt);
		String GroupName = "단체전A";
		
		ArrayList<String> Jo = new ArrayList<String>();
		ArrayList<String> mJo = new ArrayList<String>();
		ArrayList<String> Match = new ArrayList<String>();
		ArrayList<String> Woo = new ArrayList<String>();
		ArrayList<String> Result = new ArrayList<String>();
		ArrayList<String> Group = new ArrayList<String>();
		ArrayList<String> p1 = new ArrayList<String>();
		ArrayList<String> p2 = new ArrayList<String>();
		ArrayList<String> p3 = new ArrayList<String>();
		
		Connection conn;
		PreparedStatement ps = null;
		ResultSet rs = null;

		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement ps3 = null;
		ResultSet rs3 = null;
		
		PreparedStatement ps4 = null;
		ResultSet rs4 = null;
		
		try {
			//해당 그룹의 조 크기 구하기.
			int Jocnt = 0;
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			ps = conn.prepareStatement("select * from teamjo where Place1=? or Place2=? or Place3=? or Place4=? or Place5=?");
				ps.setString(1,Placekey);
				ps.setString(2,Placekey);
				ps.setString(3,Placekey);
				ps.setString(4,Placekey);
				ps.setString(5,Placekey);
			rs = ps.executeQuery();
			while(rs.next()){//해당 경기장에서 경기를 가질 수 있는 조를 모드 가져옴.
				Jo.add(rs.getString(2));
				Jocnt++;
			}//
			
			int Matcnt = 0;
			for (int i =0; i < Jocnt; i++){//해당 경기장에서 경기가 가능한 모든 매치를 수집.
				//out.println(Jo.get(i));
				ps2 = conn.prepareStatement("select * from teammatch where Jo=?");
					ps2.setString(1, Jo.get(i));
				rs2 = ps2.executeQuery();
				while(rs2.next()){
					Match.add(rs2.getString(1));
					Result.add(rs2.getString(6));
					mJo.add(rs2.getString(8));
					Woo.add(rs2.getString(9));
					Group.add(rs2.getString(7));
					p1.add(rs2.getString(16));
					p2.add(rs2.getString(17));
					p3.add(rs2.getString(18));
					Matcnt++;
				}
			}
			
			breakOut:
			for(int cnt=1; cnt<4; cnt++){
				for (int j=0; j < Matcnt; j++){
					if(Woo.get(j).equals(String.valueOf(cnt))){
						if(!(Result.get(j).equals("경기전"))){
							out.println("팀키 : " + Match.get(j) +",");
							out.println(" 조 : " + mJo.get(j)+",");
							out.println(" 우선순위 : " + Woo.get(j)+",");
							out.println(" 결과 : " + Result.get(j));%><br><%
						}else{
							if(GroupName.equals(Group.get(j))){
								if(p1.get(j).equals("배정전")){
									out.println("다음경기발견 " + Match.get(j));
									ps3 = conn.prepareStatement("update teammatch set Place1=? where Matckey=?");
									ps3.setString(1, Placekey);
									ps3.setString(2, Match.get(j));
									ps3.executeUpdate();
									
									break breakOut;
								}else{
									if(p2.get(j).equals("배정전")){
										out.println("다음경기발견 " + Match.get(j));
										ps3 = conn.prepareStatement("update teammatch set Place2=? where Matckey=?");
										ps3.setString(1, Placekey);
										ps3.setString(2, Match.get(j));
										ps3.executeUpdate();
										
										break breakOut;
									}else{
										if(p3.get(j).equals("배정전")){
											out.println("다음경기발견 " + Match.get(j));
											ps3 = conn.prepareStatement("update teammatch set Place3=? where Matckey=?");
											ps3.setString(1, Placekey);
											ps3.setString(2, Match.get(j));
											ps3.executeUpdate();
											
											ps4 = conn.prepareStatement("update teammatch set Result=? where Matckey=?");
											ps4.setString(1, "경기중");
											ps4.setString(2, Match.get(j));
											ps4.executeUpdate();
											
											break breakOut;
										}
									}
								}

								
							}else{
								out.println("다른 그룹의 경기");%><br><%
							}
							
						}			
					}
				}%><br><%
			}

			placecnt++;
			

			}catch(Exception e){
				e.printStackTrace();
			}
	}

	
%>

</body>
</html>