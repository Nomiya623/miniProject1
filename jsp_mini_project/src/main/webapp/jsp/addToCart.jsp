<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <script>
        function addToCart() {
            alert("This will add the item to your cart. Implement backend logic to handle cart.");
            // Implement AJAX or form submission to server-side logic here.
        }
        
        function checkout() {
            alert("This will proceed to checkout. Implement backend logic for checkout.");
            // Implement AJAX or form submission to server-side logic here.
        }
    </script>
</head>
<body>
    <h1>제품 상세 정보</h1>
    <% 
        String itemid = request.getParameter("itemid");
        if(itemid != null && !itemid.isEmpty()) {
            String query = "SELECT * FROM ALLY_PRODUCTS WHERE ITEMID = ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(itemid));
                rs = pstmt.executeQuery();
                if(rs.next()) {
    %>
                    <div>
                        <strong>제품명:</strong> <%= rs.getString("PRODUCT_TYPE") %><br>
                        <strong>상세 설명:</strong> <%= rs.getString("FEATURES") %><br>
                        <strong>수량:</strong> <%= rs.getInt("QUANTITY") %><br>
                        <strong>가격:</strong> <%= rs.getDouble("PRICE") %>원<br>
                        <button onclick="addToCart()">장바구니에 추가하기</button>
                        <button onclick="checkout()">바로구매</button>
                    </div>
    <%
                } else {
                    out.println("<p>제품 정보를 찾을 수 없습니다.</p>");
                }
            } catch(SQLException e) {
                out.println("<p>SQL Error: " + e.getMessage() + "</p>");
            } finally {
                if(rs != null) try { rs.close(); } catch(Exception e) {}
                if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            }
        } else {
            out.println("<p>잘못된 제품 ID입니다.</p>");
        }
    %>
</body>
</html>
