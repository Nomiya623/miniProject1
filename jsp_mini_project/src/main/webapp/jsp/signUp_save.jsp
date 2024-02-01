<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign up save page</title>
</head>
<body>
    <%@ include file="../db/dbconn.jsp"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%
    PreparedStatement pstmt = null;
    try {
        // Retrieve form data using UTF-8 encoding
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Consider using a hashing function for security
        String fullName = request.getParameter("fullName");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender"); // Assuming direct value mapping from form to DB
        String skinType = request.getParameter("skinType"); // Assuming direct value mapping from form to DB

        int age = 0; // Default age value
        // Safely parse the age from String to int
        if (ageStr != null && !ageStr.isEmpty()) {
            try {
                age = Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                // Handle case where age is not a valid integer
                System.err.println("Age parsing error: " + e.getMessage());
                age = 0; // Default or error handling age value
            }
        }

        String sql = "INSERT INTO ALLY_USERS (USERID, EMAIL, PASSWORD, FULLNAME, AGE, GENDER, SKINTYPE) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, email);
        pstmt.setString(3, password); // Ensure to hash the password
        pstmt.setString(4, fullName);
        pstmt.setInt(5, age);
        pstmt.setString(6, gender);
        pstmt.setString(7, skinType);

        int result = pstmt.executeUpdate();
        if (result > 0) {
            out.println("<script>alert('회원 가입 완료되었습니다!'); window.location='signInUp.jsp';</script>");
        } else {
            out.println("<script>alert('회원 가입 실패. 다시 시도해 주세요.'); history.back();</script>");
        }
    } catch(Exception e) {
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    %>
</body>
</html>
