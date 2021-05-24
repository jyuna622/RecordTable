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

	<SCRIPT LANGUAGE="JavaScript">
		function submitForm(mode){
			if (mode == "update"){
				myform.action = "updateDB.jsp";
				myform.submit();
			} else if (mode == "delete"){
				myform.action =="deleteDB.jsp";
				myform.submit();
			}
		}
	</SCRIPT>
</head>

<body>
	<% 
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.75:3306/kopo39", "root", "kopo39");
		Statement stmt = conn.createStatement();
		
		String name="", studentid="", kor="", eng="", mat="";
		
		String ctmp = request.getParameter("searchid");
		if (ctmp.length()== 0) ctmp="0";
		ResultSet rset = stmt.executeQuery("select * from examtable01 where studentid = " + ctmp);
		
		name="해당학번없음";
		while (rset.next()){
			name=rset.getString(1);
			studentid=Integer.toString(rset.getInt(2));
			kor=Integer.toString(rset.getInt(3));
			eng=Integer.toString(rset.getInt(4));
			mat=Integer.toString(rset.getInt(5));
		}
		
		rset.close(); 
		stmt.close();
		conn.close(); 
	%>

	<h1><span class="yellow">성적 조회후 정정 / 삭제</span></h1>
		<form method='post' action='showREC.jsp'>
			<table align=center class=container cellspacing=1 width=400 border=0>
				<tr>
					<td width=100><p align=center>조회할 학번</p></td>
					<td width=200><p align=center><input type='text' name='searchid' value=''></p></td>
					<td width=100><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>
			
		<form method='post' name='myform'>
			<table align=center cellspacing=1 width=400 border=1>
				<tr>
					<td width=100><p align=center>이름</p></td>
					<td width=300><p align=center><input type='text' name='name' value='<%=name%>'></p></td>
				</tr>
					<td width=100><p align=center>학번</p></td>
					<td width=300><p align=center><input type='text' name='name' value='<%=studentid%>'></p></td>
				</tr>
					<td width=100><p align=center>국어</p></td>
					<td width=300><p align=center><input type='text' name='korean' value='<%=kor%>'></p></td>
				</tr>
					<td width=100><p align=center>영어</p></td>
					<td width=300><p align=center><input type='text' name='english' value='<%=eng%>'></p></td>
				</tr>
					<td width=100><p align=center>수학</p></td>
					<td width=300><p align=center><input type='text' name='mathematics' value='<%=mat%>'></p></td>
				</tr>
			</table>
			
	<%
		if(studentid.length() != 0) {
			out.println("<table align=center cellspacing=1 width=400 border=0>");
			out.println("<tr>");
			out.println("<td width=200></td>");
			out.println("<td width=100><p align=center><input type=button value=\"수정\" onClick=\"submitForm('update')\"</p></td>");
			out.println("<td width=100><p align=center><input type=button value=\"삭제\" onClick=\"submitForm('delete')\"</p></td>");
			out.println("</tr>");
			out.println("</table>");
		}
	%>
		</form>


</body>
</html>