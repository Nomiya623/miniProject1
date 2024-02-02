<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign out message</title>
</head>
<body>
	<%
	HttpSession s = request.getSession(false); // Get the current session
	if (session != null) {
		session.invalidate(); // Invalidate the current session
	}
	response.sendRedirect("main.jsp"); // Redirect back to the main page or sign-in page
	%>
</body>
</html>