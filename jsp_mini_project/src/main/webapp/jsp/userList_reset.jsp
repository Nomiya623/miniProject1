<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="java.net.URLEncoder" %>

<%
String userId = request.getParameter("userId");
if(userId != null && !userId.trim().isEmpty()) {
    try {
        
        String newPassword = "defaultPassword123"; // This should be securely hashed
        String sql = "UPDATE ALLY_USERS SET PASSWORD = ? WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newPassword); // Hash the password
        pstmt.setString(2, userId);
        int rowsAffected = pstmt.executeUpdate();
        if(rowsAffected > 0) {
            response.sendRedirect("userList.jsp?status=resetSuccess&userId=" + URLEncoder.encode(userId, "UTF-8"));
        } else {
            response.sendRedirect("userList.jsp?status=resetFail&userId=" + URLEncoder.encode(userId, "UTF-8"));
        }
    } catch(SQLException e) {
        e.printStackTrace();
        // Redirect or handle exception as needed
        response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        if(conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
} else {
    
    response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("Missing user ID for password reset", "UTF-8"));
}
%>
