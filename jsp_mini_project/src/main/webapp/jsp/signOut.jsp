<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign out message</title>
</head>
<body>
	<%
	request.getSession(false); 
    if(session != null) {
        session.invalidate(); 
    }
    response.sendRedirect("main.jsp");
	%>
</body>
</html>