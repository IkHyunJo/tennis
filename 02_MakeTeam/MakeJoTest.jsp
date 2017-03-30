<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.DriverManager"  %>
<%@ page import="java.sql.Connection"  %>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet"  %>
<%@ page import="java.sql.SQLException"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ���</title>
</head>
<body>

<%
	String DB_URL = "jdbc:mysql://localhost:3306/database";
	String DB_USER = "root";
	String DB_PASSWORD= "knuvrlab";

	request.setCharacterEncoding("euc-kr");

	//�������������� �޾ƿ� ����
	String jo = request.getParameter("jo");
	String m1 = request.getParameter("m1");
	String m2 = request.getParameter("m2");
	String group = request.getParameter("group");
	
	//���1�� ����
	String M_number1 = "";
	String Name1 = "";
	String Phone1 = "";
	String Univ1 = "";
	String Group1 = "";
	String IT_Number1 = "";
	
	//���2�� ����
	String M_number2 = "";
	String Name2 = "";
	String Phone2 = "";
	String Univ2 = "";
	String Group2 = "";
	String IT_Number2 = "";
	
	//���� ����
	String Jo_Number = "";
	String JoName = "";
	String GroupName = "";
	
	PreparedStatement ps = null;
	Connection conn =null;
	ResultSet rs = null;
	PreparedStatement ps2 = null;
	Connection conn2 =null;
	ResultSet rs2 = null;
	boolean ok=false;
	String name=null;

	try {
		//���1�� ������ �޾ƿ�
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select* from member where Name=?");
			ps.setString(1, m1);
		rs = ps.executeQuery();
		rs.last(); int cnt = rs.getRow(); rs.first();
			if(cnt == 0){//DB�� ���� �̸� �Է��� ���
				%>
				<script type="text/javascript">
				alert("��� ������ �ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
				</script>
				<%
			}
		
		//���2�� ������ �޾ƿ�
		conn2 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps2 = conn.prepareStatement("select* from member where Name=?");
			ps2.setString(1, m2);
		rs2 = ps2.executeQuery();
		rs2.last(); int cnt2 = rs2.getRow(); rs2.first();
			if(cnt2 == 0){//DB�� ���� �̸� �Է��� ���
				%>
				<script type="text/javascript">
				alert("��� ������ �ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
				</script>
				<%
			}
		
		//�� ����� ���� ������ ��
		while(cnt>0){
			M_number1 = rs.getString(1);
			Name1 = rs.getString(2);
			Phone1 = rs.getString(3);
			Univ1 = rs.getString(4);
			Group1 = rs.getString(5);
			IT_Number1 = rs.getString(6);

			//�ι�°���
			while(cnt2>0){
				M_number2 = rs2.getString(1);
				Name2 = rs2.getString(2);
				Phone2 = rs2.getString(3);
				Univ2 = rs2.getString(4);
				Group2 = rs2.getString(5);
				IT_Number2 = rs2.getString(6);
				rs2.next();
				cnt2--;
				if(IT_Number1.equals(IT_Number2)){
					ok=true;
					break;
				}
			}
			rs.next();
			cnt--;
			if(IT_Number1.equals(IT_Number2)){
				break;
			}
		}	
		
		//MakeJoForm ���� ���� �� �̸��� ���� �ش� ���� �˻�.
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		ps = conn.prepareStatement("select* from indiv_jo where JoName=?");
		ps.setString(1, jo);
		rs = ps.executeQuery();
		while(rs.next()){
			Jo_Number = rs.getString(1);
			JoName = rs.getString(2);
			GroupName = rs.getString(3);
			System.out.println(Jo_Number + "\t" + JoName + "\t" + GroupName +"\t");
			if(GroupName.equals(group)){
				ok = true;
				break;
			}else{
				ok = false;
			}
			%><br><%
		}
		
		if(Group1.equals(group)){
			ok=true;
		}else{
			ok=false;
			%>
			<script type="text/javascript">
			alert("�Է��Ͻ� ���� �ش� �׷��� �ƴմϴ�.");
			</script>
			<%
		}
		
		//indiv_team�� �� ���� �Է�
		if(ok){
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			ps = conn.prepareStatement("update indiv_team set Jo_Number=? where IT_Number=?");
				ps.setString(1, JoName);
				ps.setString(2, IT_Number1);
			ps.executeUpdate();
			
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
			document.comeback.action="MakeJoForm.jsp?GroupName=<%=group%>"; // OrderNum �� ���� ������
			document.comeback.submit();
			</script>
			<%
			
		}else{
			%>
			<script type="text/javascript">
			alert("��� ������ �ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
			</script>
			<%
			
			%>
			<form type = "hidden" method="post" name="comeback"></form>
			<script type="text/javascript">
			document.comeback.action="MakeJoForm.jsp?GroupName=<%=group%>"; // OrderNum �� ���� ������
			document.comeback.submit();
			</script>
			<%
		}

		
	}catch(Exception e){
		e.printStackTrace();
		%>
		<script type="text/javascript">
		alert("��� ������ �ٽ� Ȯ���Ͽ� �ֽʽÿ�.");
		</script>
		<%
	}
	
	finally{
		if(ps != null) try{ps.close();} catch(SQLException ex) {}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
	
%>

<form method="post" action = "MakeJoForm.jsp?GroupName=<%=group%>">
<td align="center"><input type = "submit" value="���ư���"></td>
</form>

</body>
</html>