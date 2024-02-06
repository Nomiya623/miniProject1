<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문내역</title>
    <!-- Styles -->
    <style>
        :root {
            --text-color: #333;
            --bg-color: #f5f5f5;
            --table-border-color: #ddd;
            --table-header-bg: #6B8E23;
            --table-header-color: #495057;
            --hover-bg-color: #f2f2f2;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-color);
            background-color: var(--bg-color);
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid var(--table-border-color);
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: var(--table-header-bg);
            color: var(--table-header-color);
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: var(--hover-bg-color);
        }
    </style>
</head>
<body>
    <h1>주문내역</h1>
    <table>
        <thead>
            <tr>
                <th>주문ID</th>
                <th>사용자ID</th>
                <th>아이템ID</th>
                <th>주문날짜</th>
                <th>구매 제품명</th>
                <th>주문 금액</th>
            </tr>
        </thead>
        <tbody>
            <%
                String query = "SELECT h.PURCHASEID, h.USERID, h.ITEMID, h.PURCHASEDATE, p.PRODUCT_TYPE, h.AMOUNT " +
                               "FROM ALLY_PURCHASE_HISTORY h " +
                               "JOIN ALLY_PRODUCTS p ON h.ITEMID = p.ITEMID " +
                               "ORDER BY h.PURCHASEDATE DESC";
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while(rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("PURCHASEID") %></td>
                            <td><%= rs.getString("USERID") %></td>
                            <td><%= rs.getString("ITEMID") %></td>
                            <td><%= rs.getDate("PURCHASEDATE").toString() %></td>
                            <td><%= rs.getString("PRODUCT_TYPE") %></td>
                            <td><%= rs.getDouble("AMOUNT") %></td>
                        </tr>
            <%
                    }
                } catch(SQLException e) {
                    out.println("SQL Exception: " + e.getMessage());
                } finally {
                    if (rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
                }
            %>
        </tbody>
    </table>
</body>
</html>
