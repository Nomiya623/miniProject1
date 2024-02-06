<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="java.net.URLEncoder"%>

<%
String userId = request.getParameter("userId");
String email = request.getParameter("email");
String password = request.getParameter("password");
String fullName = request.getParameter("fullName");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String skinType = request.getParameter("skinType");

if (userId == null || userId.trim().isEmpty()) {

	response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("사용자 ID가 누락되었습니다.", "UTF-8"));
} else {
	try {

		String sql = "UPDATE ALLY_USERS SET EMAIL = ?, PASSWORD = ?, FULLNAME = ?, AGE = ?, GENDER = ?, SKINTYPE = ? WHERE USERID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		pstmt.setString(3, fullName);
		pstmt.setInt(4, Integer.parseInt(age));
		pstmt.setString(5, gender);
		pstmt.setString(6, skinType);
		pstmt.setString(7, userId);

		int rowsAffected = pstmt.executeUpdate();
		if (rowsAffected > 0) {
	response.sendRedirect("userList.jsp?status=updateSuccess");
		} else {
	response.sendRedirect("userList.jsp?status=updateFail");
		}
	} catch (SQLException e) {
		e.printStackTrace();

		response.sendRedirect("userList.jsp?status=error&message=" + URLEncoder.encode("데이터베이스 오류 발생: " + e.getMessage(), "UTF-8"));
	} finally {
		if (conn != null)
	try {
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
}
%>
