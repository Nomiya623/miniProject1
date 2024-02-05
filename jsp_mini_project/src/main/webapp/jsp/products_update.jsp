<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 수정</title>
</head>
<body>
    <h1>제품 수정</h1>
    <%
        String itemid = request.getParameter("itemid");
        if(itemid != null && !itemid.isEmpty()) {
            try {
                String query = "SELECT * FROM ALLY_PRODUCTS WHERE ITEMID = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(itemid));
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()) {
                    %>
                    <form action="products_update_process.jsp" method="post">
                        <input type="hidden" name="itemid" value="<%= rs.getInt("ITEMID") %>" />
                        <p>제품명: <input type="text" name="product_type" value="<%= rs.getString("PRODUCT_TYPE") %>" /></p>
                        <p>상세 설명: <textarea name="features"><%= rs.getString("FEATURES") %></textarea></p>
						<p>수량: <input type="number" name="quantity" value="<%= rs.getInt("quantity") %>" /></p>
                        <p>가격: <input type="text" name="price" value="<%= rs.getDouble("PRICE") %>" /></p>
                        <button type="submit">수정하기</button>
                    </form>
                    <%
                }
            } catch(SQLException e) {
                out.println("SQL Exception: " + e.getMessage());
            } finally {
                try { if(conn != null) conn.close(); } catch(Exception e) { /* Ignored */ }
            }
        }
    %>
</body>
</html>
