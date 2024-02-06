<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Find Password</title>
<style>
:root {
	--main-color: #6B8E23; /* Olive Green */
	--body-bg: #FAF9F6; /* Off White */
	--second-bg: #FFF; /* White */
	--card-bg: #EFEDEA; /* Soft Gray */
	--text-color: #3C3C3B; /* Almost Black */
	--text-white: #ffffff; /* White */
	--text-gray: #A9A9A9; /* Gray */
	--main-hover: #556B2F; /* Dark Olive Green */
	--border-color: #DDD; /* Light Gray Border */
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
	width: 100%; /* Full width on smaller screens */
	max-width: 400px; /* Maximum width, but adjustable */
	margin: auto; /* Center the form */
}

input[type="text"], input[type="email"], input[type="submit"], textarea
	{
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 4px;
	border: 1px solid var(--border-color);
	width: calc(100% - 16px); /* Adjust width to padding */
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
	<h2>비밀번호 찾기</h2>
	<form action="resetPassword.jsp" method="post">
		<div>
			<label for="userid">사용자 ID (또는)</label> <input type="text"
				id="userid" name="userid" placeholder="사용자 ID">
		</div>
		<div>
			<label for="email">이메일:</label> <input type="email" id="email"
				name="email" placeholder="이메일 주소">
		</div>
		<div>
			<input type="submit" value="비밀번호 찾기">
		</div>
	</form>
</body>
</html>
