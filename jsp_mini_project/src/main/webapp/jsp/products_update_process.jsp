<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product Process</title>
</head>
<body>
<%
    String itemID = request.getParameter("itemid");
    String product_type = request.getParameter("product_type"); // Corrected column name
    String features = request.getParameter("features");
    String priceStr = request.getParameter("price");
    String quantityStr = request.getParameter("quantity");

    if(product_type != null && features != null && priceStr != null && quantityStr != null) {
        double price = Double.parseDouble(priceStr);
        int quantity = Integer.parseInt(quantityStr);

        String sql = "UPDATE ALLY_PRODUCTS SET PRODUCT_TYPE=?, FEATURES=?, PRICE=?, QUANTITY=? WHERE ITEMID=?";

        try(
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, product_type);
            pstmt.setString(2, features);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, quantity);
            pstmt.setString(5, itemID);

            int rowsAffected = pstmt.executeUpdate();

            if(rowsAffected > 0) {
                out.println("<script>alert('제품 정보가 성공적으로 업데이트되었습니다.'); location.href='products.jsp';</script>");
            } else {
                out.println("<script>alert('제품 정보 업데이트에 실패했습니다.'); history.back();</script>");
            }
        } catch(SQLException e) {
            out.println("<script>alert('SQL 오류: " + e.getMessage() + "'); history.back();</script>");
        } catch(Exception e) {
            out.println("<script>alert('오류: " + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('모든 필드를 채워주세요.'); history.back();</script>");
    }
%>
</body>
</html>
