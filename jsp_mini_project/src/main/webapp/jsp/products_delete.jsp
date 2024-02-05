<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 삭제 확인</title>
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
