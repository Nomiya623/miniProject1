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
    <% String userId = request.getParameter("userId"); %>
    <h1><%= userId %> 님 + 환영합니다.</h1>
    <p>아무거나 적으시요</p>
    <a href="main.jsp">메인 페이지로 돌아가기</a>
</body>
</html>
