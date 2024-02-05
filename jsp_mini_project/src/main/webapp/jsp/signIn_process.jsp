<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="../db/dbconn.jsp"%>

<%
PreparedStatement pstmt = null; 
ResultSet rs = null;
try {
    String userId = request.getParameter("userId");
    String password = request.getParameter("pwd"); 
    String sql = "SELECT role, password FROM ally_users WHERE userId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userId);

    rs = pstmt.executeQuery();
    if (rs.next()) {
        String storedPassword = rs.getString("password");
        String userRole = rs.getString("role");

        boolean passwordMatch = password.equals(storedPassword); 

        if (passwordMatch) {
            session.setAttribute("userId", userId);
            session.setAttribute("loggedin", true);
            session.setAttribute("role", userRole);
            
            String redirectPage = "main.jsp";
            response.sendRedirect(redirectPage);
        } else {
            // 비밀번호 불일치 시
            response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("잘못된 사용자 이름 또는 비밀번호입니다.", "UTF-8"));
        }
    } else {
        // 사용자가 존재하지 않을 때
        response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("잘못된 사용자 이름 또는 비밀번호입니다.", "UTF-8"));
    }
} catch (SQLException e) {
    e.printStackTrace();
    // 데이터베이스 오류 발생 시
    response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("데이터베이스 오류가 발생했습니다.", "UTF-8"));
} catch (Exception e) {
    e.printStackTrace();
    // 일반적인 오류 발생 시
    response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("오류가 발생했습니다.", "UTF-8"));
} finally {
    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
