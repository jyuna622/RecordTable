<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
<head>
	<meta name="Author" content="https://github.com/pablorgarcia" />
    <meta name="description" content="Table Responsive" />
    <meta name="keywords" content="table, responsive" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link href="table-responsive.css" media="screen" type="text/css" rel="stylesheet" />
</head>

<h1><span class="yellow"></span>레코드 삭제</span></h1>

<body>
	<% 
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
		Statement stmt = conn.createStatement();
		
		String cTmp = request.getParameter("name");
		String cTmpHan = new String (cTmp.getBytes("8859_1"),"utf-8");
		
		String sql = "delete from examtable01 where studentid = " + ctmp;
		stmt.executeUpdate(sql);
		
		ResultSet rset = stmt.executeQuery("select * from examtable01");
		
	%>

	
	<table align=center cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>		
		</tr>
	
	<% 
		while (rset.next()){
			out.println("<tr>");
			out.println("<td width=50><p align=center><a href='oneview.jsp?key=" +
						 rset.getString(1) + "'> " + rset.getString(1) + "</a></p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
			out.println("</tr>");
		}
		rset.close();
		stmt.close();
		conn.close();
	%>
	
	</table>
</body>
</html>