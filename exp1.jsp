<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/DB2/oneviewError.jsp" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="Author" content="https://github.com/pablorgarcia" />
    <meta name="description" content="Table Responsive" />
    <meta name="keywords" content="table, responsive" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link href="table-responsive.css" media="screen" type="text/css" rel="stylesheet" />
	
		<style>
		a:link {
		  color : #FB667A;
		  text-decoration: none;
		}
		a:visited {
		  color : #FB667A;
		  text-decoration: none;
		}
		a:hover {
		  color : black;
		  text-decoration: underline;
		}
		a:active {
		  color : black;
		  text-decoration: none;
		}
	</style>
	
	
</head>
<body>

<h1><span class="blue">&lt;</span>조회<span class="blue">&gt;</span> <span class="yellow">전체 성적표</pan></h1>
<h2>Created by <a href="https://github.com/jyuna622/RecordTable.git" target="_blank">Yuna Ji</a></h2>

<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
	Statement stmt = conn.createStatement();
	
	try {
		ResultSet rset = stmt.executeQuery("select * from examtable01;");
		if (rset.next() == true){
			out.println("<table class=container cellspacing=1 width=600 border=0>");
			out.println("<tr>");
			out.println("<th width=50><p align=center>이름</p></th>");
			out.println("<th width=50><p align=center>학번</p></th>");
			out.println("<th width=50><p align=center>국어</p></th>");
			out.println("<th width=50><p align=center>영어</p></th>");
			out.println("<th width=50><p align=center>수학</p></th>");
			out.println("</tr>");

			while (rset.next()) { 
				out.println("<tr>");
				out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key=" + 
							 rset.getString(1) + "'> " + rset.getString(1) + "</a></p></td>");
				out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
				out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
				out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
				out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
				out.println("</tr>");
			}
			out.println("</table>");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("requestError.jsp");
			rd.forward(request, response);
		}
		rset.close(); 
	} catch (Exception e) {
		RequestDispatcher rd = request.getRequestDispatcher("noTableError.jsp");
		rd.forward(request, response);
	}
	stmt.close();
	conn.close(); 
%>
</body>
</html>