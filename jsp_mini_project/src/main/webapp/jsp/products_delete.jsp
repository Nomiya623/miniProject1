<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 삭제 확인</title>
     <style>
        :root {
            --main-color: #6B8E23; /* Olive Green */
            --body-bg: #FAF9F6; /* Off White */
            --second-bg: #FFF; /* White for a clean look */
            --card-bg: #EFEDEA; /* A softer, lighter shade for card backgrounds */
            --text-color: #3C3C3B; /* Almost Black */
            --text-white: #ffffff; /* White */
            --text-gray: #A9A9A9; /* Gray */
            --main-hover: #556B2F; /* Dark Olive Green */
            --border-color: #DDD; /* Light border for subtle definition */
            --alert-color: #f44336; /* Red for alert actions */
        }

        body {
            background-color: var(--body-bg);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: var(--second-bg);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: var(--main-color);
            margin-bottom: 20px;
        }

        button {
            background-color: var(--alert-color); /* Red */
            color: var(--text-white);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: darken(var(--alert-color), 10%);
        }
    </style>
    
    
    <script>
        
        function confirmDeletion(itemid) {
            var confirmAction = confirm("정말 삭제하시겠습니까?");
            if (confirmAction) {
               
                window.location.href = "products_delete.jsp?confirm=true&itemid=" + itemid;
            } else {
               
                alert("삭제가 취소되었습니다.");
            }
        }
    </script>
</head>
<body>
    <% 
        String confirm = request.getParameter("confirm");
        String itemid = request.getParameter("itemid");
        if("true".equals(confirm) && itemid != null && !itemid.trim().isEmpty()) {
            PreparedStatement pstmt = null;
            try {
                String query = "DELETE FROM ALLY_PRODUCTS WHERE ITEMID = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(itemid));
                int rowsAffected = pstmt.executeUpdate();
                if(rowsAffected > 0) {
                    out.println("<script>alert('제품이 삭제되었습니다.'); location.href='products.jsp';</script>");
                } else {
                    out.println("<script>alert('제품 삭제 실패.'); history.back();</script>");
                }
            } catch(SQLException e) {
                out.println("SQL Exception: " + e.getMessage());
            } finally {
                if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }}
                if(conn != null) { try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }}
            }
        }
    %>
    
    <h2>제품 삭제 확인</h2>
    <button onclick="confirmDeletion('<%= request.getParameter("itemid") %>')">삭제 확인</button>
</body>
</html>
