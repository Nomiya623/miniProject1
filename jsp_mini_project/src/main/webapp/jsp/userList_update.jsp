<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../db/dbconn.jsp"%>
<%
String userId = request.getParameter("userId");
ResultSet user = null; 
try {
    if(userId != null && !userId.trim().isEmpty()) {
        String sql = "SELECT * FROM ALLY_USERS WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        user = pstmt.executeQuery();
    }
} catch(SQLException e) {
    e.printStackTrace();
    
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Information</title>
    <!-- Add your CSS here -->
</head>
<body>
<% if(user != null && user.next()) { %>
    <h2>Update User Information</h2>
    <form action="userUpdate_process.jsp" method="post">
        <input type="hidden" name="userId" value="<%= user.getString("USERID") %>" />
        Email: <input type="email" name="email" value="<%= user.getString("EMAIL") %>" /><br />
        Password: <input type="password" name="password" /><br /> 
        Full Name: <input type="text" name="fullName" value="<%= user.getString("FULLNAME") %>" /><br />
        Age: <input type="number" name="age" value="<%= user.getInt("AGE") %>" /><br />
        Gender: <input type="text" name="gender" value="<%= user.getString("GENDER") %>" /><br />
        Skin Type: <input type="text" name="skinType" value="<%= user.getString("SKINTYPE") %>" /><br />
        <input type="submit" value="Update" />
    </form>
<% } else { %>
    <p>사용자를 찾을 수 없거나 사용자 ID가 누락되었습니다.</p>
<% }
   if(conn != null) {
       try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
   }
%>
</body>
</html>