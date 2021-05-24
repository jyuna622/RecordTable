<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="Author" content="https://github.com/pablorgarcia" />
    <meta name="description" content="Table Responsive" />
    <meta name="keywords" content="table, responsive" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link href="table-responsive.css" media="screen" type="text/css" rel="stylesheet" />
</head>

<body>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
	Statement stmt = conn.createStatement();
	
	int NewStdId=0;
	
	ResultSet rset = stmt.executeQuery("select max(studentid) from examtable01;");	
	while (rset.next()) {
		NewStdId=rset.getInt(1) + 1;
	}
	
	String cTmp = request.getParameter("name");
	String cTmpHan = new String (cTmp.getBytes("8859_1"),"utf-8");
	
	stmt.execute(	"insert into examtable01 (name, studentid, kor, eng, mat) values ('"+
					cTmpHan + "'," +
					Integer.toString(NewStdId) + "," +
					request.getParameter("korean") + "," +
					request.getParameter("english")  + "," +
					request.getParameter("mathematics")  + ");" );
					
	stmt.close();
	conn.close();		
%>


<h1><span class="yellow"></span>성적입력추가 완료</span></h1>

	<form method='post' action='inputForm1.html'>
	
	<table cellspacing=1 width=400 border=0>
		<tr>
			<td width=300></td>
			<td width=100><input type="submit" value="뒤로가기"></td>
		</tr>
		</table>
		
	<table cellspacing=1 width=400 border=1>
		<tr> 
			<td width=100><p align=center>이름</p></td>
			<td width=100><p align=center>
				<input type='text' name='name' value='<%=cTmpHan%>' readonly></p>
			</td>
		</tr>
			<td width=100><p align=center>학번</p></td>
			<td width=100><p align=center>
				<input type='text' name='studentid' value='<%=Integer.toString(NewStdId)%>' readonly></p>
			</td>
		</tr>
			<td width=100><p align=center>국어</p></td>
			<td width=100><p align=center>
				<input type='text' name='korean' value='<%=request.getParameter("korean")%>' readonly></p>
			</td>
		</tr>
			<td width=100><p align=center>영어</p></td>
			<td width=100><p align=center>
				<input type='text' name='english' value='<%=request.getParameter("english")%>' readonly></p>
			</td>
		</tr>
			<td width=100><p align=center>수학</p></td>
			<td width=100><p align=center>
				<input type='text' name='mathematics' value='<%=request.getParameter("mathematics")%>' readonly></p>
			</td>
		</tr>
		</table>
	</form>
</body> 
</html>
