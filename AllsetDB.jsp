<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/DB2/oneviewError.jsp" %>
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

<h1><span class="blue">실습데이터 입력</span><span class="yellow">OK</span></h1>
<h2>Created by <a href="https://github.com/jyuna622/RecordTable.git" target="_blank">Yuna Ji</a></h2>

<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
		Statement stmt = conn.createStatement();
		
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('나연', 209901, 95, 100, 95);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('정연', 209902, 95, 95, 95);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('모모', 209903, 100, 100, 100);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('사나', 209904, 100, 95, 90);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('지효', 209905, 80, 100, 70);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('미나', 209906, 100, 100, 70);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('다현', 209907, 70, 70, 70);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('채영', 209908, 80, 75, 72);");
		stmt.execute("insert into examtable01 (name, studentid, kor, eng, mat) values ('쯔위', 209909, 78, 79, 82);");
		
		stmt.close();
		conn.close();
	} catch (SQLSyntaxErrorException e) {
		RequestDispatcher rd = request.getRequestDispatcher("noTableError.jsp");
		rd.forward(request, response);
	} catch (SQLIntegrityConstraintViolationException e) {
		RequestDispatcher rd = request.getRequestDispatcher("schonError.jsp");
		rd.forward(request, response);
	}
		
%>
</body>
</html>
