<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 추가 페이지</title>
</head>
<body>
<%
    String productType = request.getParameter("productType");
    String features = request.getParameter("features");
    String priceStr = request.getParameter("price");
    String quantityStr = request.getParameter("quantity");

    if(productType != null && features != null && priceStr != null && quantityStr != null) {
        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);
            
            String query = "INSERT INTO ALLY_PRODUCTS (ITEMID, PRODUCT_TYPE, FEATURES, PRICE, QUANTITY) VALUES (ally_products_seq.NEXTVAL, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, productType);
            pstmt.setString(2, features);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, quantity);

            int result = pstmt.executeUpdate();

            if(result > 0) {
                
                out.println("<script type='text/javascript'>");
                out.println("alert('제품이 추가되었습니다.');");
                out.println("window.location.href='products.jsp';");
                out.println("</script>");
            } else {
                out.println("<script>alert('Failed to add the product.'); history.back();</script>");
            }
        } catch(SQLException e) {
            out.println("<script>alert('SQL Error: " + e.getMessage() + "'); history.back();</script>");
        } catch(Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "'); history.back();</script>");
        } finally {
            if(conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<script>alert('Please fill all the fields.'); history.back();</script>");
    }
%>
</body>
</html>
