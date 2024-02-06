<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/sub.css" />
    <meta charset="UTF-8">
    <title>장바구니 추가</title>
</head>
<body>
    <%
        HttpSession s = request.getSession(false); 
        if(session != null && session.getAttribute("userId") != null) {
        	
            String userId = session.getAttribute("userId").toString(); 
            String itemid = request.getParameter("itemid");
            String quantity = request.getParameter("quantity");
            
            if(itemid != null && quantity != null && !itemid.isEmpty() && !quantity.isEmpty()) {
                
                PreparedStatement pstmt = null;
                try {
                    
                    String insertQuery = "INSERT INTO ally_cart (userId, itemId, quantity) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(insertQuery);
                    pstmt.setString(1, userId);
                    pstmt.setInt(2, Integer.parseInt(itemid));
                    pstmt.setInt(3, Integer.parseInt(quantity));
                    
                    int result = pstmt.executeUpdate();
                    if(result > 0) {
                        out.println("<p>상품이 장바구니에 성공적으로 추가되었습니다.</p>");
                    } else {
                        out.println("<p>장바구니에 상품을 추가하지 못했습니다.</p>");
                    }
                } catch(SQLException e) {
                    out.println("<p>데이터베이스 오류: " + e.getMessage() + "</p>");
                } finally {
                    if(pstmt != null) try { pstmt.close(); } catch(SQLException e) { /* 예외 처리 */ }
                    if(conn != null) try { conn.close(); } catch(SQLException e) { /* 예외 처리 */ }
                }
            } else {
                out.println("<p>잘못된 상품 ID 또는 수량입니다.</p>");
            }
        } else {
            out.println("<p>먼저 로그인해 주세요.</p>");
            
        }
    %>
</body>
</html>
