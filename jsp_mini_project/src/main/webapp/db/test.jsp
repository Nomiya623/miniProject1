<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	<%
		ResultSet rs = stmt.executeQuery("SELECT * FROM SAMPLE");
		rs.next();
		out.println(rs.getString("TEST1"));
		out.println(rs.getString("TEST2"));
		out.println(rs.getString("TEST3"));
	%>
</body>
</html>