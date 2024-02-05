<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<style>

</style>

</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	  <% String role = null;
        if (session != null && session.getAttribute("loggedin") != null) {
            role = (String) session.getAttribute("role");
            if(!"A".equals(role)) { 
                response.sendRedirect("signInUp.jsp");
                return;
            }
        } else {
            
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
    } 
	
    
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

</script>

