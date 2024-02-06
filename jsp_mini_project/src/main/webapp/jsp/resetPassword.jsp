<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password Retrieval</title>
<style>
:root {
	--main-color: #6B8E23; /* Olive Green */
	--body-bg: #FAF9F6; /* Off White */
	--second-bg: #FFF; /* White */
	--card-bg: #EFEDEA; /* A softer, lighter shade for card backgrounds */
	--text-color: #3C3C3B; /* Almost Black */
	--text-white: #ffffff; /* White */
	--text-gray: #A9A9A9; /* Gray */
	--main-hover: #556B2F; /* Dark Olive Green */
	--border-color: #DDD; /* Light border for subtle definition */
}

body {
	background-color: var(--body-bg);
	color: var(--text-color);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	line-height: 1.6;
	padding: 20px;
}

h2 {
	color: var(--main-color);
}

p {
	background-color: var(--card-bg);
	padding: 15px;
	border-radius: 5px;
	border: 1px solid var(--border-color);
	margin-top: 20px;
}
</style>
</head>
<body>
	<h2>비밀번호 찾기(테스트용)</h2>
	<%
	String userid = request.getParameter("userid");
	String email = request.getParameter("email");
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT PASSWORD FROM ALLY_USERS WHERE USERID = ? OR EMAIL = ?";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, email);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			String password = rs.getString("PASSWORD");
			out.println("<div class='password-display'>귀하의 비밀번호 (데모 목적으로만): " + password + "</div>");
		} else {
			out.println("<p>사용자를 찾을 수 없습니다. 입력 내용을 확인하고 다시 시도해주세요.</p>");
		}

	} catch (SQLException e) {
		out.println("SQL Error: " + e.getMessage());
	} finally {
		if (rs != null)
			try {
		rs.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		if (conn != null)
			try {
		conn.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
	}
	%>
</body>
</html>
