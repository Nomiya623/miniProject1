<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<style>
:root {
    --main-color: #6B8E23; /* Green */
    --body-bg: #FAF9F6; /* Light background */
    --second-bg: #DAD7CD; /* Secondary background */
    --text-color: #3C3C3B; /* Main text color */
    --text-white: #ffffff; /* White text color */
    --text-gray: #A9A9A9; /* Gray text color */
    --main-hover: #c2c2c2; /* Hover state color */
}

body {
    background-color: var(--body-bg);
    color: var(--text-color);
    font-family: 'Roboto', sans-serif;
}

table {
    border-collapse: collapse;
    width: 100%;
    background-color: var(--second-bg);
    color: var(--text-color);
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

th, td {
    border: 1px solid #ddd;
    text-align: left;
    padding: 8px;
}

th {
    background-color: var(--main-color);
    color: var(--text-white);
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: var(--main-hover);
    cursor: pointer;
}

.editButton, .deleteButton, .resetButton {
    border: none;
    color: var(--text-white);
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

.editButton {
    background-color: var(--main-color);
}

.deleteButton {
    background-color: #f44336; /* Red */
}

.resetButton {
    background-color: #008CBA; /* Blue */
}

/* Additional styles for buttons on hover */
.editButton:hover, .deleteButton:hover, .resetButton:hover {
    opacity: 0.8;
}
</style>

</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	  <% String role = null;
        if (session != null && session.getAttribute("loggedin") != null) {
            role = (String) session.getAttribute("role");
            if(!"A".equals(role)) { // If not admin, redirect
                response.sendRedirect("signInUp.jsp");
                return;
            }
        } else {
            // No session found, redirect to login
            response.sendRedirect("signInUp.jsp");
            return;
        }
    %>
	
	<%

    String status = request.getParameter("status");
    String message = request.getParameter("message");
    if("error".equals(status)) {
        out.println("<p style='color: red;'>Error: " + message + "</p>");
    } else if ("deleteSuccess".equals(status)) {
        out.println("<p style='color: green;'>User successfully deleted.</p>");
    } else if ("deleteFail".equals(status)) {
        out.println("<p style='color: red;'>Failed to delete user.</p>");
    } // You can extend this logic for other statuses like updateSuccess, resetSuccess, etc.
	
    
    if("error".equals(status)) {
        out.println("<p style='color: red;'>Error: " + message + "</p>");
    } else if ("updateSuccess".equals(status)) {
        out.println("<p style='color: green;'>User successfully updated.</p>");
    } else if ("updateFail".equals(status)) {
        out.println("<p style='color: red;'>Failed to update user.</p>");
    } 
    
    if("error".equals(status)) {
        out.println("<p style='color: red;'>Error: " + message + "</p>");
    } else if ("resetSuccess".equals(status)) {
        out.println("<p style='color: green;'>User successfully reset.</p>");
    } else if ("resetFail".equals(status)) {
        out.println("<p style='color: red;'>Failed to reset user.</p>");
    } 
    
	String sql = "SELECT * FROM ALLY_USERS";
	ResultSet rs = stmt.executeQuery(sql);
	
	
	%>
	<div class="sidebar">
        <a href="main.jsp">Home</a>
        <a href="orders.jsp">Orders</a>
        <a href="products.jsp">Products</a>
        <a href="#" onclick="signOut()">Sign Out</a>
    </div>
	
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
			<th>회원정보<br>초기화</th>
		</tr>
		<%
		while (rs.next()) {
			String userId = rs.getString("USERID");
			
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
			<td><input type="button" onclick="userReset('<%= rs.getString("USERID") %>')" value="초기화" class="resetButton"></td>
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
			location.href = "userList_delete.jsp?userId=" + userId;
		}
	}

	function userUpdate(userId) {
		if (confirm('수정 하시겠습니까?')) {
			location.href = "userList_update.jsp?userId=" + userId;
		}
	}
	function userReset(userId) {
		if (confirm('비밀번호를 초기화하시겠습니까?')) {
			location.href = "userList_reset.jsp?userId=" + userId; 
		}
	}
	
	
	function signOut() {
        if(confirm("Are you sure you want to sign out?")) {
            window.location.href = "signOut.jsp";
        }
    }
</script>

