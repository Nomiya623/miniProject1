<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User ID Check</title>
</head>
<body>
    <%@ include file="../db/dbconn.jsp"%>
    <%
        String userId = request.getParameter("userId");
        if (userId != null && !userId.trim().isEmpty()) {
            String sql = "SELECT * FROM ALLY_USERS WHERE USERID = ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    out.println("중복된 아이디가 있습니다.");
                } else {
                    out.println("사용가능한 아이디입니다.");
                }
            } catch (SQLException e) {
                out.println("오류가 발생했습니다: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
            }
        }
    %>
    <input type="button" value="닫기" onclick="popClose('<%= userId %>')">
</body>
</html>
<script>
    function popClose(userId) {
        if (opener && !opener.closed && opener.document.join) {
            opener.document.join.userId.value = userId;
        }
        window.close();
    }
</script>
