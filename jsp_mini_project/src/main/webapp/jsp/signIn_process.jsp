<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="../db/dbconn.jsp"%>

<%
PreparedStatement pstmt = null; // Ensure pstmt is declared outside the try block
ResultSet rs = null; // Also declare ResultSet here for proper scope
try {
    String userId = request.getParameter("userId");
    String password = request.getParameter("pwd"); // Reminder: hashing should be used in real applications
    String sql = "SELECT role, password FROM ally_users WHERE userId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userId);

    rs = pstmt.executeQuery();
    if (rs.next()) {
        String storedPassword = rs.getString("password");
        String userRole = rs.getString("role");

        boolean passwordMatch = password.equals(storedPassword); // This should be replaced with a proper password verification mechanism

        if (passwordMatch) {
            session.setAttribute("userId", userId);
            session.setAttribute("loggedin", true);
            session.setAttribute("role", userRole);
            
            String redirectPage = "main.jsp"; // Change as needed
            response.sendRedirect(redirectPage);
        } else {
            response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("Invalid username or password.", "UTF-8"));
        }
    } else {
        response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("Invalid username or password.", "UTF-8"));
    }
} catch (SQLException e) {
    e.printStackTrace(); // Log or handle the SQL exception
    response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("Database error occurred.", "UTF-8"));
} catch (Exception e) {
    e.printStackTrace(); // Log or handle the general exception
    response.sendRedirect("signInUp.jsp?message=" + URLEncoder.encode("An error occurred.", "UTF-8"));
} finally {
    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
