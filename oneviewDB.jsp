<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/DB2/oneviewError.jsp" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException, java.sql.Statement, java.sql.ResultSet, javax.sql.*, java.net.*, java.io.*" %>

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
	
	String ckey = request.getParameter("key");
	
	ResultSet rset = stmt.executeQuery("select * from examtable01 where name = '" + ckey + "';");
%>

<h1><span class="blue">[</span><%=ckey%><span class="blue">]</span><span class="yellow">조회</span></h1>
<h2>Created by <a href="https://github.com/jyuna622/RecordTable.git" target="_blank">Yuna Ji</a></h2>

<table align=center class=container cellspacing=1 width=600 border=0>
	<tr>
		<th width=50><p align=center>이름</p></th>
		<th width=50><p align=center>학번</p></th>
		<th width=50><p align=center>국어</p></th>
		<th width=50><p align=center>영어</p></th>
		<th width=50><p align=center>수학</p></th>
	</tr>
<%
	while (rset.next()) { 
		out.println("<tr>");
		out.println("<td width=50><p align=center>" + rset.getString(1) + "</p></td>");
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

<button
style= "background-color:#2C3446; 
		color: white; 
		border: none; 
		border-radius: 8px; 
		padding: 10px 24px;"
id="list_btn"  onClick="location.href='exp1.jsp'"> 목록으로 </button>
</body>
</html>