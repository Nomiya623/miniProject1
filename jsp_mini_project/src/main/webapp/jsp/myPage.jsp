<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
        .editButton, .deleteButton {
            padding: 5px 10px;
            margin: 2px;
            cursor: pointer;
        }
        .editButton {
            background-color: #4CAF50; /* Green */
            color: white;
        }
        .deleteButton {
            background-color: #f44336; /* Red */
            color: white;
        }
    </style>
</head>
<body>
     <%
        HttpSession s = request.getSession(false);
        String userId = (session != null) ? (String) session.getAttribute("userId") : null;

        if(userId == null) {
            out.println("<p>User not logged in. Please login first.</p>");
        } else {
            try {
                String query = "SELECT u.USERID, u.EMAIL, u.FULLNAME, u.AGE, u.GENDER, u.SKINTYPE, p.PRODUCT_TYPE, h.AMOUNT FROM ALLY_USERS u LEFT JOIN ALLY_PURCHASE_HISTORY h ON u.USERID = h.USERID LEFT JOIN ALLY_PRODUCTS p ON h.ITEMID = p.ITEMID WHERE u.USERID = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();

                if(!rs.next()) {
                    out.println("<p>No purchase records found for user: " + userId + "</p>");
                } else {
                    %>
                    <h1> 내 정보 </h1>
                    <table>
                        <tr>
                            <th>User ID</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Skin Type</th>
                            <th>Product Type</th>
                            <th>Amount</th>
                            <th>Actions</th>
                        </tr>
                        <%
                            while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("USERID") %></td>
                            <td><%= rs.getString("EMAIL") %></td>
                            <td><%= rs.getString("FULLNAME") %></td>
                            <td><%= rs.getInt("AGE") %></td>
                            <td><%= rs.getString("GENDER") %></td>
                            <td><%= rs.getString("SKINTYPE") %></td>
                            <td><%= rs.getString("PRODUCT_TYPE") %></td>
                            <td><%= rs.getDouble("AMOUNT") %></td>
                            <td>
                                <input type="button" onclick="userUpdate('<%= rs.getString("USERID") %>')" value="수정" class="editButton">
                                <input type="button" onclick="userDelete('<%= rs.getString("USERID") %>')" value="삭제" class="deleteButton">
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <%
                }
            } catch(Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                try { if(conn != null) conn.close(); } catch(SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    <script>
        function userUpdate(userId) {
            
            location.href = 'userList_update.jsp?userId=' + userId;
        }
        function userDelete(userId) {
            var confirmation = confirm('Are you sure you want to delete this user?');
            if(confirmation) {
               
                location.href = 'userList_delete.jsp?userId=' + userId;
            }
        }
    </script>
</body>
</html>
