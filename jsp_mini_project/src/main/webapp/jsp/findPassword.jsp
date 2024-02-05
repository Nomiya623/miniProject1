<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find Password</title>
</head>
<body>
    <h2>비밀번호 찾기</h2>
    <form action="resetPassword.jsp" method="post">
        <div>
            <label for="userid">사용자 ID (또는)</label>
            <input type="text" id="userid" name="userid" placeholder="사용자 ID">
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" placeholder="이메일 주소">
        </div>
        <div>
            <input type="submit" value="비밀번호 찾기">
        </div>
    </form>
</body>
</html>
