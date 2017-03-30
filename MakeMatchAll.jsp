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
	
	String Group ="";

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
		int gg = 1;
		while(gg<19){
			if(gg==1){
				Group = "청년부A";
			}else if(gg==2){
				Group = "청년부B1";
			}else if(gg==3){
				Group = "청년부B2";
			}else if(gg==4){
				Group = "청년부B3";
			}else if(gg==5){
				Group = "청년부B4";
			}else if(gg==6){
				Group = "일반부A1";
			}else if(gg==7){
				Group = "일반부A2";
			}else if(gg==8){
				Group = "일반부B1";
			}else if(gg==9){
				Group = "일반부B2";
			}else if(gg==10){
				Group = "일반부B3";
			}else if(gg==11){
				Group = "일반부B4";
			}else if(gg==12){
				Group = "장년부A1";
			}else if(gg==13){
				Group = "장년부A2";
			}else if(gg==14){
				Group = "장년부B1";
			}else if(gg==15){
				Group = "장년부B2";
			}else if(gg==16){
				Group = "노년부A";
			}else if(gg==17){
				Group = "노년부B1";
			}else if(gg==18){
				Group = "노년부B2";
			}
			//해당 그룹의 조 크기 구하기.
			int Jocnt = 0;
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			ps = conn.prepareStatement("select * from gaeinjo");
			rs = ps.executeQuery();
			while(rs.next()){
				String a = rs.getString(1);
				if(a.equals(Group)){
					Jocnt++;
				}
			}
			out.println(Group + " 에는 " + Jocnt + "개의 조가 있다."); %><br><%
			
			
			//1조부터 마지막 조까지 반복.
			int JoNumber = 1;
			while(JoNumber<Jocnt+1){

				//해당 조의 팀 크기 구하기.
				ps2 = conn.prepareStatement("select * from gaeinteam where Jo=?");
					ps2.setString(1, String.valueOf(JoNumber));
				rs2 = ps2.executeQuery();
				int Teamcnt = 0;
				while(rs2.next()){
					String a = rs2.getString(7);
					if(a.equals(Group)){
						Teamcnt++;
					}
				}
				if(Teamcnt==2){
					//조에 팀이 2개일때 경기생성
					//out.println(JoNumber+"조에는 " + "2개의 팀이 있다.");
					ps3 = conn.prepareStatement("select * from gaeinteam where Jo=?");
					ps3.setString(1, String.valueOf(JoNumber));
					rs3 = ps3.executeQuery();
					rs3.last(); int teamnum = rs3.getRow(); rs3.first();
					
					String teamkey1 = "";
					String teamkey2 = "";
					String teamkey3 = "";
					
					int cnt = 0;
					int cnt2 = 0;
					while(cnt<teamnum){//각 팀에서 팀의 랭킹과 팀키를 받아온다. cnt2에는 조에 속한 팀의 수가 저장된다.
						cnt++;
						String g = rs3.getString(7);
						if(g.equals(Group)){
							cnt2++;
							if(cnt2==1){
								teamkey1 = rs3.getString(1);
							}else if(cnt2==2){
								teamkey2 = rs3.getString(1);
							}
						}
						rs3.next();
					}
					ps3 = conn.prepareStatement("insert into gaeinmatch VALUES(?,?,?,?,?,?,?,?,?,?)");
					ps3.setString(1, null);
					ps3.setString(2, teamkey1);
					ps3.setString(3, "-");
					ps3.setString(4, teamkey2);
					ps3.setString(5, "-");
					ps3.setString(6, "경기전");
					ps3.setString(7, null);
					ps3.setString(8, Group);
					ps3.setString(9, String.valueOf(JoNumber));
					ps3.setString(10, "1");
					ps3.executeUpdate();
					
				}else if(Teamcnt==3){
					//조에 팀이 3개일때 경기생성
					//out.println(JoNumber+"조에는 " + "2개의 팀이 있다.");
					ps3 = conn.prepareStatement("select * from gaeinteam where Jo=?");
					ps3.setString(1, String.valueOf(JoNumber));
					rs3 = ps3.executeQuery();
					rs3.last(); int teamnum = rs3.getRow(); rs3.first();
					
					String teamkey1 = "";
					String teamkey2 = "";
					String teamkey3 = "";
					
					int cnt = 0;
					int cnt2 = 0;
					while(cnt<teamnum){//각 팀에서 팀의 랭킹과 팀키를 받아온다. cnt2에는 조에 속한 팀의 수가 저장된다.
						cnt++;
						String g = rs3.getString(7);
						if(g.equals(Group)){
							cnt2++;
							if(cnt2==1){
								teamkey1 = rs3.getString(1);
							}else if(cnt2==2){
								teamkey2 = rs3.getString(1);
							}else if(cnt2==3){
								teamkey3 = rs3.getString(1);
							}
						}
						rs3.next();
					}
					
					ps3 = conn.prepareStatement("insert into gaeinmatch VALUES(?,?,?,?,?,?,?,?,?,?)");
					ps3.setString(1, null);
					ps3.setString(2, teamkey1);
					ps3.setString(3, "-");
					ps3.setString(4, teamkey2);
					ps3.setString(5, "-");
					ps3.setString(6, "경기전");
					ps3.setString(7, null);
					ps3.setString(8, Group);
					ps3.setString(9, String.valueOf(JoNumber));
					ps3.setString(10, "1");
					ps3.executeUpdate();
					
					ps3 = conn.prepareStatement("insert into gaeinmatch VALUES(?,?,?,?,?,?,?,?,?,?)");
					ps3.setString(1, null);
					ps3.setString(2, "WinTeam");
					ps3.setString(3, "-");
					ps3.setString(4, teamkey3);
					ps3.setString(5, "-");
					ps3.setString(6, "경기전");
					ps3.setString(7, null);
					ps3.setString(8, Group);
					ps3.setString(9, String.valueOf(JoNumber));
					ps3.setString(10, "2");
					ps3.executeUpdate();
					
					ps3 = conn.prepareStatement("insert into gaeinmatch VALUES(?,?,?,?,?,?,?,?,?,?)");
					ps3.setString(1, null);
					ps3.setString(2, "LoseTeam");
					ps3.setString(3, "-");
					ps3.setString(4, teamkey3);
					ps3.setString(5, "-");
					ps3.setString(6, "경기전");
					ps3.setString(7, null);
					ps3.setString(8, Group);
					ps3.setString(9, String.valueOf(JoNumber));
					ps3.setString(10, "3");
					ps3.executeUpdate();
					
				}else if(Teamcnt==4){
					//조에 팀이 4개일때 경기생성
				}

				JoNumber++;
			}
			
			gg++;
		}
				
		}catch(Exception e){
			e.printStackTrace();
		}
%>

</body>
</html>