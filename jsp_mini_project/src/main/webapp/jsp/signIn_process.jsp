<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="../db/dbconn.jsp"%> 

<%
String userId = request.getParameter("userId");
String pwd = request.getParameter("pwd"); // Ensure the name 'pwd' matches your form's password field name

try {
    
    String sql = "SELECT role FROM ally_users WHERE userId = ? AND password = ?";
    
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, userId);
        pstmt.setString(2, pwd);
        
        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                String userRole = rs.getString("role");
                
                if ("admin".equalsIgnoreCase(userRole)) {
                    response.sendRedirect("userList.jsp");
                } else {
                    
                    response.sendRedirect("signIn_view.jsp?userId=" + URLEncoder.encode(userId, "UTF-8"));
                }
            } else {
               
                out.println("<script>alert('Invalid username or password.'); history.back();</script>");
            }
        } 
    } 
} catch (SQLException e) {
    throw new ServletException("DB error: " + e.getMessage(), e);
} catch (Exception e) {
    throw new ServletException("Error: " + e.getMessage(), e);
} finally {
    if (conn != null) {
        try {
            conn.close(); 
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>
