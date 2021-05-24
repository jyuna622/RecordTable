<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/DB2/createError.jsp" %>
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

<h1><span class="blue">테이블만들기</span><span class="yellow">OK</span></h1>
<h2>Created by <a href="https://github.com/jyuna622/RecordTable.git" target="_blank">Yuna Ji</a></h2>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
	
	Statement stmt = conn.createStatement();
	stmt.execute("create table examtable01("+ 
				"name varchar(20),"+
				"studentid int not null primary key,"+
				"kor	int,"+
				"eng	int,"+
				"mat	int)"+
				"DEFAULT CHARSET=utf8;");
	stmt.close();
	conn.close();
%>
</body>
</html>