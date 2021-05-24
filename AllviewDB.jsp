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
	
</head>
<body>

<h1><span class="yellow">&lt;</span>조회<span class="yellow">&gt;</span></h1>


<%
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
	Statement stmt = conn.createStatement();
	
	try {
		ResultSet rset = stmt.executeQuery("select * from examtable01;");
		if (rset.next() == true){
			out.println("<table cellspacing=1 width=50% border=1>");
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