<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User ID Check</title>
    <style>
    body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 20px;
            font-size: 14px;
        }
        .message {
            margin: 20px 0;
            padding: 10px;
            border-radius: 5px;
            color: #FFFFFF;
            text-align: center;
        }
        .available {
            background-color: #4CAF50; /* Green for available IDs */
        }
        .unavailable {
            background-color: #f44336; /* Red for unavailable IDs */
        }
        input[type="button"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50; /* Blue for the button */
            color: white;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #005f73;
        }
        </style>
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
