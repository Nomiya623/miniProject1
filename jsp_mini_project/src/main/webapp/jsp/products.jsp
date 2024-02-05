
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품리스트</title>
    <!-- Styles -->
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1>제품 리스트</h1>
    <table>
        <thead>
            <tr>
                <th>아이템ID</th>
                <th>제품명</th>
                <th>상세 설명</th>
				<th>수량</th>
                <th>가격</th>
                <th>수정</th> 
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <%
                String query = "SELECT ITEMID, PRODUCT_TYPE, FEATURES, PRICE, QUANTITY FROM ALLY_PRODUCTS ORDER BY ITEMID";
                try {
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    ResultSet rs = pstmt.executeQuery();

                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("ITEMID") %></td>
                            <td><%= rs.getString("PRODUCT_TYPE") %></td>
                            <td><%= rs.getString("FEATURES") %></td>
                            <td><%= rs.getString("quantity") %></td>
                            <td><%= rs.getDouble("PRICE") %></td>
                            <td>
                                <form action="products_update.jsp" method="GET">
                                    <input type="hidden" name="itemid" value="<%= rs.getInt("ITEMID") %>" />
                                    <button type="submit">수정</button>
                                </form>
                            </td>
							<td>
                                <form action="products_delete.jsp" method="GET">
                                    <input type="hidden" name="itemid" value="<%= rs.getInt("ITEMID") %>" />
                                    <button type="submit">삭제</button>
                                </form>
                            </td>
                        </tr>
                        <%
                    }
                } catch(SQLException e) {
                    out.println("SQL Exception: " + e.getMessage());
                } finally {
                    try { if(conn != null) conn.close(); } catch(Exception e) { /* Ignored */ }
                }
            %>
        </tbody>
    </table>
    
    <button onclick= "window.location.href= 'products_add.jsp'">제품 추가</button>
</body>
</html>