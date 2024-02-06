<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="../db/dbconn.jsp"%>
<%
String userId = request.getParameter("userId");
ResultSet user = null;
try {
	if (userId != null && !userId.trim().isEmpty()) {
		String sql = "SELECT * FROM ALLY_USERS WHERE USERID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		user = pstmt.executeQuery();
	}
} catch (SQLException e) {
	e.printStackTrace();

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
:root {
	--main-color: #6B8E23;
	--body-bg: #FAF9F6;
	--second-bg: #FFF;
	--card-bg: #EFEDEA;
	--text-color: #3C3C3B;
	--text-white: #ffffff;
	--text-gray: #A9A9A9;
	--main-hover: #556B2F;
	--border-color: #DDD;
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
	margin-bottom: 20px;
}

form {
    background: var(--card-bg);
    padding: 20px;
    border-radius: 5px;
    border: 1px solid var(--border-color);
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 50%; 
    margin: auto;
}


input[type="text"], input[type="email"], input[type="password"], input[type="number"],
	textarea {
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 4px;
	border: 1px solid var(--border-color);
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: var(--main-color);
	color: var(--text-white);
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: var(--main-hover);
}

label {
	font-weight: bold;
	color: var(--text-color);
}
</style>
</head>
<body>
	<%
	if (user != null && user.next()) {
	%>
	<h2>회원정보 수정</h2>
	<form action="userUpdate_process.jsp" method="post">
		<input type="hidden" name="userId"
			value="<%=user.getString("USERID")%>" /> <label for="email">이메일:</label>
		<input type="email" name="email"
			value="<%=user.getString("EMAIL")%>" required /><br /> <label
			for="password">비밀번호:</label> <input type="password" name="password"
			required /><br /> <label for="fullName">이름:</label> <input
			type="text" name="fullName" value="<%=user.getString("FULLNAME")%>"
			required /><br /> <label for="age">나이:</label> <input type="number"
			name="age" value="<%=user.getInt("AGE")%>" required /><br /> <label
			for="gender">성별:</label> <input type="text" name="gender"
			value="<%=user.getString("GENDER")%>" required /><br /> <label
			for="skinType">피부 타입:</label> <input type="text" name="skinType"
			value="<%=user.getString("SKINTYPE")%>" required /><br /> <input
			type="submit" value="수정하기" />
	</form>
	<%
	} else {
	%>
	<p>사용자를 찾을 수 없거나 사용자 ID가 누락되었습니다.</p>
	<%
	}	
	if (conn != null) {
	try {
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	%>
</body>
</html>