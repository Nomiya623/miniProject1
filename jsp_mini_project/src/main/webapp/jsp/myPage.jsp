<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>사용자 프로필</title>
    <style>
    :root {
        --main-color: #6B8E23; /* Olive Green */
        --body-bg: #FAF9F6; /* Off White */
        --second-bg: #DAD7CD; /* Light Gray */
        --text-color: #3C3C3B; /* Almost Black */
        --text-white: #ffffff; /* White */
        --text-gray: #A9A9A9; /* Gray */
        --main-hover: #556B2F; /* Dark Olive Green */
    }

    body {
        background-color: var(--body-bg);
        color: var(--text-color);
        font-family: Arial, sans-serif;
    }

    h1 {
        color: var(--main-color);
    }

    .profile-info, .action-buttons {
        margin: 10px 0;
        background-color: var(--second-bg);
        padding: 10px;
        border-radius: 8px;
    }

    .profile-label {
        font-weight: bold;
        color: var(--main-color);
    }

    .editButton, .deleteButton {
        padding: 5px 10px;
        margin: 2px;
        cursor: pointer;
        border: none;
        color: var(--text-white);
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .editButton {
        background-color: var(--main-color); /* Olive Green */
    }

    .editButton:hover {
        background-color: var(--main-hover); /* Dark Olive Green */
    }

    .deleteButton {
        background-color: #f44336; /* Red */
    }

    .deleteButton:hover {
        background-color: darken(#f44336, 10%); /* Darker Red */
    }
</style>

    
</head>
<body>
    <%
        HttpSession s = request.getSession(false);
        String userId = (session != null) ? (String) session.getAttribute("userId") : null;

        if(userId == null) {
            out.println("<p>로그인하지 않았습니다. 먼저 로그인해 주세요.</p>");
        } else {
            try {
                String query = "SELECT u.USERID, u.EMAIL, u.FULLNAME, u.AGE, u.GENDER, u.SKINTYPE, p.PRODUCT_TYPE, h.AMOUNT FROM ALLY_USERS u LEFT JOIN ALLY_PURCHASE_HISTORY h ON u.USERID = h.USERID LEFT JOIN ALLY_PRODUCTS p ON h.ITEMID = p.ITEMID WHERE u.USERID = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();

                if(!rs.next()) {
                    out.println("<p>" + userId + " 사용자의 구매 기록을 찾을 수 없습니다.</p>");
                } else {
                    %>
                    <h1>내 정보</h1>
                    <div class="profile-info">
                        <span class="profile-label">사용자 ID:</span> <%= userId %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">이메일:</span> <%= rs.getString("EMAIL") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">이름:</span> <%= rs.getString("FULLNAME") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">나이:</span> <%= rs.getInt("AGE") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">성별:</span> <%= rs.getString("GENDER") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">피부 타입:</span> <%= rs.getString("SKINTYPE") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">구매 제품명:</span> <%= rs.getString("PRODUCT_TYPE") %>
                    </div>
                    <div class="profile-info">
                        <span class="profile-label">주문금액:</span> <%= rs.getDouble("AMOUNT") %>
                    </div>
                    <div class="action-buttons">
                        <input type="button" onclick="userUpdate('<%= userId %>')" value="내정보 수정" class="editButton">
                        <input type="button" onclick="userDelete('<%= userId %>')" value="회원탈퇴" class="deleteButton">
                    </div>
                    <%
                }
            } catch(Exception e) {
                out.println("<p>오류: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                try { if(conn != null) conn.close(); } catch(SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    <script>
        function userUpdate(userId) {
            var confirmation = confirm('회원 정보를 수정하시겠습니까?');
            if(confirmation) {
                location.href = 'userList_update.jsp?userId=' + userId;
            }
        }
        function userDelete(userId) {
            var confirmation = confirm('회원탈퇴를 하시겠습니까?');
            if(confirmation) {
                location.href = 'userList_delete.jsp?userId=' + userId;
            }
        }
    </script>
</body>
</html>


