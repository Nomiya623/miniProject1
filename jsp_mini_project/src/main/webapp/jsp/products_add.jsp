<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 추가</title>
</head>
<body>
    <h1>제품 추가</h1>
    <form action="products_add_process.jsp" method="post">
        <label for="productType">제품명:</label>
        <input type="text" id="productType" name="productType" required><br><br>
        <label for="features">상세 설명:</label>
        <textarea id="features" name="features" required></textarea><br><br>
        <label for="price">가격:</label>
        <input type="number" id="price" name="price" step="0.01" required><br><br>
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" required><br><br>
        <input type="submit" value="제품 추가">
    </form>
</body>
</html>
