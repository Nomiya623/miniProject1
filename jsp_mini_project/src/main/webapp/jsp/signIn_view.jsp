<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>환영합니다</title>
 <style>
 </style>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
    <%
    
    String userId = (String) session.getAttribute("userId");
    if (userId != null && !userId.isEmpty()) {
        out.println("<h1><i class='bx bx-user'></i> " + userId + "님, 환영합니다.</h1>");
    } else {
      
        response.sendRedirect("signInUp.jsp");
    }
    %>
    <p>아무거나 적음</p>
    <a href="main.jsp">메인 페이지로 돌아가기</a>
</body>
</html>