<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid black;
	padding: 5px 10px;
	border-collapse: collapse;
	text-align: center;
}

th {
	background-color: #eee;
}

.editButton {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.deleteButton {
	background-color: #f44336; /* Red */
	border: none;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.resetButton {
	background-color: #008CBA; /* Blue */
	border: none;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	<%
	out.println(session.getAttribute("userId"));
	
	String sql = "SELECT * FROM ALLY_USERS";
	ResultSet rs = stmt.executeQuery(sql);
	
	
	%>


	<table border="1">
		<tr>
			<th>사용자 ID</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>피부타입</th>
			<!-- <th>Failed Logins</th> -->
			<th>회원정보<br>수정</th>
			<th>회원정보<br>삭제</th>
		</tr>
		<%
		while (rs.next()) {
			String userId = rs.getString("USERID");
			// int failedLogins = rs.getInt("CNT");
		%>
		<tr>
			<td><%=rs.getString("USERID")%></td>
			<td><%=rs.getString("EMAIL")%></td>
			<td><%=rs.getString("PASSWORD")%></td>
			<td><%=rs.getString("FULLNAME")%></td>
			<td><%=rs.getString("AGE")%></td>
			<td><%=rs.getString("GENDER")%></td>
			<td><%=rs.getString("SKINTYPE")%></td>
			
			<td><input type="button" onclick="userUpdate('<%= rs.getString("USERID") %>')" value="수정" class="editButton"></td>
			<td><input type="button" onclick="userDelete('<%= rs.getString("USERID") %>')" value="삭제" class="deleteButton"></td>
	
			<td>
				<%-- <%
					if(rs.getInt("CNT") >= 4){
				%>
				<input type="button" onclick="userReset('<%= rs.getString("USERID") %>')" value="초기화" class="resetButton">
				<%
					}
				%> --%>
			</td>
		</tr>	
	<%
		}
	%>	
	</table>
	<%
	conn.close();
	 %>
</body>
</html>
<script>

	function userDelete(userId) {
		if (confirm('삭제 하시셌습니까?')) {
			location.href = "user_delete.jsp?userId=" + userId;
		}
	}

	function userUpdate(userId) {
		if (confirm('수정 하시겠습니까?')) {
			location.href = "user_update.jsp?userId=" + userId;
		}
	}
</script>

