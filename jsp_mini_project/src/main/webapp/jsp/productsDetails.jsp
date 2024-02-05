<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
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
                    <form action="addToCart.jsp" method="post"> 
                        <input type="hidden" name="itemid" value="<%= rs.getInt("ITEMID") %>" />
                        <p>제품명: <input type="text" name="product_type" value="<%= rs.getString("PRODUCT_TYPE") %>" readonly /></p>
                        <p>상세 설명: <textarea name="features" readonly><%= rs.getString("FEATURES") %></textarea></p>
                        <p>수량: <input type="number" name="quantity" value="<%= rs.getInt("QUANTITY") %>" /></p>
                        <p>가격: <input type="text" name="price" value="<%= rs.getDouble("PRICE") %>" readonly /></p>
                        <button type="submit" name="action" value="addToCart">장바구니에 추가하기</button>
                        <button type="submit" name="action" value="checkout">바로구매</button>
                    </form>
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
