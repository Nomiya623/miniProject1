<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="java.net.URLEncoder, java.sql.*" %>

<%
String userId = request.getParameter("userId");
if(userId != null && !userId.trim().isEmpty()) {
    try {
        // 새로운 비밀번호 설정, 실제 환경에서는 보안적으로 안전한 해싱 방식 사용
        String newPassword = "defaultPassword123"; // 이 부분은 보안을 위해 해시 처리 필요
        String sql = "UPDATE ALLY_USERS SET PASSWORD = ? WHERE USERID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newPassword); // 비밀번호 해시 적용
        pstmt.setString(2, userId);
        int rowsAffected = pstmt.executeUpdate();
        if(rowsAffected > 0) {
            // 비밀번호 재설정 성공
            response.sendRedirect("userList.jsp?status=resetSuccess&userId=" + URLEncoder.encode(userId, "UTF-8") + "&message=" + URLEncoder.encode("비밀번호가 재설정되었습니다.", "UTF-8"));
        } else {
            // 사용자를 찾을 수 없음
            response.sendRedirect("userList.jsp?status=resetFail&userId=" + URLEncoder.encode(userId, "UTF-8") + "&message=" + URLEncoder.encode("해당 사용자를 찾을 수 없습니다.", "UTF-8"));
        }
    } catch(SQLException e) {
        e.printStackTrace();
        // 데이터베이스 오류 처리
        response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("데이터베이스 오류: " + e.getMessage(), "UTF-8"));
    } finally {
        if(conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
} else {
    // 사용자 ID 누락
    response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("비밀번호 재설정을 위한 사용자 ID가 누락되었습니다.", "UTF-8"));
}
%>
