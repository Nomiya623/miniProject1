<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="java.net.URLEncoder" %>

<%
String userId = request.getParameter("userId");
if(userId != null && !userId.trim().isEmpty()) {
    try {
        String sql = "DELETE FROM ALLY_USERS WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        int rowsAffected = pstmt.executeUpdate();
        if(rowsAffected > 0) {
            response.sendRedirect("userList.jsp?status=deleteSuccess");
        } else {
            response.sendRedirect("userList.jsp?status=deleteFail");
        }
    } catch(SQLException e) {
        e.printStackTrace();
        
        response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        if(conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
} else {
    
    response.sendRedirect("userList.jsp?status=error&message=Missing%20user%20ID");
}
%>
