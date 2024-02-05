<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Retrieval</title>
</head>
<body>
    <h2>비밀번호 찾기(테스트용)</h2>
    <%
        String userid = request.getParameter("userid");
        String email = request.getParameter("email");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // Sample SQL query. Replace with actual query to fetch password
        String sql = "SELECT PASSWORD FROM ALLY_USERS WHERE USERID = ? OR EMAIL = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String password = rs.getString("PASSWORD");
                // Displaying password directly on the page, which is highly discouraged in real applications
                out.println("<p>Your password (for demonstration purposes only): " + password + "</p>");
            } else {
                out.println("<p>User not found. Please check your input and try again.</p>");
            }
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
