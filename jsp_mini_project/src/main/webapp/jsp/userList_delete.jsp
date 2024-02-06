<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="java.net.URLEncoder, java.sql.*" %>

<%
String userId = request.getParameter("userId");
if(userId != null && !userId.trim().isEmpty()) {
    try {
        String sql = "DELETE FROM ALLY_USERS WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        int rowsAffected = pstmt.executeUpdate();
        if(rowsAffected > 0) {
            // 삭제 성공 시
            response.sendRedirect("userList.jsp?status=deleteSuccess&message=" + URLEncoder.encode("사용자 삭제 성공", "UTF-8"));
        } else {
            // 사용자가 존재하지 않을 경우
            response.sendRedirect("userList.jsp?status=deleteFail&message=" + URLEncoder.encode("해당 사용자를 찾을 수 없습니다.", "UTF-8"));
        }
    } catch(SQLException e) {
        e.printStackTrace();
        // 데이터베이스 오류 발생 시
        response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("데이터베이스 오류: " + e.getMessage(), "UTF-8"));
    } finally {
        if(conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
} else {
    // 사용자 ID가 제공되지 않았을 경우
    response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("사용자 ID가 누락되었습니다.", "UTF-8"));
}
%>
